import 'package:flutt_app/data/constants.dart';
import 'package:flutt_app/data/notifiers.dart';
import 'package:flutt_app/views/pages/home_page.dart';
import 'package:flutt_app/views/pages/profile_page.dart';
import 'package:flutt_app/views/pages/settings_page.dart';
import 'package:flutt_app/widgets/navbar_widget.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

List<Widget> pages = [HomePage(), ProfilePage()];

class WidgetTree extends StatelessWidget {
  const WidgetTree({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Flutter Mapp'),
        centerTitle: true,
        actions: [
          IconButton(
            icon: ValueListenableBuilder(
              valueListenable: isDarkModeNotifier,
              builder: (context, isDarkMode, child) {
                return Icon(isDarkMode ? Icons.dark_mode : Icons.light_mode);
              },
            ),
            onPressed: () async {
              isDarkModeNotifier.value = !isDarkModeNotifier.value;

              // Handle settings action
              final SharedPreferences prefs =
                  await SharedPreferences.getInstance();
              await prefs.setBool(
                KConstants.themeModeKey,
                isDarkModeNotifier.value,
              );
            },
          ),
          IconButton(
            icon: const Icon(Icons.settings),
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) {
                    return SettingsPage(title: "Settings");
                  },
                ),
              );
              // Handle settings action
            },
          ),
        ],
      ),
      body: ValueListenableBuilder(
        valueListenable: selectedPageNotifier,
        builder:
            (context, selectedPage, child) => pages.elementAt(selectedPage),
      ),
      bottomNavigationBar: NavbarWidget(),
    );
  }
}
