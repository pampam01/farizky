// lib/screens/home_screen.dart
import 'package:flutter/material.dart';
import 'package:myapp/models/doctor_model.dart';
import 'package:myapp/screens/doctor_detail_screen.dart';
import 'package:myapp/widgets/doctor_card.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  // Dummy data for top doctors
  final List<Doctor> topDoctors = const [
    Doctor(name: 'Dr. Budi Santoso', specialty: 'Dokter Jantung', imageUrl: 'https://img.freepik.com/free-photo/portrait-smiling-male-doctor_171337-1532.jpg', rating: 4.9, bio: 'Dr. Budi adalah spesialis jantung terkemuka dengan pengalaman lebih dari 15 tahun di bidang kardiologi.'),
    Doctor(name: 'Dr. Citra Lestari', specialty: 'Dokter Anak', imageUrl: 'https://img.freepik.com/free-photo/doctor-with-her-arms-crossed-white-background_1368-5790.jpg', rating: 4.8, bio: 'Dr. Citra sangat berdedikasi pada kesehatan anak dan memiliki pendekatan yang ramah serta profesional.'),
    Doctor(name: 'Dr. Rina Amelia', specialty: 'Dokter Kulit', imageUrl: 'https://t4.ftcdn.net/jpg/02/60/04/09/360_F_260040900_oO6YW1sHTnKxby4GcjCvtypUCWjnQRg5.jpg', rating: 4.9, bio: 'Spesialis dermatologi dengan fokus pada perawatan kulit kosmetik dan medis.'),
  ];

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // Welcome Banner
          Container(
            width: double.infinity,
            margin: const EdgeInsets.all(16.0),
            padding: const EdgeInsets.all(24.0),
            decoration: BoxDecoration(
              gradient: LinearGradient(
                colors: [Theme.of(context).colorScheme.primary, Theme.of(context).colorScheme.secondary],
                begin: Alignment.topLeft,
                end: Alignment.bottomRight,
              ),
              borderRadius: BorderRadius.circular(16.0),
            ),
            child: const Text(
              'Halo, Selamat Datang!\nBagaimana kabar Anda hari ini?',
              style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold, color: Colors.white),
            ),
          ),

          // Search Bar
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16.0),
            child: TextField(
              decoration: InputDecoration(
                hintText: 'Cari dokter atau artikel...',
                prefixIcon: const Icon(Icons.search),
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(12.0),
                  borderSide: BorderSide.none,
                ),
                filled: true,
                fillColor: Colors.white,
              ),
            ),
          ),
          const SizedBox(height: 24),

          // Top Doctors Section
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                const Text('Top Dokter', style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
                TextButton(
                  onPressed: () {
                     // Biasanya ini akan pindah ke tab dokter
                  },
                  child: const Text('Lihat Semua'),
                ),
              ],
            ),
          ),
          SizedBox(
            height: 220,
            child: ListView.builder(
              scrollDirection: Axis.horizontal,
              padding: const EdgeInsets.only(left: 16.0),
              itemCount: topDoctors.length,
              itemBuilder: (context, index) {
                final doctor = topDoctors[index];
                return DoctorCard(
                  doctor: doctor,
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => DoctorDetailScreen(doctor: doctor),
                      ),
                    );
                  },
                );
              },
            ),
          ),
          const SizedBox(height: 24),
        ],
      ),
    );
  }
}