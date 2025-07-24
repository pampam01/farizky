//==============================================================
// 5. TAB PENCARIAN (SearchScreen) - STYLE BARU
//==============================================================
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class SearchScreen extends StatelessWidget {
  const SearchScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Cari Destinasi'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            TextField(
              style: TextStyle(color: Theme.of(context).primaryColor),
              decoration: InputDecoration(
                hintText: 'Ketik nama tempat wisata...',
                prefixIcon: Icon(Icons.search, color: Theme.of(context).primaryColor),
                filled: true,
                fillColor: Colors.white,
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(30.0),
                  borderSide: BorderSide.none,
                ),
                focusedBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(30.0),
                  borderSide: BorderSide(color: Theme.of(context).primaryColor),
                ),
              ),
            ),
            const SizedBox(height: 20),
            Expanded(
              child: Center(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Icon(Icons.travel_explore, size: 100, color: Colors.grey[300]),
                    const SizedBox(height: 16),
                    Text(
                      'Temukan Surga Tersembunyi Anda',
                      style: GoogleFonts.lora(fontSize: 18, color: Colors.grey[600]),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
