import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:myapp/detail_screen.dart';
import 'package:myapp/gallery_screen.dart';
import 'package:myapp/login_screen.dart';
import 'package:myapp/main_screen.dart';
import 'package:myapp/profile_screen.dart';
import 'package:myapp/search_screen.dart';

// =============================================================
// 0. MODEL DATA
// =============================================================
class TourismPlace {
  final String title;
  final String subtitle;
  final String imageUrl;

  const TourismPlace({
    required this.title,
    required this.subtitle,
    required this.imageUrl,
  });
}

// Fungsi utama aplikasi
void main() {
  runApp(const MyApp());
}

//==============================================================
// 1. KELAS UTAMA APLIKASI (MyApp) - TEMA BARU
//==============================================================
class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    const Color primaryColor = Color(0xFF673AB7);
    const Color accentColor = Color(0xFFFFC107);

    final ThemeData myTheme = ThemeData(
      useMaterial3: true, // Menggunakan Material 3
      colorScheme: ColorScheme.fromSeed(seedColor: primaryColor),
      primaryColor: primaryColor,
      hintColor: accentColor,
      scaffoldBackgroundColor: Colors.white,
      textTheme: TextTheme(
        displayLarge: GoogleFonts.playfairDisplay(
          fontSize: 57,
          fontWeight: FontWeight.bold,
          color: primaryColor,
        ),
        titleLarge: GoogleFonts.playfairDisplay(
          fontSize: 22,
          fontWeight: FontWeight.bold,
          color: primaryColor,
        ),
        bodyMedium: GoogleFonts.openSans(
          fontSize: 14,
          color: Colors.black87,
        ),
      ),

      // Styling untuk AppBar
            appBarTheme: AppBarTheme(
              backgroundColor: Colors.transparent, // Buat transparan untuk efek imersif
              elevation: 0,
              foregroundColor: primaryColor,
              centerTitle: true,
              titleTextStyle: GoogleFonts.lora(
                fontSize: 22,
                fontWeight: FontWeight.bold,
                color: primaryColor,
              ),
            ),

            // Styling untuk Card
            cardTheme: CardThemeData(
              elevation: 2.0,
              shadowColor: primaryColor.withOpacity(0.1),
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(15.0),
              ),
              margin: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
            ),

            // Styling untuk Elevated Button
            elevatedButtonTheme: ElevatedButtonThemeData(
              style: ElevatedButton.styleFrom(
                foregroundColor: Colors.white,
                backgroundColor: primaryColor,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(8.0),
                ),
                padding: const EdgeInsets.symmetric(
                  horizontal: 24.0,
                  vertical: 12.0,
                ),
                textStyle: GoogleFonts.openSans(
                  fontSize: 16,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),

            // Styling untuk Input Decoration (TextField, TextFormField)
            inputDecorationTheme: InputDecorationTheme(
              border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(8.0),
                borderSide: BorderSide(color: primaryColor.withOpacity(0.5)),
              ),
              focusedBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(8.0),
                borderSide: const BorderSide(color: primaryColor, width: 2.0),
              ),
              enabledBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(8.0),
                borderSide: BorderSide(color: primaryColor.withOpacity(0.5)),
              ),
              contentPadding: const EdgeInsets.symmetric(
                horizontal: 16.0,
                vertical: 12.0,
              ),
              labelStyle: GoogleFonts.openSans(color: primaryColor),
              hintStyle: GoogleFonts.openSans(color: Colors.black54),
            ),

            // Styling untuk FloatingActionButton
            floatingActionButtonTheme: const FloatingActionButtonThemeData(
              backgroundColor: accentColor,
              foregroundColor: Colors.black87,
            ),

            // Styling untuk BottomNavigationBar
            bottomNavigationBarTheme: BottomNavigationBarThemeData(
              selectedItemColor: primaryColor,
              unselectedItemColor: Colors.black54,
              selectedLabelStyle: GoogleFonts.openSans(fontWeight: FontWeight.bold),
              unselectedLabelStyle: GoogleFonts.openSans(),
              backgroundColor: Colors.white,
              elevation: 8.0,
            ),

            // Styling untuk Dialog
            dialogTheme: DialogThemeData(
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(15.0),
              ),
              backgroundColor: Colors.white,
              titleTextStyle: GoogleFonts.playfairDisplay(
                fontSize: 20,
                fontWeight: FontWeight.bold,
                color: primaryColor,
              ),
              contentTextStyle: GoogleFonts.openSans(fontSize: 14, color: Colors.black87),
            ),

            // Styling untuk Icon
            iconTheme: const IconThemeData(color: primaryColor, size: 24.0),

            // Styling untuk Divider
            dividerTheme: DividerThemeData(
              color: primaryColor.withValues(),
              thickness: 1.0,
              indent: 16.0,
              endIndent: 16.0,
            ),
          );

    return MaterialApp(
      title: 'Wisata App (Tema Baru)',
      theme: myTheme,
      initialRoute: '/login',
      routes: {
        '/login': (context) => const LoginScreen(),
        '/main': (context) => const MainScreen(),
        '/detail': (context) {
          // Extract the TourismPlace object from the arguments
          final place = ModalRoute.of(context)!.settings.arguments as TourismPlace?;
          if (place == null) {
            // Handle the case where no TourismPlace is passed
            return const ErrorScreen(message: 'Tourism place not specified.');
          }
          return DetailScreen(place: place);
        },
        '/gallery': (context) => const GalleryScreen(),
        '/search': (context) => const SearchScreen(),
        '/profile': (context) => const ProfileScreen(),
      },
    );
  }
}

class ErrorScreen extends StatelessWidget {
  final String message;

  const ErrorScreen({super.key, this.message = 'An unexpected error occurred.'});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Error'),
      ),
      body: Center(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Text(
            message,
            textAlign: TextAlign.center,
            style: const TextStyle(fontSize: 18.0, color: Colors.red),
          ),
        ),
      ),
    );
  }
}
