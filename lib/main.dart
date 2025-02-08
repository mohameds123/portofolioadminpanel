import 'package:flutter/material.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

import 'screens/admin_panel_screen.dart';

void main() async{
  await Supabase.initialize(
    url: 'https://wkruxpotmcgywoovpwzw.supabase.co',
    anonKey: 'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJpc3MiOiJzdXBhYmFzZSIsInJlZiI6IndrcnV4cG90bWNneXdvb3Zwd3p3Iiwicm9sZSI6ImFub24iLCJpYXQiOjE3MzkwMzA2MjcsImV4cCI6MjA1NDYwNjYyN30.wX6UR_xE-AyMPBcN9nKZVvKtnPuLcuz8r_c8FjxQ4_g',
  );
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      home:  AdminPanelScreen(),
    );
  }
}


