// lib/main.dart
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'main_page.dart';

void main() {
  runApp(const KlinikQApp());
}

class KlinikQApp extends StatelessWidget {
  const KlinikQApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'KlinikQ',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primarySwatch: Colors.blue,
        textTheme: GoogleFonts.poppinsTextTheme(Theme.of(context).textTheme),
        scaffoldBackgroundColor: const Color(0xFFF5F5F5),
        colorScheme: ColorScheme.fromSeed(
          seedColor: const Color(0xFF0D47A1),
          primary: const Color(0xFF1976D2),
          secondary: const Color(0xFF42A5F5),
          background: const Color(0xFFF5F5F5),
        ),
        useMaterial3: true,
      ),
      home: const MainPage(),
    );
  }
}