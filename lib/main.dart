import 'package:flutt_app/data/notifiers.dart';
import 'package:flutt_app/views/widget_tree.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return ValueListenableBuilder<bool>(
      valueListenable: isDarkModeNotifier,
      builder: (context, isDarkMode, child) {
        return MaterialApp(
          debugShowCheckedModeBanner: false,
          theme: ThemeData(
            colorScheme: ColorScheme.fromSeed(
              seedColor: Colors.teal,
              brightness: isDarkMode ? Brightness.light : Brightness.dark,
            ),
          ),
          home: _MyHomePagState(),
        );
      },
    );
  }
}

class _MyHomePagState extends StatefulWidget {
  const _MyHomePagState();

  @override
  State<_MyHomePagState> createState() => __MyHomePagStateState();
}

class __MyHomePagStateState extends State<_MyHomePagState> {
  @override
  Widget build(BuildContext context) {
    return WidgetTree();
  }
}
