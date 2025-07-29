// lib/screens/doctor_list_screen.dart
import 'package:flutter/material.dart';
import 'package:myapp/models/doctor_model.dart';
import 'package:myapp/screens/doctor_detail_screen.dart';

class DoctorListScreen extends StatelessWidget {
  const DoctorListScreen({super.key});
  
  // Dummy data untuk semua dokter
  final List<Doctor> allDoctors = const [
     Doctor(name: 'Dr. Budi Santoso', specialty: 'Dokter Jantung', imageUrl: 'https://img.freepik.com/free-photo/portrait-smiling-male-doctor_171337-1532.jpg', rating: 4.9, bio: 'Dr. Budi adalah spesialis jantung terkemuka dengan pengalaman lebih dari 15 tahun di bidang kardiologi.'),
     Doctor(name: 'Dr. Citra Lestari', specialty: 'Dokter Anak', imageUrl: 'https://img.freepik.com/free-photo/doctor-with-her-arms-crossed-white-background_1368-5790.jpg', rating: 4.8, bio: 'Dr. Citra sangat berdedikasi pada kesehatan anak dan memiliki pendekatan yang ramah serta profesional.'),
     Doctor(name: 'Dr. Rina Amelia', specialty: 'Dokter Kulit', imageUrl: 'https://t4.ftcdn.net/jpg/02/60/04/09/360_F_260040900_oO6YW1sHTnKxby4GcjCvtypUCWjnQRg5.jpg', rating: 4.9, bio: 'Spesialis dermatologi dengan fokus pada perawatan kulit kosmetik dan medis.'),
     Doctor(name: 'Dr. Agung Wijaya', specialty: 'Dokter Saraf', imageUrl: 'https://www.shutterstock.com/image-photo/profile-photo-handsome-doc-with-260nw-1642222279.jpg', rating: 4.7, bio: 'Ahli neurologi yang berpengalaman dalam menangani gangguan saraf dan stroke.'),
     Doctor(name: 'Dr. Dewi Anggraini', specialty: 'Dokter Gigi', imageUrl: 'https://st2.depositphotos.com/3336365/5987/i/450/depositphotos_59871581-stock-photo-female-dentist-in-her-office.jpg', rating: 4.9, bio: 'Menyediakan layanan perawatan gigi komprehensif untuk segala usia.'),
  ];


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ListView.builder(
        padding: const EdgeInsets.all(16.0),
        itemCount: allDoctors.length,
        itemBuilder: (context, index) {
          final doctor = allDoctors[index];
          return Card(
            margin: const EdgeInsets.only(bottom: 12.0),
            child: ListTile(
              leading: CircleAvatar(
                radius: 30,
                backgroundImage: NetworkImage(doctor.imageUrl),
              ),
              title: Text(doctor.name, style: const TextStyle(fontWeight: FontWeight.bold)),
              subtitle: Text(doctor.specialty),
              trailing: Row(
                mainAxisSize: MainAxisSize.min,
                children: [
                  const Icon(Icons.star, color: Colors.amber, size: 16),
                  const SizedBox(width: 4),
                  Text(doctor.rating.toString()),
                ],
              ),
              onTap: () {
                 Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => DoctorDetailScreen(doctor: doctor),
                      ),
                    );
              },
            ),
          );
        },
      ),
    );
  }
}