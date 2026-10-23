import 'package:flutter/material.dart';

import 'detail_wisata_screen.dart';

class CategoryScreen extends StatefulWidget {
  const CategoryScreen({super.key, this.initialCategory = 'Semua'});

  final String initialCategory;

  @override
  State<CategoryScreen> createState() => _CategoryScreenState();
}

class _CategoryScreenState extends State<CategoryScreen> {
  static const primaryGreen = Color(0xFF176B5B);
  static const categories = [
    'Semua',
    'Kuliner',
    'Sejarah',
    'Alam',
    'Religi',
    'Seni',
  ];
  late String _category;
  String _sort = 'Rekomendasi';
  bool _hasFilter = false;

  final _destinations = const [
    _CategoryDestination(
      name: 'Dunia Fantasi (DUFAN)',
      category: 'Seni',
      location: 'Ancol, Jakarta Utara',
      price: 'Rp. 190.000 - Rp. 400.000',
      imagePath: 'lib/assets/images/dufan.jpg',
      rating: 4.75,
    ),
    _CategoryDestination(
      name: 'Taman Mini Indonesia Indah (TMII)',
      category: 'Sejarah',
      location: 'Jakarta Timur',
      price: 'Mulai dari Rp. 35.000',
      imagePath: 'lib/assets/images/tmii.jpg',
      rating: 4.65,
    ),
    _CategoryDestination(
      name: 'Taman Safari Indonesia',
      category: 'Alam',
      location: 'Bogor, Jawa Barat',
      price: 'Mulai dari Rp. 170.000',
      imagePath: 'lib/assets/images/taman_safari.jpg',
      rating: 4.85,
    ),
  ];

  @override
  void initState() {
    super.initState();
    _category = widget.initialCategory;
  }

  List<_CategoryDestination> get _visibleDestinations {
    final result = _category == 'Semua'
        ? [..._destinations]
        : _destinations.where((item) => item.category == _category).toList();
    if (_sort == 'Rating Tertinggi') {
      result.sort((a, b) => b.rating.compareTo(a.rating));
    } else if (_sort == 'Harga Terendah') {
      result.sort((a, b) => _price(a).compareTo(_price(b)));
    }
    return result;
  }

  int _price(_CategoryDestination destination) {
    return destination.name == 'Dunia Fantasi (DUFAN)' ? 190000 : 35000;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: primaryGreen,
        foregroundColor: Colors.white,
        title: const Text(
          'Kategori Wisata',
          style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
        ),
      ),
      body: Column(
        children: [
          _buildCategoryTabs(),
          Padding(
            padding: const EdgeInsets.fromLTRB(16, 8, 16, 12),
            child: Row(
              children: [
                Expanded(
                  child: OutlinedButton.icon(
                    onPressed: _showFilterSheet,
                    icon: const Icon(Icons.tune, size: 16),
                    label: const Text('Filter'),
                  ),
                ),
                const SizedBox(width: 12),
                Expanded(
                  child: OutlinedButton.icon(
                    onPressed: _showSortSheet,
                    icon: const Icon(Icons.swap_vert, size: 18),
                    label: const Text('Urutkan'),
                  ),
                ),
              ],
            ),
          ),
          Expanded(
            child: _visibleDestinations.isEmpty
                ? const Center(child: Text('Wisata tidak ditemukan.'))
                : ListView.separated(
                    padding: const EdgeInsets.fromLTRB(16, 0, 16, 24),
                    itemCount: _visibleDestinations.length,
                    separatorBuilder: (_, index) => const SizedBox(height: 14),
                    itemBuilder: (_, index) =>
                        _buildDestinationCard(_visibleDestinations[index]),
                  ),
          ),
        ],
      ),
    );
  }

  Widget _buildCategoryTabs() {
    return SizedBox(
      height: 52,
      child: ListView.separated(
        padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
        scrollDirection: Axis.horizontal,
        itemCount: categories.length,
        separatorBuilder: (_, index) => const SizedBox(width: 18),
        itemBuilder: (_, index) {
          final category = categories[index];
          final selected = category == _category;
          return GestureDetector(
            onTap: () => setState(() => _category = category),
            child: Text(
              category,
              style: TextStyle(
                color: selected ? primaryGreen : Colors.black87,
                fontSize: 12,
                fontWeight: selected ? FontWeight.bold : FontWeight.normal,
                decoration: selected ? TextDecoration.underline : null,
                decorationColor: primaryGreen,
              ),
            ),
          );
        },
      ),
    );
  }

  Widget _buildDestinationCard(_CategoryDestination destination) {
    return InkWell(
      borderRadius: BorderRadius.circular(10),
      onTap: () {
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (_) => DetailWisataScreen(
              name: destination.name,
              imagePath: destination.imagePath,
              location: destination.location,
              price: destination.price,
            ),
          ),
        );
      },
      child: Container(
        height: 140,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10),
          boxShadow: const [
            BoxShadow(
              color: Colors.black12,
              blurRadius: 4,
              offset: Offset(0, 2),
            ),
          ],
        ),
        clipBehavior: Clip.antiAlias,
        child: Row(
          children: [
            SizedBox(
              width: 145,
              height: double.infinity,
              child: Image.asset(destination.imagePath, fit: BoxFit.cover),
            ),
            Expanded(
              child: Padding(
                padding: const EdgeInsets.all(12),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      destination.name,
                      maxLines: 2,
                      overflow: TextOverflow.ellipsis,
                      style: const TextStyle(
                        fontSize: 13,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    const SizedBox(height: 6),
                    Text(
                      destination.location,
                      maxLines: 2,
                      overflow: TextOverflow.ellipsis,
                      style: const TextStyle(
                        fontSize: 10,
                        color: Colors.black54,
                      ),
                    ),
                    const Spacer(),
                    Row(
                      children: [
                        const Icon(Icons.star, color: Colors.amber, size: 15),
                        const SizedBox(width: 4),
                        Text(
                          destination.rating.toString(),
                          style: const TextStyle(
                            fontSize: 11,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        const Spacer(),
                        const Icon(Icons.chevron_right, size: 18),
                      ],
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Future<void> _showFilterSheet() async {
    final selected = await showModalBottomSheet<bool>(
      context: context,
      builder: (sheetContext) => Padding(
        padding: const EdgeInsets.fromLTRB(20, 20, 20, 28),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text(
              'Filter Wisata',
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 18),
            CheckboxListTile(
              value: _hasFilter,
              contentPadding: EdgeInsets.zero,
              title: const Text('Wisata yang sedang buka'),
              onChanged: (value) => setState(() => _hasFilter = value ?? false),
            ),
            const SizedBox(height: 10),
            SizedBox(
              width: double.infinity,
              child: ElevatedButton(
                onPressed: () => Navigator.pop(sheetContext, true),
                style: ElevatedButton.styleFrom(
                  backgroundColor: primaryGreen,
                  foregroundColor: Colors.white,
                ),
                child: const Text('Terapkan'),
              ),
            ),
          ],
        ),
      ),
    );
    if (selected == true && mounted) setState(() {});
  }

  Future<void> _showSortSheet() async {
    await showModalBottomSheet<void>(
      context: context,
      builder: (sheetContext) => Padding(
        padding: const EdgeInsets.fromLTRB(20, 20, 20, 28),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text(
              'Urutkan Berdasarkan',
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 12),
            for (final option in [
              'Rekomendasi',
              'Rating Tertinggi',
              'Harga Terendah',
            ])
              ListTile(
                title: Text(option),
                leading: Icon(
                  option == _sort
                      ? Icons.radio_button_checked
                      : Icons.radio_button_unchecked,
                  color: primaryGreen,
                ),
                onTap: () {
                  setState(() => _sort = option);
                  Navigator.pop(sheetContext);
                },
              ),
          ],
        ),
      ),
    );
  }
}

class _CategoryDestination {
  const _CategoryDestination({
    required this.name,
    required this.category,
    required this.location,
    required this.price,
    required this.imagePath,
    required this.rating,
  });

  final String name;
  final String category;
  final String location;
  final String price;
  final String imagePath;
  final double rating;
}
