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
  String _sort = 'Direkomendasikan';

  final _destinations = const [
    _CategoryDestination(
      name: 'Dunia Fantasi (DUFAN)',
      category: 'Seni',
      location: 'Ancol, Jakarta Utara',
      price: 'Mulai dari Rp. 200.000',
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
    if (_sort == 'Ulasan Terbaik') {
      result.sort((a, b) => b.rating.compareTo(a.rating));
    } else if (_sort == 'Harga Terendah') {
      result.sort((a, b) => _price(a).compareTo(_price(b)));
    } else if (_sort == 'Harga Tertinggi') {
      result.sort((a, b) => _price(b).compareTo(_price(a)));
    }
    return result;
  }

  int _price(_CategoryDestination destination) {
    if (destination.name.startsWith('Taman Mini')) return 35000;
    if (destination.name.startsWith('Taman Safari')) return 170000;
    return 200000;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: primaryGreen,
        foregroundColor: Colors.white,
        title: const Text(
          'Kategori',
          style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
        ),
      ),
      body: Column(
        children: [
          Padding(
            padding: const EdgeInsets.fromLTRB(16, 16, 16, 10),
            child: Row(
              children: [
                Expanded(
                  child: SizedBox(
                    height: 36,
                    child: TextField(
                      decoration: InputDecoration(
                        hintText: 'Cari destinasi wisata',
                        hintStyle: const TextStyle(
                          fontSize: 10,
                          fontStyle: FontStyle.italic,
                        ),
                        prefixIcon: const Icon(
                          Icons.search,
                          size: 18,
                          color: primaryGreen,
                        ),
                        contentPadding: const EdgeInsets.symmetric(vertical: 8),
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(22),
                          borderSide: const BorderSide(color: Colors.black26),
                        ),
                      ),
                    ),
                  ),
                ),
                const SizedBox(width: 18),
                _headerAction(
                  key: const Key('category-filter-button'),
                  icon: Icons.tune,
                  label: 'Filter',
                  onTap: _showFilterSheet,
                ),
                const SizedBox(width: 16),
                _headerAction(
                  key: const Key('category-sort-button'),
                  icon: Icons.swap_vert,
                  label: 'Urutkan',
                  onTap: _showSortSheet,
                ),
              ],
            ),
          ),
          _buildCategoryTabs(),
          Expanded(
            child: _visibleDestinations.isEmpty
                ? const Center(child: Text('Wisata tidak ditemukan.'))
                : ListView.builder(
                    itemCount: _visibleDestinations.length,
                    itemBuilder: (_, index) =>
                        _buildDestinationCard(_visibleDestinations[index]),
                  ),
          ),
        ],
      ),
    );
  }

  Widget _headerAction({
    Key? key,
    required IconData icon,
    required String label,
    required VoidCallback onTap,
  }) {
    return GestureDetector(
      key: key,
      onTap: onTap,
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Icon(icon, color: primaryGreen, size: 23),
          Text(label, style: const TextStyle(fontSize: 7)),
        ],
      ),
    );
  }

  Widget _buildCategoryTabs() {
    return SizedBox(
      height: 48,
      child: ListView.separated(
        padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
        scrollDirection: Axis.horizontal,
        itemCount: categories.length,
        separatorBuilder: (_, index) => const SizedBox(width: 28),
        itemBuilder: (_, index) {
          final category = categories[index];
          final selected = category == _category;
          return GestureDetector(
            onTap: () => setState(() => _category = category),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                Text(
                  category,
                  style: const TextStyle(fontSize: 12, color: Colors.black),
                ),
                if (selected)
                  Container(
                    margin: const EdgeInsets.only(top: 6),
                    width: 44,
                    height: 1.5,
                    color: primaryGreen,
                  ),
              ],
            ),
          );
        },
      ),
    );
  }

  Widget _buildDestinationCard(_CategoryDestination destination) {
    return InkWell(
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
        height: 86,
        padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 10),
        decoration: const BoxDecoration(
          border: Border(bottom: BorderSide(color: Color(0xFFE2E2E2))),
        ),
        child: Row(
          children: [
            CircleAvatar(
              radius: 24,
              backgroundColor: const Color(0xFFD9D9D9),
              backgroundImage: AssetImage(destination.imagePath),
            ),
            const SizedBox(width: 10),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    destination.name,
                    maxLines: 1,
                    overflow: TextOverflow.ellipsis,
                    style: const TextStyle(
                      fontSize: 13,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  Row(
                    children: [
                      const Icon(Icons.star, color: Colors.amber, size: 12),
                      const SizedBox(width: 2),
                      Text(
                        destination.rating.toString(),
                        style: const TextStyle(fontSize: 9),
                      ),
                      const Text(
                        ' | Open 10:00 - 22:00',
                        style: TextStyle(fontSize: 8),
                      ),
                    ],
                  ),
                  Text(
                    destination.location,
                    style: const TextStyle(fontSize: 8),
                  ),
                  Text(destination.price, style: const TextStyle(fontSize: 8)),
                ],
              ),
            ),
            const Icon(Icons.chevron_right, size: 21),
          ],
        ),
      ),
    );
  }

  Future<void> _showSortSheet() async {
    await showModalBottomSheet<void>(
      context: context,
      backgroundColor: Colors.white,
      shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.vertical(top: Radius.circular(18)),
      ),
      builder: (sheetContext) => SafeArea(
        child: Padding(
          padding: const EdgeInsets.fromLTRB(16, 12, 12, 18),
          child: SingleChildScrollView(
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                Container(
                  width: 98,
                  height: 6,
                  decoration: BoxDecoration(
                    color: Colors.grey.shade300,
                    borderRadius: BorderRadius.circular(8),
                  ),
                ),
                const SizedBox(height: 12),
                Row(
                  children: [
                    const Expanded(
                      child: Text(
                        'Urutkan',
                        style: TextStyle(
                          fontSize: 18,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                    IconButton(
                      icon: const Icon(Icons.close),
                      onPressed: () => Navigator.pop(sheetContext),
                    ),
                  ],
                ),
                const Divider(height: 1),
                for (final option in [
                  'Direkomendasikan',
                  'Harga Tertinggi',
                  'Harga Terendah',
                  'Ulasan Terbaik',
                  'Jarak Terdekat',
                ])
                  ListTile(
                    contentPadding: EdgeInsets.zero,
                    title: Text(option, style: const TextStyle(fontSize: 14)),
                    trailing: Icon(
                      option == _sort
                          ? Icons.radio_button_checked
                          : Icons.radio_button_unchecked,
                      color: primaryGreen,
                      size: 20,
                    ),
                    onTap: () {
                      setState(() => _sort = option);
                      Navigator.pop(sheetContext);
                    },
                  ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Future<void> _showFilterSheet() async {
    await showModalBottomSheet<void>(
      context: context,
      isScrollControlled: true,
      backgroundColor: Colors.white,
      shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.vertical(top: Radius.circular(18)),
      ),
      builder: (sheetContext) => DraggableScrollableSheet(
        initialChildSize: 0.84,
        minChildSize: 0.6,
        maxChildSize: 0.96,
        expand: false,
        builder: (_, controller) => ListView(
          controller: controller,
          padding: const EdgeInsets.fromLTRB(16, 14, 16, 28),
          children: [
            Center(
              child: Container(
                width: 98,
                height: 6,
                decoration: BoxDecoration(
                  color: Colors.grey.shade300,
                  borderRadius: BorderRadius.circular(8),
                ),
              ),
            ),
            const SizedBox(height: 10),
            Row(
              children: [
                const Expanded(
                  child: Text(
                    'Filter',
                    style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                  ),
                ),
                TextButton(onPressed: () {}, child: const Text('Reset')),
                IconButton(
                  key: const Key('filter-close-button'),
                  icon: const Icon(Icons.close),
                  onPressed: () => Navigator.pop(sheetContext),
                ),
              ],
            ),
            const Text(
              'Rentang Jarak',
              style: TextStyle(fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 10),
            Row(
              children: [
                _greenChip('500 M'),
                const SizedBox(width: 6),
                _greenChip('Terdekat'),
                const SizedBox(width: 6),
                _greenChip('Terjauh'),
              ],
            ),
            Slider(value: 0.08, onChanged: (_) {}, activeColor: primaryGreen),
            const Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text('Terdekat', style: TextStyle(fontSize: 7)),
                Text('Terjauh', style: TextStyle(fontSize: 7)),
              ],
            ),
            const Divider(height: 34),
            const Text(
              'Rentang Harga',
              style: TextStyle(fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 12),
            const Row(
              children: [
                Expanded(
                  child: _PriceCard(label: 'Minimal', value: 'Rp 100.000,00'),
                ),
                SizedBox(width: 16),
                Expanded(
                  child: _PriceCard(
                    label: 'Maksimal',
                    value: 'Rp 99.999.999,00',
                  ),
                ),
              ],
            ),
            const SizedBox(height: 12),
            Wrap(
              spacing: 16,
              runSpacing: 12,
              children: [
                _priceChip('< Rp 50.000,00'),
                _priceChip('< Rp 100.000,00'),
                _priceChip('< Rp 300.000,00'),
                _priceChip('Gratis'),
              ],
            ),
            const Divider(height: 34),
            const Text(
              'Lokasi Populer',
              style: TextStyle(fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 8),
            for (final place in [
              'Blok M',
              'Gelora Bung Karno',
              'Senayan',
              'Citra Delapan',
            ])
              ListTile(
                dense: true,
                contentPadding: EdgeInsets.zero,
                title: Text(place, style: const TextStyle(fontSize: 12)),
                trailing: const Icon(
                  Icons.radio_button_unchecked,
                  color: primaryGreen,
                  size: 18,
                ),
              ),
            const SizedBox(height: 12),
            const Text('Zona', style: TextStyle(fontWeight: FontWeight.bold)),
            const SizedBox(height: 10),
            Row(
              children: [
                _zoneCard(Icons.home_work_outlined, 'Dalam Ruangan'),
                const SizedBox(width: 12),
                _zoneCard(Icons.sports_soccer, 'Luar Ruangan'),
              ],
            ),
          ],
        ),
      ),
    );
  }

  Widget _greenChip(String text) {
    return Container(
      width: 78,
      padding: const EdgeInsets.symmetric(vertical: 6),
      alignment: Alignment.center,
      decoration: BoxDecoration(
        color: primaryGreen,
        borderRadius: BorderRadius.circular(5),
      ),
      child: Text(
        text,
        style: const TextStyle(color: Colors.white, fontSize: 10),
      ),
    );
  }

  Widget _priceChip(String text) {
    return Container(
      width: 173,
      padding: const EdgeInsets.symmetric(vertical: 7),
      alignment: Alignment.center,
      decoration: BoxDecoration(
        border: Border.all(color: Colors.black),
        borderRadius: BorderRadius.circular(18),
      ),
      child: Text(
        text,
        style: const TextStyle(fontSize: 11, fontWeight: FontWeight.bold),
      ),
    );
  }

  Widget _zoneCard(IconData icon, String text) {
    return Container(
      width: 62,
      height: 62,
      alignment: Alignment.center,
      decoration: BoxDecoration(
        border: Border.all(color: Colors.black26),
        borderRadius: BorderRadius.circular(4),
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Icon(icon, size: 18),
          const SizedBox(height: 4),
          Text(text, style: const TextStyle(fontSize: 7)),
        ],
      ),
    );
  }
}

class _PriceCard extends StatelessWidget {
  const _PriceCard({required this.label, required this.value});

  final String label;
  final String value;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.fromLTRB(14, 8, 14, 10),
      decoration: BoxDecoration(
        color: _CategoryScreenState.primaryGreen,
        borderRadius: BorderRadius.circular(5),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(label, style: const TextStyle(color: Colors.white, fontSize: 8)),
          Text(
            value,
            style: const TextStyle(
              color: Colors.white,
              fontSize: 15,
              fontWeight: FontWeight.bold,
            ),
          ),
        ],
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
