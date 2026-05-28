import 'package:flutter/material.dart';
import 'package:myapp/screens/auth_screen.dart';
import 'package:supabase_flutter/supabase_flutter.dart';


Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();

  await Supabase.initialize(
    url: 'https://sgundsuotnevwvcboxmv.supabase.co',
      anonKey: 'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJpc3MiOiJzdXBhYmFzZSIsInJlZiI6InNndW5kc3VvdG5ldnd2Y2JveG12Iiwicm9sZSI6ImFub24iLCJpYXQiOjE3NzkxODMwMzIsImV4cCI6MjA5NDc1OTAzMn0.rbBkErYa97C818AYJNb3Vlc2ZmsiqzMWq0vMFiIiTNg',
  );

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
      home: const AuthScreen(),
    );
  }
}