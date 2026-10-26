import 'package:flutter/material.dart';

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
          _PlaceholderScreen(title: 'Explore'),
          _PlaceholderScreen(title: 'Chat'),
          ProfileScreen(showBottomNavigation: false),
        ],
      ),
      bottomNavigationBar: _buildBottomNavigationBar(),
    );
  }

  Widget _buildBottomNavigationBar() {
    const items = [
      (Icons.home_outlined, 'BERANDA'),
      (Icons.shield_outlined, 'EXPLORE'),
      (Icons.chat_bubble_outline, 'CHAT'),
      (Icons.person_outline, 'AKUN'),
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
                    onTap: () => setState(() => _selectedIndex = index),
                    child: index == _selectedIndex
                        ? _buildActiveItem(items[index].$1, items[index].$2)
                        : SizedBox(
                            height: 56,
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Icon(
                                  items[index].$1,
                                  color: Colors.white,
                                  size: 26,
                                ),
                                const SizedBox(height: 3),
                                Text(
                                  items[index].$2,
                                  style: const TextStyle(
                                    color: Colors.white,
                                    fontSize: 9,
                                  ),
                                ),
                              ],
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

  Widget _buildActiveItem(IconData icon, String label) {
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
              child: Icon(icon, color: Colors.black87, size: 22),
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
