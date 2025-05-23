import 'package:flutt_app/data/notifiers.dart';
import 'package:flutt_app/views/pages/home_page.dart';
import 'package:flutt_app/views/pages/profile_page.dart';
import 'package:flutt_app/widgets/navbar_widget.dart';
import 'package:flutter/material.dart';

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
            onPressed: () {
              // Handle settings action
              isDarkModeNotifier.value = !isDarkModeNotifier.value;
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
