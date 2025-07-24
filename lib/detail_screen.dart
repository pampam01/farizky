//==============================================================
// 7. LAYAR DETAIL (DetailScreen) - STYLE BARU
//==============================================================
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:myapp/main.dart';

class DetailScreen extends StatelessWidget {
  final TourismPlace place;

  const DetailScreen({super.key, required this.place});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // Kita tidak menggunakan AppBar di sini agar gambar bisa imersif
      // Tombol kembali akan ditambahkan secara manual di atas gambar
      body: Stack(
        children: [
          // Gambar Latar
          Image.network(
            place.imageUrl,
            height: MediaQuery.of(context).size.height * 0.5,
            width: double.infinity,
            fit: BoxFit.cover,
          ),
          // Gradient agar teks di AppBar terlihat jelas
          Container(
            height: MediaQuery.of(context).size.height * 0.5,
            decoration: const BoxDecoration(
              gradient: LinearGradient(
                begin: Alignment.topCenter,
                end: Alignment.bottomCenter,
                colors: [Colors.black54, Colors.transparent],
              )
            ),
          ),
          // Tombol Kembali
          Positioned(
            top: 40,
            left: 10,
            child: IconButton(
              icon: const Icon(Icons.arrow_back, color: Colors.white, size: 30),
              onPressed: () => Navigator.pop(context),
            ),
          ),
          // Konten Detail
          SingleChildScrollView(
            child: Column(
              children: [
                SizedBox(height: MediaQuery.of(context).size.height * 0.4), // Spacer
                Container(
                  width: double.infinity,
                  decoration: BoxDecoration(
                    color: Theme.of(context).scaffoldBackgroundColor,
                    borderRadius: const BorderRadius.vertical(top: Radius.circular(30)),
                  ),
                  child: Padding(
                    padding: const EdgeInsets.all(24.0),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          place.title,
                          style: GoogleFonts.lora(
                            fontSize: 32,
                            fontWeight: FontWeight.bold,
                            color: Theme.of(context).primaryColor,
                          ),
                        ),
                        const SizedBox(height: 16),
                        const Divider(),
                        const SizedBox(height: 16),
                        Text(
                          'Deskripsi',
                          style: GoogleFonts.lato(
                            fontSize: 20,
                            fontWeight: FontWeight.w800,
                          ),
                        ),
                        const SizedBox(height: 8),
                        Text(
                          place.subtitle,
                          textAlign: TextAlign.justify,
                          style: const TextStyle(fontSize: 16, height: 1.7),
                        ),
                        const SizedBox(height: 24),
                        ElevatedButton(
                          onPressed: () {},
                          child: const Text('Pesan Tiket Sekarang'),
                        ),
                      ],
                    ),
                  ),
                )
              ],
            ),
          )
        ],
      ),
    );
  }
}
