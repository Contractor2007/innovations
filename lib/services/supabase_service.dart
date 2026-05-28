// services/supabase_service.dart

import 'package:supabase_flutter/supabase_flutter.dart';

class SupabaseService {
  static Future<void> initialize() async {
    await Supabase.initialize(
      url: 'https://sgundsuotnevwvcboxmv.supabase.co',
      anonKey: 'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJpc3MiOiJzdXBhYmFzZSIsInJlZiI6InNndW5kc3VvdG5ldnd2Y2JveG12Iiwicm9sZSI6ImFub24iLCJpYXQiOjE3NzkxODMwMzIsImV4cCI6MjA5NDc1OTAzMn0.rbBkErYa97C818AYJNb3Vlc2ZmsiqzMWq0vMFiIiTNg',
    );
  }

  static SupabaseClient get client => Supabase.instance.client;
}