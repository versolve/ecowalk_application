import 'package:flutter/material.dart';

class AddReviewScreen extends StatefulWidget {
  const AddReviewScreen({super.key});

  @override
  State<AddReviewScreen> createState() => _AddReviewScreenState();
}

class _AddReviewScreenState extends State<AddReviewScreen> {
  static const primaryGreen = Color(0xFF176B5B);
  final _reviewController = TextEditingController();
  int _rating = 0;

  @override
  void dispose() {
    _reviewController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final ratingLabel = switch (_rating) {
      0 => 'Bagus',
      1 || 2 => 'Kurang',
      3 => 'Cukup',
      4 => 'Bagus',
      _ => 'Sangat Bagus',
    };

    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: primaryGreen,
        foregroundColor: Colors.white,
        title: const Text(
          'Beri Ulasan',
          style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
        ),
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.fromLTRB(16, 0, 16, 24),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            ClipRRect(
              borderRadius: const BorderRadius.vertical(
                bottom: Radius.circular(48),
              ),
              child: Image.asset(
                'lib/assets/images/dufan.jpg',
                height: 145,
                width: double.infinity,
                fit: BoxFit.cover,
              ),
            ),
            const SizedBox(height: 18),
            const Text(
              'Hai, Kaisyarani !',
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 4),
            const Text('bagaimana perjalananmu?'),
            const SizedBox(height: 14),
            Row(
              children: List.generate(
                5,
                (index) => IconButton(
                  key: Key('rating-${index + 1}'),
                  padding: EdgeInsets.zero,
                  constraints: const BoxConstraints(),
                  onPressed: () => setState(() => _rating = index + 1),
                  icon: Icon(
                    index < _rating ? Icons.star : Icons.star_border,
                    size: 36,
                    color: Colors.black,
                  ),
                ),
              ),
            ),
            const SizedBox(height: 2),
            Text(
              ratingLabel,
              style: const TextStyle(color: Colors.green, fontSize: 11),
            ),
            const SizedBox(height: 28),
            TextField(
              controller: _reviewController,
              maxLines: 4,
              decoration: const InputDecoration(
                hintText: 'Ketik disini ...',
                hintStyle: TextStyle(fontSize: 10, fontStyle: FontStyle.italic),
                filled: true,
                fillColor: Color(0xFFF7F7F7),
                border: InputBorder.none,
              ),
            ),
            const SizedBox(height: 24),
            const Text('Tambahkan Gambar?', style: TextStyle(fontSize: 12)),
            const SizedBox(height: 10),
            Row(
              children: [
                Container(
                  width: 62,
                  height: 62,
                  decoration: BoxDecoration(
                    border: Border.all(
                      color: Colors.black,
                      style: BorderStyle.solid,
                    ),
                  ),
                  child: const Icon(Icons.add, size: 30),
                ),
                const SizedBox(width: 12),
                ClipRRect(
                  borderRadius: BorderRadius.circular(3),
                  child: Image.asset(
                    'lib/assets/images/dufan.jpg',
                    width: 62,
                    height: 62,
                    fit: BoxFit.cover,
                  ),
                ),
              ],
            ),
            const SizedBox(height: 22),
            Row(
              children: [
                Checkbox(value: false, onChanged: (_) {}),
                const Text(
                  'Sembunyikan Nama Pengguna',
                  style: TextStyle(fontSize: 11),
                ),
              ],
            ),
            const SizedBox(height: 20),
            SizedBox(
              width: double.infinity,
              height: 46,
              child: ElevatedButton(
                onPressed: () {
                  ScaffoldMessenger.of(context).showSnackBar(
                    const SnackBar(content: Text('Ulasan berhasil dikirim.')),
                  );
                },
                style: ElevatedButton.styleFrom(
                  backgroundColor: primaryGreen,
                  foregroundColor: Colors.white,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(5),
                  ),
                ),
                child: const Text(
                  'Kirim',
                  style: TextStyle(fontWeight: FontWeight.bold),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
