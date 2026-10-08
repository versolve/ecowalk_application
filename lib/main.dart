import 'package:flutter/material.dart';

// Sesuaikan path ini dengan letak file splash_screen.dart atau login_screen.dart Anda
import 'screens/auth/splash_screen.dart'; 
import 'screens/dev_menu_screen.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Ecowalk App',
      debugShowCheckedModeBanner: false, // Menghilangkan banner "DEBUG"
      theme: ThemeData(
        // Mengatur warna dasar aplikasi menggunakan hijau Ecowalk
        colorScheme: ColorScheme.fromSeed(
          seedColor: const Color(0xFF1B5E4B),
          primary: const Color(0xFF1B5E4B),
        ),
        useMaterial3: true, // Mengaktifkan gaya Material 3 terbaru
        scaffoldBackgroundColor: Colors.white, // Latar belakang default putih
      ),
      // Halaman pertama yang dimuat saat aplikasi dibuka
      home: const SplashScreen(), //DevMenuScreen(), 
    );
  }
}