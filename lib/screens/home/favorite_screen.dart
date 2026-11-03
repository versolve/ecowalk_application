import 'package:flutter/material.dart';

import 'detail_wisata_screen.dart';

class FavoriteScreen extends StatelessWidget {
  const FavoriteScreen({super.key, this.showBottomNavigation = false});

  final bool showBottomNavigation;
  static const primaryGreen = Color(0xFF176B5B);

  static const destinations = [
    (
      'Dunia Fantasi (DUFAN)',
      'Ancol, Jakarta Utara',
      'Rp. 200.000',
      'lib/assets/images/dufan.jpg',
    ),
    (
      'Taman Mini Indonesia Indah (TMII)',
      'Jakarta Timur',
      'Mulai dari Rp. 35.000',
      'lib/assets/images/tmii.jpg',
    ),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: primaryGreen,
        foregroundColor: Colors.white,
        title: const Text(
          'Favorit',
          style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
        ),
      ),
      body: ListView(
        padding: const EdgeInsets.all(16),
        children: [
          const Text(
            'Destinasi Favorit',
            style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
          ),
          const SizedBox(height: 12),
          for (final destination in destinations)
            Card(
              margin: const EdgeInsets.only(bottom: 12),
              clipBehavior: Clip.antiAlias,
              child: ListTile(
                contentPadding: const EdgeInsets.all(8),
                leading: Image.asset(
                  destination.$4,
                  width: 72,
                  height: 72,
                  fit: BoxFit.cover,
                ),
                title: Text(
                  destination.$1,
                  style: const TextStyle(fontWeight: FontWeight.bold),
                ),
                subtitle: Text('${destination.$2}\n${destination.$3}'),
                isThreeLine: true,
                trailing: const Icon(Icons.favorite, color: primaryGreen),
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (_) => DetailWisataScreen(
                        name: destination.$1,
                        imagePath: destination.$4,
                        location: destination.$2,
                        price: destination.$3,
                      ),
                    ),
                  );
                },
              ),
            ),
        ],
      ),
    );
  }
}
