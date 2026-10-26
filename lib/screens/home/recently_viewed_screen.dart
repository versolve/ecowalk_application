import 'package:flutter/material.dart';

import 'detail_wisata_screen.dart';

class RecentlyViewedScreen extends StatelessWidget {
  const RecentlyViewedScreen({super.key});

  static const primaryGreen = Color(0xFF176B5B);

  @override
  Widget build(BuildContext context) {
    const list = [
      (
        'Dunia Fantasi (DUFAN)',
        'lib/assets/images/dufan.jpg',
        'Ancol, Jakarta Utara',
        'Rp. 190.000 - Rp. 400.000',
      ),
      (
        'Taman Mini Indonesia Indah (TMII)',
        'lib/assets/images/tmii.jpg',
        'Jakarta Timur',
        'Mulai dari Rp. 35.000',
      ),
      (
        'Taman Safari Indonesia',
        'lib/assets/images/taman_safari.jpg',
        'Bogor, Jawa Barat',
        'Mulai dari Rp. 170.000',
      ),
    ];

    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: primaryGreen,
        foregroundColor: Colors.white,
        title: const Text('Terakhir Dilihat'),
      ),
      body: ListView.separated(
        padding: const EdgeInsets.all(16),
        itemCount: list.length,
        separatorBuilder: (_, index) => const SizedBox(height: 12),
        itemBuilder: (_, index) {
          final item = list[index];
          return ListTile(
            contentPadding: EdgeInsets.zero,
            leading: ClipRRect(
              borderRadius: BorderRadius.circular(6),
              child: Image.asset(
                item.$2,
                width: 70,
                height: 70,
                fit: BoxFit.cover,
              ),
            ),
            title: Text(
              item.$1,
              style: const TextStyle(fontWeight: FontWeight.bold),
            ),
            subtitle: Text(item.$3),
            trailing: const Icon(Icons.arrow_forward_ios, size: 14),
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (_) => DetailWisataScreen(
                    name: item.$1,
                    imagePath: item.$2,
                    location: item.$3,
                    price: item.$4,
                  ),
                ),
              );
            },
          );
        },
      ),
    );
  }
}
