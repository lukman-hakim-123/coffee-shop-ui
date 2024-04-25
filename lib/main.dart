import 'package:flutter/material.dart';

import 'presentations/pages/onboarding/get_started.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
          textSelectionTheme: const TextSelectionThemeData(
        cursorColor: Colors.white,
        selectionColor: Colors.blue,
        selectionHandleColor: Colors.blue,
      )),
      home: const GetStarted(),
    );
  }
}
