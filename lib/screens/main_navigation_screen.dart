import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

import 'home/home_screen.dart';
import 'profile/profile_screen.dart';

class MainNavigationScreen extends StatefulWidget {
  const MainNavigationScreen({super.key});

  @override
  State<MainNavigationScreen> createState() => _MainNavigationScreenState();
}

class _MainNavigationScreenState extends State<MainNavigationScreen> {
  static const primaryGreen = Color(0xFF176B5B);
  int _selectedIndex = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: IndexedStack(
        index: _selectedIndex,
        children: const [
          HomeScreen(showBottomNavigation: false),
          _PlaceholderScreen(title: 'Rekomendasi'),
          _PlaceholderScreen(title: 'Favorit'),
          ProfileScreen(showBottomNavigation: false),
        ],
      ),
      bottomNavigationBar: _buildBottomNavigationBar(),
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
                    key: Key('bottom-nav-${items[index].$2.toLowerCase()}'),
                    onTap: () => setState(() => _selectedIndex = index),
                    child: index == _selectedIndex
                        ? _buildActiveItem(items[index].$2, items[index].$1)
                        : SizedBox(
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
            ],
          ),
        ],
      ),
    );
  }

  Widget _buildActiveItem(String label, String svgName) {
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

class _PlaceholderScreen extends StatelessWidget {
  const _PlaceholderScreen({required this.title});

  final String title;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text(title)),
      body: Center(child: Text('$title belum tersedia.')),
    );
  }
}
