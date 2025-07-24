
//==============================================================
// 4. TAB BERANDA (HomeScreen) - STYLE BARU
//==============================================================
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:myapp/main.dart' show TourismPlace;

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  // Di dalam kelas HomeScreen
final List<TourismPlace> tourismList = const [
    TourismPlace(
      title: 'Pantai Eksotis',
      subtitle: 'Pantai indah dengan pasir putih dan air laut yang jernih.',
      imageUrl: 'https://picsum.photos/seed/beach/800/600'
    ),
    TourismPlace(
      title: 'Candi Megah',
      subtitle: 'Sebuah candi peninggalan sejarah yang menakjubkan.',
      imageUrl: 'https://picsum.photos/seed/temple/800/600'
    ),
    TourismPlace(
      title: 'Pulau Tropis',
      subtitle: 'Keindahan bawah laut yang luar biasa di pulau terpencil.',
      imageUrl: 'https://picsum.photos/seed/island/800/600'
    ),
    TourismPlace(
      title: 'Gunung Sakti',
      subtitle: 'Menikmati pemandangan matahari terbit dari puncak gunung.',
      imageUrl: 'https://picsum.photos/seed/mountain/800/600'
    ),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Jelajah Alam'),
      ),
      body: ListView.builder(
        padding: const EdgeInsets.only(top: 8.0),
        itemCount: tourismList.length,
        itemBuilder: (context, index) {
          final place = tourismList[index];
          return Card(
            child: ListTile(
              contentPadding: const EdgeInsets.all(12),
              leading: ClipRRect(
                borderRadius: BorderRadius.circular(10.0),
                child: Image.network(
                  place.imageUrl,
                  width: 80,
                  height: 80,
                  fit: BoxFit.cover,
                ),
              ),
              title: Text(
                place.title,
                style: GoogleFonts.lora(fontWeight: FontWeight.bold, fontSize: 18),
              ),
              subtitle: Padding(
                padding: const EdgeInsets.only(top: 4.0),
                child: Text(
                  place.subtitle,
                  maxLines: 2,
                  overflow: TextOverflow.ellipsis,
                ),
              ),
              onTap: () {
                Navigator.pushNamed(context, '/detail', arguments: place);
              },
            ),
          );
        },
      ),
    );
  }
}