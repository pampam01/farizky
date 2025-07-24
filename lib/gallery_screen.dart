//==============================================================
// 8. LAYAR GALERI (GalleryScreen)
//==============================================================
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:myapp/main.dart' show TourismPlace;

class GalleryScreen extends StatelessWidget {
  const GalleryScreen({super.key});

  final List<TourismPlace> galleryList = const [
    TourismPlace(title: 'Hutan Pinus', subtitle: '', imageUrl: 'https://images.unsplash.com/photo-1448375240586-882707db888b?q=80&w=2070'),
    TourismPlace(title: 'Air Terjun', subtitle: '', imageUrl: 'https://images.unsplash.com/photo-1431036101494-69a3eea47a5f?q=80&w=1974'),
    TourismPlace(title: 'Danau Tenang', subtitle: '', imageUrl: 'https://images.unsplash.com/photo-1476514525535-07fb3b4ae5f1?q=80&w=2070'),
    TourismPlace(title: 'Jalan Kota', subtitle: '', imageUrl: 'https://images.unsplash.com/photo-1449824913935-59a10b8d2000?q=80&w=2070'),
    TourismPlace(title: 'Gurun Pasir', subtitle: '', imageUrl: 'https://images.unsplash.com/photo-1473580044384-7ba9967e16a0?q=80&w=2070'),
    TourismPlace(title: 'Pedesaan', subtitle: '', imageUrl: 'https://images.unsplash.com/photo-1472214103451-9374bd1c798e?q=80&w=2070'),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Galeri Wisata'),
      ),
      body: GridView.builder(
        padding: const EdgeInsets.all(10.0),
        gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 2,
          crossAxisSpacing: 10.0,
          mainAxisSpacing: 10.0,
        ),
        itemCount: galleryList.length,
        itemBuilder: (context, index) {
          final place = galleryList[index];
          return Card(
            clipBehavior: Clip.antiAlias,
            elevation: 3,
            child: GridTile(
              footer: GridTileBar(
                backgroundColor: Colors.black54,
                title: Text(place.title, textAlign: TextAlign.center, style: GoogleFonts.lato(fontWeight: FontWeight.bold)),
              ),
              child: Image.network(
                place.imageUrl,
                fit: BoxFit.cover,
                loadingBuilder: (context, child, loadingProgress) {
                  if (loadingProgress == null) return child;
                  return const Center(child: CircularProgressIndicator());
                },
                errorBuilder: (context, error, stackTrace) => const Icon(Icons.broken_image, color: Colors.grey),
              ),
            ),
          );
        },
      ),
    );
  }
}
