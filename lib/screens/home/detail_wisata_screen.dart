import 'package:flutter/material.dart';

import 'add_review_screen.dart';
import 'review_list_screen.dart';

class DetailWisataScreen extends StatefulWidget {
  const DetailWisataScreen({
    super.key,
    required this.name,
    required this.imagePath,
    required this.location,
    required this.price,
  });

  final String name;
  final String imagePath;
  final String location;
  final String price;

  @override
  State<DetailWisataScreen> createState() => _DetailWisataScreenState();
}

class _DetailWisataScreenState extends State<DetailWisataScreen> {
  static const primaryGreen = Color(0xFF176B5B);
  bool _isFavorite = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: primaryGreen,
        foregroundColor: Colors.white,
        title: Text(
          widget.name,
          style: const TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
        ),
      ),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Stack(
              children: [
                SizedBox(
                  height: 250,
                  width: double.infinity,
                  child: Image.asset(
                    widget.imagePath,
                    fit: BoxFit.cover,
                    errorBuilder: (_, error, stackTrace) =>
                        Container(color: const Color(0xFFB85F36)),
                  ),
                ),
                Positioned(
                  left: 16,
                  bottom: 16,
                  child: Container(
                    padding: const EdgeInsets.symmetric(
                      horizontal: 10,
                      vertical: 5,
                    ),
                    decoration: BoxDecoration(
                      color: primaryGreen,
                      borderRadius: BorderRadius.circular(6),
                    ),
                    child: const Row(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        Icon(Icons.star, color: Colors.amber, size: 14),
                        SizedBox(width: 4),
                        Text(
                          '4.75',
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: 12,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
                Positioned(
                  right: 16,
                  bottom: 12,
                  child: FloatingActionButton.small(
                    heroTag: 'favorite_button',
                    backgroundColor: primaryGreen,
                    foregroundColor: Colors.white,
                    onPressed: () => setState(() => _isFavorite = !_isFavorite),
                    child: Icon(
                      _isFavorite ? Icons.favorite : Icons.favorite_border,
                    ),
                  ),
                ),
              ],
            ),
            Padding(
              padding: const EdgeInsets.all(16),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    widget.name,
                    style: const TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  const SizedBox(height: 8),
                  const Row(
                    children: [
                      Icon(Icons.access_time, color: Colors.black54, size: 16),
                      SizedBox(width: 6),
                      Text(
                        'Open | 10:00 - 22:00',
                        style: TextStyle(fontSize: 12, color: Colors.black87),
                      ),
                    ],
                  ),
                  const SizedBox(height: 6),
                  Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const Icon(
                        Icons.location_on_outlined,
                        color: Colors.black54,
                        size: 16,
                      ),
                      const SizedBox(width: 6),
                      Expanded(
                        child: Text(
                          widget.location,
                          style: const TextStyle(
                            fontSize: 12,
                            color: Colors.black87,
                          ),
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(height: 14),
                  const Text(
                    'Dufan (Dunia Fantasi) adalah taman hiburan yang terletak di kawasan Taman Impian Ancol, Jakarta Utara. Dufan merupakan salah satu taman hiburan terbesar dan terpopuler di Indonesia.',
                    style: TextStyle(fontSize: 12, height: 1.45),
                  ),
                  const SizedBox(height: 16),
                  const Text(
                    'Harga Tiket Mulai Dari',
                    style: TextStyle(fontSize: 11, color: Colors.black54),
                  ),
                  const SizedBox(height: 6),
                  Container(
                    padding: const EdgeInsets.symmetric(
                      horizontal: 14,
                      vertical: 8,
                    ),
                    decoration: BoxDecoration(
                      color: primaryGreen,
                      borderRadius: BorderRadius.circular(6),
                    ),
                    child: Text(
                      widget.price,
                      style: const TextStyle(
                        color: Colors.white,
                        fontSize: 14,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                  const SizedBox(height: 22),
                  Row(
                    children: [
                      const Text(
                        'Nilai & Ulasan',
                        style: TextStyle(
                          fontSize: 15,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      const Spacer(),
                      TextButton(
                        onPressed: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (_) => const ReviewListScreen(),
                            ),
                          );
                        },
                        child: const Text('Lihat Semua >'),
                      ),
                    ],
                  ),
                  const SizedBox(height: 8),
                  Align(
                    alignment: Alignment.centerRight,
                    child: TextButton(
                      onPressed: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (_) => const AddReviewScreen(),
                          ),
                        );
                      },
                      child: const Text('Beri Ulasan'),
                    ),
                  ),
                  _buildReviewCard(),
                  const SizedBox(height: 24),
                  const Text(
                    'Lihat Peta',
                    style: TextStyle(fontSize: 15, fontWeight: FontWeight.bold),
                  ),
                  const SizedBox(height: 4),
                  const Text(
                    '1.68 KM dari lokasimu saat ini',
                    style: TextStyle(fontSize: 11, color: Colors.black54),
                  ),
                  const SizedBox(height: 10),
                  Container(
                    height: 140,
                    width: double.infinity,
                    decoration: BoxDecoration(
                      color: const Color(0xFFE2EFEA),
                      borderRadius: BorderRadius.circular(10),
                      border: Border.all(color: Colors.black12),
                    ),
                    child: const Center(
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Icon(Icons.map_outlined, color: primaryGreen),
                          SizedBox(width: 8),
                          Text(
                            'Peta Lokasi Wisata',
                            style: TextStyle(
                              color: primaryGreen,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildReviewCard() {
    return Container(
      width: double.infinity,
      padding: const EdgeInsets.all(12),
      decoration: BoxDecoration(
        color: const Color(0xFFF9F9F9),
        borderRadius: BorderRadius.circular(8),
        border: Border.all(color: Colors.black12),
      ),
      child: const Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              CircleAvatar(
                radius: 12,
                backgroundColor: Colors.red,
                child: Icon(Icons.person, color: Colors.white, size: 14),
              ),
              SizedBox(width: 8),
              Text(
                'Kaisyarani Zahra',
                style: TextStyle(fontSize: 12, fontWeight: FontWeight.bold),
              ),
              Spacer(),
              Text(
                '5.0 / 5.0',
                style: TextStyle(
                  fontSize: 11,
                  color: primaryGreen,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ],
          ),
          SizedBox(height: 8),
          Text(
            'pokoknya sangat bagus makcik pokoknya sangat bagus makcik pokoknya sangat bagus makcik.',
            style: TextStyle(fontSize: 11, color: Colors.black87),
          ),
        ],
      ),
    );
  }
}
