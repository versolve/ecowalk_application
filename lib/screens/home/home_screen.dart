import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

import '../profile/profile_screen.dart';
import 'category_screen.dart';
import 'detail_wisata_screen.dart';
import 'notification_screen.dart';
import 'recently_viewed_screen.dart';
import 'weather_screen.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key, this.showBottomNavigation = true});

  final bool showBottomNavigation;

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  static const primaryGreen = Color(0xFF176B5B);
  static const darkGreen = Color(0xFF0D5D4F);
  static const lightGreen = Color(0xFF4F8F83);
  int _selectedNav = 0;

  static const categories = [
    'Semua',
    'Kuliner',
    'Sejarah',
    'Alam',
    'Religi',
    'Seni',
  ];

  static const destinations = [
    _Destination(
      name: 'Dunia Fantasi (DUFAN)',
      location: 'Ancol, Jakarta Utara',
      price: 'Rp. 200.000',
      distance: '1.68 KM',
      imagePath: 'lib/assets/images/dufan.jpg',
      color: Color(0xFFB85F36),
      icon: Icons.attractions,
    ),
    _Destination(
      name: 'Taman Mini Indonesia Indah (TMII)',
      location: 'Jakarta Timur',
      price: 'Mulai dari Rp. 35.000',
      distance: '3.68 KM',
      imagePath: 'lib/assets/images/tmii.jpg',
      color: Color(0xFF5B83B7),
      icon: Icons.account_balance,
    ),
    _Destination(
      name: 'Taman Safari Indonesia',
      location: 'Bogor, Jawa Barat',
      price: 'Mulai dari Rp. 170.000',
      distance: '8.2 KM',
      imagePath: 'lib/assets/images/taman_safari.jpg',
      color: Color(0xFF67935D),
      icon: Icons.forest,
    ),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        bottom: false,
        child: Column(
          children: [
            Expanded(
              child: CustomScrollView(
                slivers: [
                  SliverPadding(
                    padding: const EdgeInsets.fromLTRB(16, 24, 16, 0),
                    sliver: SliverList(
                      delegate: SliverChildListDelegate([
                        _buildHeader(),
                        const SizedBox(height: 20),
                        _buildWeatherCard(),
                        const SizedBox(height: 20),
                        _buildSectionTitle('Rekomendasi'),
                        const SizedBox(height: 10),
                        _buildRecommendationList(),
                        const SizedBox(height: 26),
                        _buildSectionTitle('Kategori'),
                        const SizedBox(height: 10),
                        _buildCategories(),
                        const SizedBox(height: 18),
                        _buildSectionTitle(
                          'Pilihan Teratas',
                          trailing: 'Jelajahi',
                        ),
                        const SizedBox(height: 12),
                        _buildLandscapeList(),
                        const SizedBox(height: 28),
                        _buildCompareBanner(),
                        const SizedBox(height: 28),
                        _buildSectionTitle(
                          'Kunjungi Lagi',
                          trailing: 'Selengkapnya',
                        ),
                        const SizedBox(height: 12),
                        _buildLandscapeList(),
                        const SizedBox(height: 28),
                        _buildSectionTitle(
                          'Terakhir Dilihat',
                          trailing: 'Selengkapnya',
                          trailingKey: const Key('recently-viewed-more'),
                          onTrailingTap: () {
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (_) => const RecentlyViewedScreen(),
                              ),
                            );
                          },
                        ),
                        const SizedBox(height: 12),
                        SizedBox(
                          height: 196,
                          child: _buildDestinationCard(destinations.first),
                        ),
                        const SizedBox(height: 96),
                      ]),
                    ),
                  ),
                ],
              ),
            ),
            if (widget.showBottomNavigation) _buildBottomNavigationBar(),
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
        const Spacer(),
        const CircleAvatar(
          radius: 18,
          backgroundColor: Color(0xFFE1E8E6),
          child: Icon(Icons.person, color: primaryGreen, size: 23),
        ),
        const SizedBox(width: 10),
        GestureDetector(
          onTap: () {
            Navigator.push(
              context,
              MaterialPageRoute(builder: (_) => const NotificationScreen()),
            );
          },
          child: Container(
            width: 38,
            height: 38,
            decoration: const BoxDecoration(
              color: primaryGreen,
              shape: BoxShape.circle,
            ),
            child: const Icon(
              Icons.notifications_none,
              color: Colors.white,
              size: 23,
            ),
          ),
        ),
      ],
    );
  }

  Widget _buildWeatherCard() {
    return GestureDetector(
      onTap: () {
        Navigator.push(
          context,
          MaterialPageRoute(builder: (_) => const WeatherScreen()),
        );
      },
      child: Container(
        height: 210,
        padding: const EdgeInsets.fromLTRB(22, 36, 18, 18),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(9),
          gradient: const LinearGradient(
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
            colors: [primaryGreen, Color(0xFFD5DCD9)],
          ),
          boxShadow: const [
            BoxShadow(
              color: Colors.black26,
              blurRadius: 4,
              offset: Offset(0, 3),
            ),
          ],
        ),
        child: Row(
          children: [
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Text(
                    'Minggu, 16 Febuari 2025',
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 16,
                      fontWeight: FontWeight.w700,
                    ),
                  ),
                  SizedBox(height: 2),
                  const Text(
                    'Klapanunggal, Bogor',
                    style: TextStyle(color: Colors.white, fontSize: 12),
                  ),
                  SizedBox(height: 10),
                  const Text(
                    '30°C',
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 42,
                      height: 1,
                      fontWeight: FontWeight.w800,
                    ),
                  ),
                  SizedBox(height: 15),
                  const Text(
                    'Cerah Berawan',
                    style: TextStyle(color: Colors.white, fontSize: 12),
                  ),
                ],
              ),
            ),
            SizedBox(width: 145, child: _WeatherIllustration()),
          ],
        ),
      ),
    );
  }

  Widget _buildSectionTitle(
    String title, {
    String? trailing,
    VoidCallback? onTrailingTap,
    Key? trailingKey,
  }) {
    return Row(
      children: [
        Text(
          title,
          style: const TextStyle(fontSize: 14, fontWeight: FontWeight.bold),
        ),
        if (trailing != null) ...[
          const Spacer(),
          GestureDetector(
            key: trailingKey,
            onTap: onTrailingTap,
            child: Row(
              mainAxisSize: MainAxisSize.min,
              children: [
                Text(trailing, style: const TextStyle(fontSize: 13)),
                const SizedBox(width: 8),
                const Icon(Icons.chevron_right, size: 18),
              ],
            ),
          ),
        ],
      ],
    );
  }

  Widget _buildRecommendationList() {
    return SizedBox(
      height: 218,
      child: ListView.separated(
        scrollDirection: Axis.horizontal,
        itemCount: destinations.length,
        separatorBuilder: (_, index) => const SizedBox(width: 18),
        itemBuilder: (_, index) => _buildDestinationCard(destinations[index]),
      ),
    );
  }

  Widget _buildDestinationCard(_Destination destination) {
    return SizedBox(
      width: 153,
      child: GestureDetector(
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
        child: ClipRRect(
          borderRadius: BorderRadius.circular(9),
          child: Stack(
            fit: StackFit.expand,
            children: [
              _DestinationIllustration(destination: destination),
              DecoratedBox(
                decoration: BoxDecoration(
                  gradient: LinearGradient(
                    begin: Alignment.topCenter,
                    end: Alignment.bottomCenter,
                    colors: [
                      Colors.transparent,
                      Colors.black.withValues(alpha: 0.78),
                    ],
                  ),
                ),
              ),
              Positioned(
                top: 7,
                right: 7,
                child: Container(
                  padding: const EdgeInsets.symmetric(
                    horizontal: 7,
                    vertical: 4,
                  ),
                  decoration: BoxDecoration(
                    color: darkGreen,
                    borderRadius: BorderRadius.circular(3),
                  ),
                  child: Text(
                    destination.distance,
                    style: const TextStyle(color: Colors.white, fontSize: 7),
                  ),
                ),
              ),
              Positioned(
                left: 8,
                right: 8,
                bottom: 7,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      destination.name,
                      maxLines: 1,
                      overflow: TextOverflow.ellipsis,
                      style: const TextStyle(
                        color: Colors.white,
                        fontSize: 9,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    const SizedBox(height: 3),
                    Row(
                      children: [
                        const Icon(
                          Icons.location_on,
                          color: Colors.red,
                          size: 10,
                        ),
                        Expanded(
                          child: Text(
                            destination.location,
                            overflow: TextOverflow.ellipsis,
                            style: const TextStyle(
                              color: Colors.white,
                              fontSize: 7,
                            ),
                          ),
                        ),
                      ],
                    ),
                    Text(
                      destination.price,
                      style: const TextStyle(color: Colors.white, fontSize: 7),
                    ),
                    const SizedBox(height: 4),
                    Row(
                      children: [
                        Row(
                          mainAxisSize: MainAxisSize.min,
                          children: List.generate(
                            5,
                            (_) => const Icon(
                              Icons.star,
                              color: Colors.amber,
                              size: 9,
                            ),
                          ),
                        ),
                        const SizedBox(width: 4),
                        const Expanded(
                          child: Text(
                            'Lebih Lanjut >',
                            textAlign: TextAlign.end,
                            overflow: TextOverflow.ellipsis,
                            style: TextStyle(color: Colors.white, fontSize: 6),
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
  }

  Widget _buildCategories() {
    return SizedBox(
      height: 28,
      child: ListView.separated(
        scrollDirection: Axis.horizontal,
        itemCount: categories.length,
        separatorBuilder: (_, index) => const SizedBox(width: 20),
        itemBuilder: (_, index) {
          final selected = index == 0;
          return GestureDetector(
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (_) =>
                      CategoryScreen(initialCategory: categories[index]),
                ),
              );
            },
            child: Container(
              padding: EdgeInsets.symmetric(horizontal: selected ? 11 : 0),
              alignment: Alignment.center,
              decoration: BoxDecoration(
                color: selected ? primaryGreen : Colors.transparent,
                borderRadius: BorderRadius.circular(18),
              ),
              child: Text(
                categories[index],
                style: TextStyle(
                  color: selected ? Colors.white : Colors.black87,
                  fontSize: 12,
                  fontWeight: selected ? FontWeight.w600 : FontWeight.normal,
                ),
              ),
            ),
          );
        },
      ),
    );
  }

  Widget _buildLandscapeList() {
    return SizedBox(
      height: 105,
      child: ListView.separated(
        scrollDirection: Axis.horizontal,
        itemCount: destinations.length,
        separatorBuilder: (_, index) => const SizedBox(width: 16),
        itemBuilder: (_, index) => SizedBox(
          width: 145,
          child: _buildDestinationCard(destinations[index]),
        ),
      ),
    );
  }

  Widget _buildCompareBanner() {
    return Container(
      height: 103,
      padding: const EdgeInsets.fromLTRB(13, 16, 90, 10),
      decoration: BoxDecoration(
        color: lightGreen,
        borderRadius: BorderRadius.circular(9),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Text(
            'Banyak pilihan tempat wisata bikin bingung?',
            maxLines: 1,
            overflow: TextOverflow.ellipsis,
            style: TextStyle(
              color: Colors.white,
              fontSize: 12,
              fontWeight: FontWeight.bold,
            ),
          ),
          const SizedBox(height: 3),
          const Text(
            'Bandingkan sekarang dan temukan yang terbaik!',
            style: TextStyle(color: Colors.white70, fontSize: 8),
          ),
          const Spacer(),
          Container(
            padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 6),
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(14),
            ),
            child: const Text(
              'Bandingkan Sekarang',
              style: TextStyle(
                color: primaryGreen,
                fontSize: 8,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildBottomNavigationBar() {
    const items = [
      ('beranda.icon.svg', 'BERANDA'),
      ('rekomendasi_icon.svg', 'REKOMENDASI'),
      ('favorit_icon.svg', 'FAVORIT'),
      ('akun_icon.svg', 'AKUN'),
    ];

    return SizedBox(
      height: 76,
      child: Stack(
        alignment: Alignment.bottomCenter,
        children: [
          Container(height: 56, color: primaryGreen),
          Row(
            crossAxisAlignment: CrossAxisAlignment.end,
            children: [
              for (var index = 0; index < items.length; index++)
                Expanded(
                  child: GestureDetector(
                    key: Key('home-nav-${items[index].$2.toLowerCase()}'),
                    onTap: () {
                      if (index == 3) {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (_) => const ProfileScreen(),
                          ),
                        );
                        return;
                      }
                      setState(() => _selectedNav = index);
                    },
                    child: index == _selectedNav
                        ? _buildActiveNavItem(items[index].$1, items[index].$2)
                        : SizedBox(
                            height: 56,
                            child: SizedBox(
                              height: 56,
                              child: Center(
                                child: SvgPicture.asset(
                                  'lib/assets/icons/${items[index].$1}',
                                  width: 24,
                                  height: 24,
                                  colorFilter: const ColorFilter.mode(
                                    Colors.white70,
                                    BlendMode.srcIn,
                                  ),
                                ),
                              ),
                            ),
                          ),
                  ),
                ),
            ],
          ),
        ],
      ),
    );
  }

  Widget _buildActiveNavItem(String svgName, String label) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.end,
      children: [
        Container(
          width: 50,
          height: 50,
          decoration: const BoxDecoration(
            color: primaryGreen,
            shape: BoxShape.circle,
          ),
          child: Center(
            child: Container(
              width: 40,
              height: 40,
              decoration: const BoxDecoration(
                color: Colors.white,
                shape: BoxShape.circle,
              ),
              child: Center(
                child: SvgPicture.asset(
                  'lib/assets/icons/$svgName',
                  width: 22,
                  height: 22,
                  colorFilter: const ColorFilter.mode(
                    primaryGreen,
                    BlendMode.srcIn,
                  ),
                ),
              ),
            ),
          ),
        ),
        const SizedBox(height: 2),
        Text(
          label,
          style: const TextStyle(
            color: Colors.white,
            fontSize: 10,
            fontWeight: FontWeight.bold,
          ),
        ),
        const SizedBox(height: 3),
      ],
    );
  }
}

class _WeatherIllustration extends StatelessWidget {
  const _WeatherIllustration();

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 120,
      child: Stack(
        alignment: Alignment.center,
        children: [
          Positioned(
            top: 3,
            right: 26,
            child: Container(
              width: 62,
              height: 62,
              decoration: const BoxDecoration(
                color: Color(0xFFFFDD00),
                shape: BoxShape.circle,
              ),
            ),
          ),
          const Positioned(
            bottom: 5,
            left: 0,
            right: 0,
            child: Icon(Icons.cloud, color: Color(0xFFB9DDF4), size: 102),
          ),
          const Positioned(
            bottom: 4,
            left: 8,
            right: 8,
            child: Icon(
              Icons.cloud_outlined,
              color: Color(0xFF087DB5),
              size: 102,
            ),
          ),
        ],
      ),
    );
  }
}

class _DestinationIllustration extends StatelessWidget {
  const _DestinationIllustration({required this.destination});

  final _Destination destination;

  @override
  Widget build(BuildContext context) {
    return Image.asset(
      destination.imagePath,
      fit: BoxFit.cover,
      errorBuilder: (_, error, stackTrace) => Container(
        color: destination.color,
        alignment: Alignment.center,
        child: Icon(destination.icon, color: Colors.white70, size: 70),
      ),
    );
  }
}

class _Destination {
  final String name;
  final String location;
  final String price;
  final String distance;
  final String imagePath;
  final Color color;
  final IconData icon;

  const _Destination({
    required this.name,
    required this.location,
    required this.price,
    required this.distance,
    required this.imagePath,
    required this.color,
    required this.icon,
  });
}
