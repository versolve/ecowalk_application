import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

import 'detail_wisata_screen.dart';

class RecommendationScreen extends StatelessWidget {
  const RecommendationScreen({super.key, this.showBottomNavigation = true});

  final bool showBottomNavigation;

  static const primaryGreen = Color(0xFF176B5B);
  static const lightGreen = Color(0xFF4F8F83);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        bottom: false,
        child: ListView(
          padding: const EdgeInsets.fromLTRB(16, 20, 16, 24),
          children: [
            _buildHeader(),
            const SizedBox(height: 20),
            const Text(
              'MAU KEMANA HARI INI?',
              style: TextStyle(
                fontSize: 16,
                fontWeight: FontWeight.w800,
                letterSpacing: 0.2,
              ),
            ),
            const SizedBox(height: 12),
            _buildSearchBox(context),
            const SizedBox(height: 14),
            Align(
              alignment: Alignment.centerLeft,
              child: ElevatedButton(
                style: ElevatedButton.styleFrom(
                  backgroundColor: primaryGreen,
                  foregroundColor: Colors.white,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(20),
                  ),
                  padding: const EdgeInsets.symmetric(
                    horizontal: 24,
                    vertical: 10,
                  ),
                ),
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (_) => const RouteRecommendationScreen(),
                    ),
                  );
                },
                child: const Text(
                  'Cari Rute',
                  style: TextStyle(fontWeight: FontWeight.bold, fontSize: 13),
                ),
              ),
            ),
            const SizedBox(height: 24),
            const Text(
              'Rekomendasi Tujuan',
              style: TextStyle(fontSize: 15, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 14),
            _buildDestinationCards(context),
          ],
        ),
      ),
    );
  }

  Widget _buildHeader() {
    return Row(
      children: [
        const Text(
          'ECOWA',
          style: TextStyle(
            color: lightGreen,
            fontSize: 21,
            fontWeight: FontWeight.w900,
            letterSpacing: -0.7,
          ),
        ),
        SvgPicture.asset(
          'lib/assets/icons/logo_lari.svg',
          height: 26,
          width: 26,
          colorFilter: const ColorFilter.mode(primaryGreen, BlendMode.srcIn),
        ),
        const Text(
          'K',
          style: TextStyle(
            color: lightGreen,
            fontSize: 21,
            fontWeight: FontWeight.w900,
            letterSpacing: -0.7,
          ),
        ),
      ],
    );
  }

  Widget _buildSearchBox(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(14),
      decoration: BoxDecoration(
        color: primaryGreen,
        borderRadius: BorderRadius.circular(16),
      ),
      child: Column(
        children: [
          _buildInputTile(
            icon: Icons.search,
            hint: 'Masukan Lokasi Asal',
          ),
          const SizedBox(height: 10),
          _buildInputTile(
            icon: Icons.location_on_outlined,
            hint: 'Masukan Lokasi Tujuan',
          ),
        ],
      ),
    );
  }

  Widget _buildInputTile({
    required IconData icon,
    required String hint,
  }) {
    return Container(
      height: 44,
      padding: const EdgeInsets.symmetric(horizontal: 12),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(22),
      ),
      child: Row(
        children: [
          Icon(icon, color: Colors.black54, size: 20),
          const SizedBox(width: 8),
          Expanded(
            child: Text(
              hint,
              style: const TextStyle(
                color: Colors.black54,
                fontSize: 12,
                fontStyle: FontStyle.italic,
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildDestinationCards(BuildContext context) {
    final items = [
      (
        'Moja Museum',
        'Jakarta Pusat',
        'Mulai dari Rp. 136.500',
        'lib/assets/images/dufan.jpg',
      ),
      (
        'Ocean Park BSD City Serpong',
        'Tangerang',
        'Mulai dari Rp. 65.000',
        'lib/assets/images/tmii.jpg',
      ),
      (
        'Kawasan Wisata Ancol',
        'Jakarta Utara',
        'Mulai dari Rp. 30.000',
        'lib/assets/images/taman_safari.jpg',
      ),
    ];

    return SizedBox(
      height: 270,
      child: ListView.separated(
        scrollDirection: Axis.horizontal,
        itemCount: items.length,
        separatorBuilder: (_, index) => const SizedBox(width: 14),
        itemBuilder: (context, index) {
          final item = items[index];
          return GestureDetector(
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (_) => DetailWisataScreen(
                    name: item.$1,
                    imagePath: item.$4,
                    location: item.$2,
                    price: item.$3,
                  ),
                ),
              );
            },
            child: ClipRRect(
              borderRadius: BorderRadius.circular(16),
              child: SizedBox(
                width: 168,
                child: Stack(
                  fit: StackFit.expand,
                  children: [
                    Image.asset(
                      item.$4,
                      fit: BoxFit.cover,
                      errorBuilder: (_, error, stackTrace) =>
                          Container(color: const Color(0xFF1D5A50)),
                    ),
                    DecoratedBox(
                      decoration: BoxDecoration(
                        gradient: LinearGradient(
                          begin: Alignment.topCenter,
                          end: Alignment.bottomCenter,
                          colors: [
                            Colors.transparent,
                            Colors.black.withValues(alpha: 0.82),
                          ],
                        ),
                      ),
                    ),
                    Positioned(
                      left: 10,
                      right: 10,
                      bottom: 12,
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            item.$1,
                            maxLines: 1,
                            overflow: TextOverflow.ellipsis,
                            style: const TextStyle(
                              color: Colors.white,
                              fontSize: 12,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          const SizedBox(height: 2),
                          Row(
                            children: [
                              const Icon(
                                Icons.location_on,
                                color: Colors.redAccent,
                                size: 11,
                              ),
                              const SizedBox(width: 2),
                              Expanded(
                                child: Text(
                                  item.$2,
                                  maxLines: 1,
                                  overflow: TextOverflow.ellipsis,
                                  style: const TextStyle(
                                    color: Colors.white70,
                                    fontSize: 9,
                                  ),
                                ),
                              ),
                            ],
                          ),
                          const SizedBox(height: 2),
                          Text(
                            item.$3,
                            style: const TextStyle(
                              color: Colors.white,
                              fontSize: 9,
                            ),
                          ),
                          const SizedBox(height: 4),
                          const Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Row(
                                mainAxisSize: MainAxisSize.min,
                                children: [
                                  Icon(Icons.star, color: Colors.amber, size: 9),
                                  Icon(Icons.star, color: Colors.amber, size: 9),
                                  Icon(Icons.star, color: Colors.amber, size: 9),
                                  Icon(Icons.star, color: Colors.amber, size: 9),
                                  Icon(
                                    Icons.star_half,
                                    color: Colors.amber,
                                    size: 9,
                                  ),
                                ],
                              ),
                              Text(
                                'Lebih Lanjut ›',
                                style: TextStyle(
                                  color: Colors.white70,
                                  fontSize: 8,
                                ),
                              ),
                            ],
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ),
          );
        },
      ),
    );
  }
}

class RouteRecommendationScreen extends StatelessWidget {
  const RouteRecommendationScreen({super.key});

  static const primaryGreen = Color(0xFF176B5B);
  static const lightGreen = Color(0xFF4F8F83);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: primaryGreen,
        foregroundColor: Colors.white,
        title: const Text(
          'Rekomendasi',
          style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
        ),
      ),
      body: ListView(
        padding: const EdgeInsets.all(16),
        children: [
          _buildDestinationBanner(),
          const SizedBox(height: 18),
          _buildBrandLogo(),
          const SizedBox(height: 12),
          _buildTravelModes(),
          const SizedBox(height: 16),
          _buildMapCard(),
          const SizedBox(height: 20),
          const Text(
            'Opsi Kendaraan',
            style: TextStyle(fontSize: 14, fontWeight: FontWeight.bold),
          ),
          const SizedBox(height: 12),
          _buildVehicleOptions(context),
          const SizedBox(height: 16),
          _buildTipsBanner(),
        ],
      ),
    );
  }

  Widget _buildDestinationBanner() {
    return Container(
      padding: const EdgeInsets.all(14),
      decoration: BoxDecoration(
        color: primaryGreen,
        borderRadius: BorderRadius.circular(12),
      ),
      child: const Row(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Column(
            children: [
              Icon(Icons.circle, color: Colors.white, size: 12),
              SizedBox(height: 2),
              Text(
                '┊\n┊',
                style: TextStyle(
                  color: Colors.white70,
                  fontSize: 10,
                  height: 0.9,
                ),
              ),
              SizedBox(height: 2),
              Icon(Icons.location_on_outlined, color: Colors.white, size: 16),
            ],
          ),
          SizedBox(width: 12),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'Titik Awal',
                  style: TextStyle(color: Colors.white70, fontSize: 10),
                ),
                Text(
                  'KLAPANUNGGAL',
                  style: TextStyle(
                    color: Colors.white,
                    fontWeight: FontWeight.bold,
                    fontSize: 13,
                  ),
                ),
                Divider(color: Colors.white30, height: 12),
                Text(
                  'Titik Akhir',
                  style: TextStyle(color: Colors.white70, fontSize: 10),
                ),
                Text(
                  'Trans Studio Cibubur',
                  style: TextStyle(
                    color: Colors.white,
                    fontWeight: FontWeight.bold,
                    fontSize: 13,
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildBrandLogo() {
    return Row(
      children: [
        const Text(
          'ECOWA',
          style: TextStyle(
            color: lightGreen,
            fontSize: 20,
            fontWeight: FontWeight.w900,
            letterSpacing: -0.7,
          ),
        ),
        SvgPicture.asset(
          'lib/assets/icons/logo_lari.svg',
          height: 24,
          width: 24,
          colorFilter: const ColorFilter.mode(primaryGreen, BlendMode.srcIn),
        ),
        const Text(
          'K',
          style: TextStyle(
            color: lightGreen,
            fontSize: 20,
            fontWeight: FontWeight.w900,
            letterSpacing: -0.7,
          ),
        ),
      ],
    );
  }

  Widget _buildTravelModes() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        _buildModePill(Icons.directions_walk, '13 menit', isSelected: true),
        _buildModePill(Icons.directions_car, '5 menit'),
        _buildModePill(Icons.two_wheeler, '4 menit'),
        _buildModePill(Icons.directions_bus, '18 menit'),
      ],
    );
  }

  Widget _buildModePill(
    IconData icon,
    String label, {
    bool isSelected = false,
  }) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 6),
      decoration: BoxDecoration(
        color: isSelected ? const Color(0xFFF1F5F4) : Colors.transparent,
        borderRadius: BorderRadius.circular(8),
        border: isSelected
            ? Border.all(color: Colors.black12)
            : Border.all(color: Colors.transparent),
      ),
      child: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          Icon(icon, size: 16, color: Colors.black87),
          const SizedBox(width: 4),
          Text(
            label,
            style: const TextStyle(fontSize: 11, fontWeight: FontWeight.w600),
          ),
        ],
      ),
    );
  }

  Widget _buildMapCard() {
    return ClipRRect(
      borderRadius: BorderRadius.circular(12),
      child: Container(
        height: 160,
        decoration: BoxDecoration(
          color: const Color(0xFFE8F1EC),
          border: Border.all(color: Colors.black12),
        ),
        child: Stack(
          children: [
            Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Icon(Icons.map_outlined, size: 40, color: primaryGreen),
                  const SizedBox(height: 6),
                  const Text(
                    'Peta Rute Keberangkatan',
                    style: TextStyle(
                      fontSize: 12,
                      fontWeight: FontWeight.w600,
                      color: primaryGreen,
                    ),
                  ),
                ],
              ),
            ),
            Positioned(
              left: 12,
              top: 12,
              child: Container(
                padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
                decoration: BoxDecoration(
                  color: Colors.white70,
                  borderRadius: BorderRadius.circular(4),
                ),
                child: const Text('Gambir', style: TextStyle(fontSize: 10)),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildVehicleOptions(BuildContext context) {
    return SizedBox(
      height: 125,
      child: Row(
        children: [
          Expanded(
            child: _buildVehicleCard(
              title: 'Ojek Online',
              subtitle: 'Gojek, Grab, Maxim\nNyaman, dan cepat',
              imagePath: 'lib/assets/images/dufan.jpg',
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (_) => const OjekOnlineDetailScreen(),
                  ),
                );
              },
            ),
          ),
          const SizedBox(width: 10),
          Expanded(
            child: _buildVehicleCard(
              title: 'Transportasi Umum',
              subtitle: 'Bus, KRL, MRT, LRT\nHemat, dan murah',
              imagePath: 'lib/assets/images/tmii.jpg',
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (_) => const PublicTransportDetailScreen(),
                  ),
                );
              },
            ),
          ),
          const SizedBox(width: 10),
          Expanded(
            child: _buildVehicleCard(
              title: 'Taxi',
              subtitle: 'Blue Bird, GrabCar\nEfisien, dan nyaman',
              imagePath: 'lib/assets/images/taman_safari.jpg',
              onTap: () {},
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildVehicleCard({
    required String title,
    required String subtitle,
    required String imagePath,
    required VoidCallback onTap,
  }) {
    return GestureDetector(
      onTap: onTap,
      child: ClipRRect(
        borderRadius: BorderRadius.circular(10),
        child: Stack(
          fit: StackFit.expand,
          children: [
            Image.asset(
              imagePath,
              fit: BoxFit.cover,
              errorBuilder: (_, error, stackTrace) =>
                  Container(color: primaryGreen),
            ),
            DecoratedBox(
              decoration: BoxDecoration(
                gradient: LinearGradient(
                  begin: Alignment.topCenter,
                  end: Alignment.bottomCenter,
                  colors: [
                    Colors.transparent,
                    Colors.black.withValues(alpha: 0.8),
                  ],
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(8),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.end,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    title,
                    maxLines: 1,
                    overflow: TextOverflow.ellipsis,
                    style: const TextStyle(
                      color: Colors.white,
                      fontSize: 10,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  const SizedBox(height: 2),
                  Text(
                    subtitle,
                    maxLines: 2,
                    overflow: TextOverflow.ellipsis,
                    style: const TextStyle(
                      color: Colors.white70,
                      fontSize: 7,
                      height: 1.1,
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

  Widget _buildTipsBanner() {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 14, vertical: 12),
      decoration: BoxDecoration(
        color: primaryGreen,
        borderRadius: BorderRadius.circular(10),
      ),
      child: const Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            'Mau cepat & murah? 👉 Ojek Online',
            style: TextStyle(color: Colors.white, fontSize: 11),
          ),
          SizedBox(height: 6),
          Text(
            'Mau murah banget? 👉 Kendaraan Umum',
            style: TextStyle(color: Colors.white, fontSize: 11),
          ),
          SizedBox(height: 6),
          Text(
            'Mau nyaman & santai? 👉 Taksi',
            style: TextStyle(color: Colors.white, fontSize: 11),
          ),
        ],
      ),
    );
  }
}

class PublicTransportDetailScreen extends StatelessWidget {
  const PublicTransportDetailScreen({super.key});

  static const primaryGreen = Color(0xFF176B5B);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: primaryGreen,
        foregroundColor: Colors.white,
        title: const Text(
          'Rekomendasi',
          style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
        ),
      ),
      body: ListView(
        padding: const EdgeInsets.all(16),
        children: [
          _buildHeroImage(context),
          const SizedBox(height: 12),
          const Text(
            'TRANSPORTASI UMUM',
            style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
          ),
          const SizedBox(height: 6),
          const Row(
            children: [
              Icon(Icons.payments_outlined, size: 16),
              SizedBox(width: 6),
              Text('Rp. 0 - 20.000', style: TextStyle(fontSize: 12)),
            ],
          ),
          const SizedBox(height: 4),
          const Row(
            children: [
              Icon(Icons.access_time, size: 16),
              SizedBox(width: 6),
              Text('1 Jam 45 Menit', style: TextStyle(fontSize: 12)),
            ],
          ),
          const SizedBox(height: 14),
          _buildMapPlaceholder(),
          const SizedBox(height: 16),
          _buildAnalysisCard(),
          const SizedBox(height: 20),
          const Text(
            'Opsi Transportasi Umum',
            style: TextStyle(fontSize: 14, fontWeight: FontWeight.bold),
          ),
          const SizedBox(height: 10),
          _buildTransportOptions(context),
        ],
      ),
    );
  }

  Widget _buildHeroImage(BuildContext context) {
    return Stack(
      children: [
        ClipRRect(
          borderRadius: BorderRadius.circular(10),
          child: Container(
            height: 150,
            width: double.infinity,
            color: const Color(0xFFD63B3B),
            child: Image.asset(
              'lib/assets/images/dufan.jpg',
              fit: BoxFit.cover,
              errorBuilder: (_, error, stackTrace) => const SizedBox(),
            ),
          ),
        ),
        Positioned(
          right: 12,
          bottom: 12,
          child: Container(
            padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 4),
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(6),
            ),
            child: const Text(
              'Termurah',
              style: TextStyle(
                color: primaryGreen,
                fontWeight: FontWeight.bold,
                fontSize: 11,
              ),
            ),
          ),
        ),
      ],
    );
  }

  Widget _buildMapPlaceholder() {
    return ClipRRect(
      borderRadius: BorderRadius.circular(10),
      child: Container(
        height: 130,
        decoration: BoxDecoration(
          color: const Color(0xFFE9F0EC),
          border: Border.all(color: Colors.black12),
        ),
        child: const Center(
          child: Text(
            'Peta Jalur Transportasi',
            style: TextStyle(color: primaryGreen, fontWeight: FontWeight.w600),
          ),
        ),
      ),
    );
  }

  Widget _buildAnalysisCard() {
    return Container(
      padding: const EdgeInsets.all(12),
      decoration: BoxDecoration(
        color: const Color(0xFFF7F8F8),
        borderRadius: BorderRadius.circular(10),
        border: Border.all(color: Colors.black12),
      ),
      child: const Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            'Analisis Perjalanan',
            style: TextStyle(fontSize: 13, fontWeight: FontWeight.bold),
          ),
          SizedBox(height: 8),
          Text(
            'Dibandingkan Naik Ojek Online',
            style: TextStyle(
              color: primaryGreen,
              fontSize: 11,
              fontWeight: FontWeight.bold,
            ),
          ),
          SizedBox(height: 4),
          _AnalysisRow(label: 'Waktu', value: '30 mnt Lebih lambat'),
          _AnalysisRow(label: 'Hemat', value: 'Kendaraan Umum'),
          _AnalysisRow(label: 'Kenyamanan', value: 'Taxi'),
          Divider(height: 16),
          Text(
            'Dibandingkan Taxi',
            style: TextStyle(
              color: primaryGreen,
              fontSize: 11,
              fontWeight: FontWeight.bold,
            ),
          ),
          SizedBox(height: 4),
          _AnalysisRow(label: 'Waktu', value: '20-40 mnt Lebih cepat'),
          _AnalysisRow(label: 'Hemat', value: 'Kendaraan Umum'),
          _AnalysisRow(label: 'Kenyamanan', value: 'Taxi'),
        ],
      ),
    );
  }

  Widget _buildTransportOptions(BuildContext context) {
    final list = [
      ('TransJakarta', '± 40 menit', Icons.directions_bus),
      ('MRT Jakarta', '± 25 menit', Icons.train_outlined),
      ('LRT Jabodetabek', '± 30 menit', Icons.tram_outlined),
      ('KRL Commuter Line', '± 35 menit', Icons.directions_railway),
      ('Mikrotrans (JakLingko)', '± 50 menit', Icons.airport_shuttle_outlined),
    ];

    return Container(
      decoration: BoxDecoration(
        color: const Color(0xFFF7F8F8),
        borderRadius: BorderRadius.circular(10),
        border: Border.all(color: Colors.black12),
      ),
      child: Column(
        children: [
          for (var item in list)
            ListTile(
              leading: CircleAvatar(
                radius: 16,
                backgroundColor: Colors.black12,
                child: Icon(item.$3, size: 18, color: Colors.black87),
              ),
              title: Text(
                item.$1,
                style: const TextStyle(
                  fontSize: 12,
                  fontWeight: FontWeight.bold,
                ),
              ),
              subtitle: Text(item.$2, style: const TextStyle(fontSize: 10)),
              trailing: const Text(
                'Detail',
                style: TextStyle(color: Colors.black87, fontSize: 11),
              ),
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (_) => const PublicTransportAccordionScreen(),
                  ),
                );
              },
            ),
        ],
      ),
    );
  }
}

class PublicTransportAccordionScreen extends StatelessWidget {
  const PublicTransportAccordionScreen({super.key});

  static const primaryGreen = Color(0xFF176B5B);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: primaryGreen,
        foregroundColor: Colors.white,
        title: const Text(
          'Transportasi Umum',
          style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
        ),
      ),
      body: ListView(
        padding: const EdgeInsets.all(16),
        children: [
          ClipRRect(
            borderRadius: BorderRadius.circular(10),
            child: Container(
              height: 150,
              color: Colors.lightBlue,
              child: Image.asset(
                'lib/assets/images/tmii.jpg',
                fit: BoxFit.cover,
                errorBuilder: (_, error, stackTrace) => const SizedBox(),
              ),
            ),
          ),
          const SizedBox(height: 14),
          const Text(
            'TRANSJAKARTA',
            style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
          ),
          const SizedBox(height: 12),
          _buildAccordionItem(
            title: 'Biaya',
            content: 'Rp 3.500 (tarif flat TransJakarta)',
          ),
          _buildAccordionItem(
            title: 'Estimasi',
            content: '±60-75 menit (tergantung kondisi lalu lintas)',
          ),
          _buildAccordionItem(
            title: 'Keberangkatan',
            content: 'Perkiraan keberangkatan dari Halte Duri Kepa: Pukul 18.00 WIB',
            actionText: 'Selengkapnya',
            onAction: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (_) => const DepartureScreen()),
              );
            },
          ),
          _buildAccordionItem(
            title: 'Informasi Kepadatan',
            content: 'Kepadatan di Halte SSSSS tergolong Sedang/Tinggi',
          ),
          _buildAccordionItem(
            title: 'Rute yang dilalui',
            content:
                'Dari Kedoya Selatan menuju ke halte Kedoya Green Garden lalu naik Koridor 8',
          ),
          _buildAccordionItem(
            title: 'Kelebihan & Kekurangan',
            content:
                '• Biaya Terjangkau\n• Jalur khusus bus mengurangi risiko macet\n• Perlu transit dan menunggu bus di halte',
            isHighlighted: true,
          ),
        ],
      ),
    );
  }

  Widget _buildAccordionItem({
    required String title,
    required String content,
    String? actionText,
    VoidCallback? onAction,
    bool isHighlighted = false,
  }) {
    return Container(
      margin: const EdgeInsets.only(bottom: 8),
      decoration: BoxDecoration(
        color: isHighlighted ? primaryGreen : Colors.white,
        borderRadius: BorderRadius.circular(8),
        border: Border.all(
          color: isHighlighted ? primaryGreen : Colors.black26,
        ),
      ),
      child: ExpansionTile(
        initiallyExpanded: true,
        title: Text(
          title,
          style: TextStyle(
            fontSize: 13,
            fontWeight: FontWeight.bold,
            color: isHighlighted ? Colors.white : Colors.black87,
          ),
        ),
        iconColor: isHighlighted ? Colors.white : Colors.black87,
        collapsedIconColor: isHighlighted ? Colors.white : Colors.black87,
        children: [
          Padding(
            padding: const EdgeInsets.fromLTRB(16, 0, 16, 12),
            child: Align(
              alignment: Alignment.centerLeft,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    content,
                    style: TextStyle(
                      fontSize: 11,
                      color: isHighlighted ? Colors.white70 : Colors.black87,
                    ),
                  ),
                  if (actionText != null) ...[
                    const SizedBox(height: 6),
                    GestureDetector(
                      onTap: onAction,
                      child: Text(
                        actionText,
                        style: const TextStyle(
                          color: Colors.lightBlue,
                          fontSize: 10,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                  ],
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class DepartureScreen extends StatelessWidget {
  const DepartureScreen({super.key});

  static const primaryGreen = Color(0xFF176B5B);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: primaryGreen,
      appBar: AppBar(
        backgroundColor: primaryGreen,
        foregroundColor: Colors.white,
        title: const Text(
          'Keberangkatan',
          style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
        ),
      ),
      body: ListView(
        padding: const EdgeInsets.all(16),
        children: [
          ClipRRect(
            borderRadius: BorderRadius.circular(10),
            child: Container(
              height: 180,
              color: const Color(0xFFE8F1EC),
              child: const Center(
                child: Text(
                  'Peta Rute Halte Keberangkatan',
                  style: TextStyle(
                    color: primaryGreen,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
            ),
          ),
          const SizedBox(height: 14),
          _buildDepartureCard(
            title: 'Keberangkatan',
            tag: 'Koridor',
            sub: 'Ta → Kota',
            time: '11 mnt',
            warning: 'Terlambat 11 mnt',
          ),
          _buildDepartureCard(
            title: 'Keberangkatan',
            tag: 'Bus 2',
            sub: 'lorem ipsum → blablabla',
            time: '23.23',
            status: 'Dijadwalkan',
          ),
          _buildDepartureCard(
            title: 'Keberangkatan',
            tag: 'Bus 2',
            sub: 'lorem ipsum → blablabla',
            time: '23.23',
            status: 'Dijadwalkan',
          ),
        ],
      ),
    );
  }

  Widget _buildDepartureCard({
    required String title,
    required String tag,
    required String sub,
    required String time,
    String? warning,
    String? status,
  }) {
    return Container(
      margin: const EdgeInsets.only(bottom: 10),
      padding: const EdgeInsets.all(12),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(10),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                title,
                style: const TextStyle(
                  fontSize: 12,
                  fontWeight: FontWeight.bold,
                ),
              ),
              Text(
                time,
                style: const TextStyle(
                  fontSize: 14,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ],
          ),
          const SizedBox(height: 4),
          Row(
            children: [
              Container(
                padding: const EdgeInsets.symmetric(horizontal: 6, vertical: 2),
                decoration: BoxDecoration(
                  color: Colors.orange,
                  borderRadius: BorderRadius.circular(4),
                ),
                child: Text(
                  tag,
                  style: const TextStyle(
                    color: Colors.white,
                    fontSize: 10,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
              const SizedBox(width: 8),
              Expanded(
                child: Text(
                  sub,
                  style: const TextStyle(fontSize: 11, color: Colors.black87),
                ),
              ),
            ],
          ),
          const SizedBox(height: 4),
          if (warning != null)
            Text(
              warning,
              style: const TextStyle(
                color: Colors.redAccent,
                fontSize: 10,
                fontWeight: FontWeight.bold,
              ),
            ),
          if (status != null)
            Text(
              status,
              style: const TextStyle(color: Colors.black54, fontSize: 10),
            ),
          const Text(
            'Bisa berubah tergantung kepadatan lalu lintas',
            style: TextStyle(
              color: Colors.redAccent,
              fontSize: 8,
              fontStyle: FontStyle.italic,
            ),
          ),
        ],
      ),
    );
  }
}

class OjekOnlineDetailScreen extends StatelessWidget {
  const OjekOnlineDetailScreen({super.key});

  static const primaryGreen = Color(0xFF176B5B);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: primaryGreen,
        foregroundColor: Colors.white,
        title: const Text(
          'Rekomendasi',
          style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
        ),
      ),
      body: ListView(
        padding: const EdgeInsets.all(16),
        children: [
          ClipRRect(
            borderRadius: BorderRadius.circular(10),
            child: Container(
              height: 150,
              color: Colors.green,
              child: Image.asset(
                'lib/assets/images/taman_safari.jpg',
                fit: BoxFit.cover,
                errorBuilder: (_, error, stackTrace) => const SizedBox(),
              ),
            ),
          ),
          const SizedBox(height: 12),
          const Text(
            'OJEK ONLINE',
            style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
          ),
          const SizedBox(height: 6),
          const Text(
            'Rp. 30.000 - 45.000',
            style: TextStyle(fontSize: 12, fontWeight: FontWeight.bold),
          ),
          const Text('20 Menit', style: TextStyle(fontSize: 11)),
          const SizedBox(height: 14),
          Container(
            padding: const EdgeInsets.all(12),
            decoration: BoxDecoration(
              color: const Color(0xFFF7F8F8),
              borderRadius: BorderRadius.circular(10),
              border: Border.all(color: Colors.black12),
            ),
            child: const Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'Analisis Perjalanan',
                  style: TextStyle(fontSize: 13, fontWeight: FontWeight.bold),
                ),
                SizedBox(height: 8),
                Text(
                  'Dibandingkan Naik Taxi',
                  style: TextStyle(
                    color: primaryGreen,
                    fontSize: 11,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                _AnalysisRow(label: 'Waktu', value: '5 mnt Lebih cepat'),
                _AnalysisRow(label: 'Hemat', value: 'Ojek Online'),
                _AnalysisRow(label: 'Kenyamanan', value: 'Taxi'),
                Divider(height: 16),
                Text(
                  'Dibandingkan Kendaraan Umum',
                  style: TextStyle(
                    color: primaryGreen,
                    fontSize: 11,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                _AnalysisRow(label: 'Waktu', value: '15 mnt Lebih lambat'),
                _AnalysisRow(label: 'Hemat', value: 'Kendaraan Umum'),
                _AnalysisRow(label: 'Kenyamanan', value: 'Taxi'),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

class _AnalysisRow extends StatelessWidget {
  const _AnalysisRow({required this.label, required this.value});

  final String label;
  final String value;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 2),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(
            label,
            style: const TextStyle(fontSize: 11, color: Colors.black87),
          ),
          Text(
            value,
            style: const TextStyle(fontSize: 11, fontWeight: FontWeight.w600),
          ),
        ],
      ),
    );
  }
}
