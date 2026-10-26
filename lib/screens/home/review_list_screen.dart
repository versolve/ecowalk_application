import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class ReviewListScreen extends StatefulWidget {
  const ReviewListScreen({super.key});

  @override
  State<ReviewListScreen> createState() => _ReviewListScreenState();
}

class _ReviewListScreenState extends State<ReviewListScreen> {
  static const primaryGreen = Color(0xFF176B5B);
  int _filter = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: primaryGreen,
        foregroundColor: Colors.white,
        title: const Text(
          'Nilai & Ulasan',
          style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
        ),
      ),
      body: ListView(
        padding: const EdgeInsets.fromLTRB(16, 18, 16, 24),
        children: [
          Row(
            crossAxisAlignment: CrossAxisAlignment.end,
            children: [
              const Text(
                '4.75',
                style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
              ),
              const SizedBox(width: 8),
              ...List.generate(
                5,
                (_) => const Icon(Icons.star, color: Colors.amber, size: 20),
              ),
              const Spacer(),
              Row(
                mainAxisSize: MainAxisSize.min,
                children: [
                  const Text(
                    'ECOWA',
                    style: TextStyle(
                      color: primaryGreen,
                      fontSize: 11,
                      fontWeight: FontWeight.w900,
                    ),
                  ),
                  SvgPicture.asset(
                    'lib/assets/icons/logo_lari.svg',
                    height: 14,
                    width: 14,
                    colorFilter: const ColorFilter.mode(
                      primaryGreen,
                      BlendMode.srcIn,
                    ),
                  ),
                  const Text(
                    'K',
                    style: TextStyle(
                      color: primaryGreen,
                      fontSize: 11,
                      fontWeight: FontWeight.w900,
                    ),
                  ),
                ],
              ),
            ],
          ),
          const SizedBox(height: 4),
          const Text('24.543 Ulasan', style: TextStyle(fontSize: 10)),
          const SizedBox(height: 18),
          Row(
            children: [
              _filterButton('Semua', 0),
              const SizedBox(width: 12),
              _filterButton('Dengan Foto', 1),
              const SizedBox(width: 12),
              _filterButton('Bintang', 2),
            ],
          ),
          const SizedBox(height: 26),
          ...List.generate(4, (_) => const _ReviewCard()),
        ],
      ),
    );
  }

  Widget _filterButton(String label, int value) {
    return ElevatedButton(
      onPressed: () => setState(() => _filter = value),
      style: ElevatedButton.styleFrom(
        backgroundColor: _filter == value ? primaryGreen : Colors.white,
        foregroundColor: _filter == value ? Colors.white : primaryGreen,
        elevation: 0,
        padding: const EdgeInsets.symmetric(horizontal: 13, vertical: 9),
        side: const BorderSide(color: primaryGreen),
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(5)),
      ),
      child: Text(label, style: const TextStyle(fontSize: 10)),
    );
  }
}

class _ReviewCard extends StatelessWidget {
  const _ReviewCard();

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(bottom: 16),
      padding: const EdgeInsets.all(14),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(8),
        boxShadow: const [
          BoxShadow(color: Colors.black12, blurRadius: 4, offset: Offset(0, 2)),
        ],
      ),
      child: const Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              CircleAvatar(radius: 11, backgroundColor: Color(0xFFD8D8D8)),
              SizedBox(width: 8),
              Text(
                'Kaisyarani Zahra',
                style: TextStyle(fontSize: 11, fontWeight: FontWeight.bold),
              ),
              Spacer(),
              DecoratedBox(
                decoration: BoxDecoration(
                  color: Color(0xFF176B5B),
                  borderRadius: BorderRadius.all(Radius.circular(3)),
                ),
                child: Padding(
                  padding: EdgeInsets.symmetric(horizontal: 5, vertical: 3),
                  child: Text(
                    '5.0 / 5.0',
                    style: TextStyle(color: Colors.white, fontSize: 7),
                  ),
                ),
              ),
            ],
          ),
          SizedBox(height: 12),
          Text(
            'pokoknya sangat bagus makcik pokoknya sangat bagus makcik pokoknya sangat bagus makcik pokoknya sangat bagus makcik pokoknya sangat bagus makcik.',
            style: TextStyle(fontSize: 8, height: 1.45),
          ),
          SizedBox(height: 8),
          Text(
            'Selengkapnya',
            style: TextStyle(color: Color(0xFF1688B0), fontSize: 8),
          ),
        ],
      ),
    );
  }
}
