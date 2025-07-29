// lib/screens/profile_screen.dart
import 'package:flutter/material.dart';

class ProfileScreen extends StatelessWidget {
  const ProfileScreen({super.key});

  // --- FUNGSI BARU UNTUK MENAMPILKAN DIALOG TIM PENGEMBANG ---
  void _showTeamDialog(BuildContext context) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: const Text('Tim Pengembang'),
          content: SizedBox(
            width: double.maxFinite,
            child: ListView(
              shrinkWrap: true,
              children: const [
                ListTile(title: Text('Rizky Amalia Putri'), subtitle: Text('8030220018')),
                ListTile(title: Text('Rofitaliza'), subtitle: Text('8030220027')),
                ListTile(title: Text('Karlina Evi Pratiwi Limbong'), subtitle: Text('8030220035')),
                ListTile(title: Text('Ferdi Anata'), subtitle: Text('8030220050')),
                ListTile(title: Text('Aisyah Al Awa Diah'), subtitle: Text('8030220058')),
                ListTile(title: Text('Raka Jumersyah Pratama'), subtitle: Text('8030220060')),
              ],
            ),
          ),
          actions: [
            TextButton(
              onPressed: () {
                Navigator.of(context).pop();
              },
              child: const Text('Tutup'),
            ),
          ],
        );
      },
    );
  }
  // -----------------------------------------------------------

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      padding: const EdgeInsets.symmetric(vertical: 20),
      child: Column(
        children: [
          const CircleAvatar(
            radius: 50,
            backgroundImage: NetworkImage('https://i.pravatar.cc/150?u=a042581f4e29026704d'),
          ),
          const SizedBox(height: 12),
          const Text('Raka', style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold)),
          Text('raka@email.com', style: TextStyle(color: Colors.grey[600], fontSize: 16)),
          const SizedBox(height: 20),
          _buildProfileMenu(context, title: 'Edit Profil', icon: Icons.edit, onTap: () {}),
          _buildProfileMenu(context, title: 'Riwayat Janji Temu', icon: Icons.history, onTap: () {}),
          
          // --- MENU BARU DITAMBAHKAN DI SINI ---
          _buildProfileMenu(
            context,
            title: 'Tim Pengembang',
            icon: Icons.group,
            onTap: () => _showTeamDialog(context), // Memanggil dialog saat diklik
          ),
          // ------------------------------------

          _buildProfileMenu(context, title: 'Pengaturan', icon: Icons.settings, onTap: () {}),
          _buildProfileMenu(context, title: 'Pusat Bantuan', icon: Icons.help_outline, onTap: () {}),
          const Divider(),
          _buildProfileMenu(
            context,
            title: 'Logout',
            icon: Icons.logout,
            textColor: Colors.red,
            onTap: () {
              showDialog(
                context: context,
                builder: (BuildContext context) => AlertDialog(
                  title: const Text('Konfirmasi Logout'),
                  content: const Text('Apakah Anda yakin ingin keluar dari akun ini?'),
                  actions: [
                    TextButton(
                      onPressed: () => Navigator.of(context).pop(),
                      child: const Text('Batal'),
                    ),
                    TextButton(
                      onPressed: () {
                        Navigator.of(context).pop();
                        ScaffoldMessenger.of(context).showSnackBar(
                          const SnackBar(content: Text('Anda telah berhasil logout')),
                        );
                      },
                      child: const Text('Yakin', style: TextStyle(color: Colors.red)),
                    ),
                  ],
                ),
              );
            },
          ),
        ],
      ),
    );
  }

  Widget _buildProfileMenu(BuildContext context, {required String title, required IconData icon, required VoidCallback onTap, Color? textColor}) {
    return ListTile(
      leading: Icon(icon, color: textColor ?? Theme.of(context).colorScheme.primary),
      title: Text(title, style: TextStyle(color: textColor, fontWeight: FontWeight.w500)),
      trailing: const Icon(Icons.arrow_forward_ios, size: 16),
      onTap: onTap,
    );
  }
}