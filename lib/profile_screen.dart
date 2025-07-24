//==============================================================
// 6. TAB PROFIL (ProfileScreen) - STYLE BARU
//==============================================================
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class ProfileScreen extends StatelessWidget {
  const ProfileScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Profil Saya'),
      ),
      body: ListView(
        padding: const EdgeInsets.all(16.0),
        children: [
          Column(
            children: [
              CircleAvatar(
                radius: 60,
                backgroundColor: Theme.of(context).primaryColor.withOpacity(0.2),
                child: CircleAvatar(
                  radius: 55,
                  backgroundImage: const NetworkImage('https://images.unsplash.com/photo-1507003211169-0a1dd7228f2d?q=80&w=1887&auto=format&fit=crop'),
                ),
              ),
              const SizedBox(height: 16),
              Text(
                'Farizki Ramandita',
                style: GoogleFonts.lora(
                  fontSize: 24,
                  fontWeight: FontWeight.bold,
                ),
              ),
              Text(
                'farizkiramandita@gmail.com',
                style: TextStyle(fontSize: 16, color: Colors.grey[600]),
              ),
            ],
          ),
          const SizedBox(height: 30),
          Card(
            child: Column(
              children: [
                ListTile(
                  leading: const Icon(Icons.edit_outlined),
                  title: const Text('Ubah Profil'),
                  trailing: const Icon(Icons.chevron_right),
                  onTap: (){},
                ),
                ListTile(
                  leading: const Icon(Icons.settings_outlined),
                  title: const Text('Pengaturan'),
                  trailing: const Icon(Icons.chevron_right),
                  onTap: (){},
                ),
                ListTile(
                  leading: const Icon(Icons.help_outline),
                  title: const Text('Pusat Bantuan'),
                  trailing: const Icon(Icons.chevron_right),
                  onTap: (){},
                ),
                 ListTile(
                  leading: const Icon(Icons.photo_library_outlined), // Gallery icon
                  title: const Text('Gallery'),
                  trailing: const Icon(Icons.chevron_right),
                  onTap: () {
                    Navigator.pushNamed(context, '/gallery'); // Navigate to gallery
                  },
                ),
              ],
            ),
          ),
          const SizedBox(height: 20),
          ElevatedButton.icon(
            icon: const Icon(Icons.logout),
            label: const Text('Keluar'),
            style: ElevatedButton.styleFrom(
              backgroundColor: Colors.red[400],
            ),
            onPressed: () {
               Navigator.pushReplacementNamed(context, '/');
            },
          )
        ],
      ),
    );
  }
}
