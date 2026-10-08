import 'package:flutter/material.dart';

import 'profile_widgets.dart';

class AboutUsScreen extends StatelessWidget {
  const AboutUsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: const ProfileAppBar(title: 'Tentang Kami'),
      body: SingleChildScrollView(
        padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 24),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Align(
              alignment: Alignment.centerRight,
              child: EcoWalkSmallLogo(),
            ),
            const SizedBox(height: 24),
            const Text(
              'ECOWALK adalah aplikasi wisata yang membantu pengguna menemukan destinasi terbaik dengan rekomendasi berdasarkan lokasi, perbandingan harga, serta informasi transportasi.',
              style: TextStyle(fontSize: 13, height: 1.6),
            ),
            const SizedBox(height: 24),
            const Text(
              'Misi Kami',
              style: TextStyle(
                fontSize: 14,
                decoration: TextDecoration.underline,
              ),
            ),
            const Text(
              'Menyediakan pengalaman wisata yang lebih mudah, informatif, dan terjangkau bagi semua orang dengan fokus pada ekowisata yang ramah lingkungan.',
              style: TextStyle(fontSize: 13, height: 1.6),
            ),
            const SizedBox(height: 24),
            const Text(
              'Apa yang Kami Tawarkan?',
              style: TextStyle(fontSize: 13),
            ),
            const Text(
              '• Rekomendasi tempat wisata berdasarkan lokasi dan preferensi Anda.\n'
              '• Informasi harga tiket, ketersediaan fasilitas, dan ulasan pengguna.\n'
              '• Peta interaktif untuk membantu navigasi di area wisata.\n'
              '• Perbandingan harga transportasi untuk perjalanan yang lebih hemat.\n\n'
              'Kami percaya bahwa menjelajahi dunia harus menjadi pengalaman yang menyenangkan dan mudah diakses oleh semua orang, dengan tetap menjaga kelestarian lingkungan.\n'
              'Untuk pertanyaan atau saran, hubungi kami di:',
              style: TextStyle(fontSize: 13, height: 1.6),
            ),
            const SizedBox(height: 20),
            const Row(
              children: [
                Icon(Icons.email, size: 20),
                SizedBox(width: 14),
                Text('support@ecowalk.com', style: TextStyle(fontSize: 13)),
              ],
            ),
            const SizedBox(height: 16),
            const Row(
              children: [
                Icon(Icons.phone, size: 20),
                SizedBox(width: 14),
                Text('0899-1234-4567', style: TextStyle(fontSize: 13)),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
