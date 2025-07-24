//==============================================================
// 2. LAYAR LOGIN (LoginScreen)
//==============================================================
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class LoginScreen extends StatelessWidget {
  const LoginScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.topLeft,
            end: Alignment.bottomRight,
            colors: [
              // ignore: deprecated_member_use
              Theme.of(context).primaryColor.withOpacity(0.8),
              Theme.of(context).primaryColor,
            ],
          )
        ),
        child: SafeArea(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 24.0),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const Icon(
                  Icons.eco,
                  size: 100,
                  color: Colors.white,
                ),
                const SizedBox(height: 20),
                Text(
                  'Jelajah Alam',
                  style: GoogleFonts.lora(
                    fontSize: 36,
                    fontWeight: FontWeight.bold,
                    color: Colors.white,
                  ),
                ),
                const SizedBox(height: 40),
                TextField(
                  decoration: InputDecoration(
                    hintText: 'Email',
                    filled: true,
                    fillColor: Colors.white.withOpacity(0.2),
                    border: OutlineInputBorder(borderRadius: BorderRadius.circular(30), borderSide: BorderSide.none),
                    hintStyle: const TextStyle(color: Colors.white70),
                    prefixIcon: const Icon(Icons.email_outlined, color: Colors.white70),
                  ),
                  style: const TextStyle(color: Colors.white),
                ),
                const SizedBox(height: 16),
                TextField(
                  decoration: InputDecoration(
                    hintText: 'Password',
                    filled: true,
                    fillColor: Colors.white.withOpacity(0.2),
                    border: OutlineInputBorder(borderRadius: BorderRadius.circular(30), borderSide: BorderSide.none),
                    hintStyle: const TextStyle(color: Colors.white70),
                    prefixIcon: const Icon(Icons.lock_outline, color: Colors.white70),
                  ),
                  obscureText: true,
                  style: const TextStyle(color: Colors.white),
                ),
                const SizedBox(height: 24),
                ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Theme.of(context).colorScheme.secondary,
                    foregroundColor: Theme.of(context).primaryColor,
                  ),
                  onPressed: () {
                    Navigator.pushReplacementNamed(context, '/main');
                  },
                  child: const Text('Masuk'),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}