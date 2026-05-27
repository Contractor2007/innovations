import 'package:flutter/material.dart';
import 'screens/home_screen.dart';

void main() {
  runApp(const AzamTVApp());
}

class AzamTVApp extends StatelessWidget {
  const AzamTVApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'AzamTV MAX',
      theme: ThemeData(
        brightness: Brightness.dark,
        scaffoldBackgroundColor: const Color(0xFF0F0F0F),
        useMaterial3: true,
        fontFamily: 'SF Pro Display',
        colorScheme: ColorScheme.dark(
          primary: const Color(0xFFE50914),
          surface: const Color(0xFF181818),
        ),
      ),
      home: const HomeScreen(),
    );
  }
}