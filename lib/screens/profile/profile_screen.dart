import 'package:flutter/material.dart';

import '../auth/login_screen.dart';
import 'edit_profile_screen.dart';
import 'settings_screen.dart';
import 'privacy_policy_screen.dart';
import 'about_us_screen.dart';
import 'terms_of_service_screen.dart';
import 'profile_widgets.dart';

class ProfileScreen extends StatelessWidget {
  const ProfileScreen({super.key});

  static const Color primaryGreen = Color(0xFF1B5E4B);

  void _showLogoutDialog(BuildContext context) {
    showDialog<void>(
      context: context,
      builder: (context) => AlertDialog(
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
        title: const Text(
          'Keluar?',
          style: TextStyle(fontWeight: FontWeight.bold, fontSize: 18),
        ),
        content: const Text('Apakah Kamu Yakin Ingin Keluar?'),
        actionsPadding: const EdgeInsets.symmetric(
          horizontal: 16,
          vertical: 12,
        ),
        actions: [
          Row(
            children: [
              Expanded(
                child: ElevatedButton(
                  onPressed: () => Navigator.pop(context),
                  style: ElevatedButton.styleFrom(
                    backgroundColor: primaryGreen,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(8),
                    ),
                  ),
                  child: const Text(
                    'Batal',
                    style: TextStyle(
                      color: Colors.white,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
              ),
              const SizedBox(width: 12),
              Expanded(
                child: OutlinedButton(
                  onPressed: () {
                    Navigator.pushAndRemoveUntil(
                      context,
                      MaterialPageRoute(builder: (_) => const LoginScreen()),
                      (route) => false,
                    );
                  },
                  style: OutlinedButton.styleFrom(
                    side: const BorderSide(color: primaryGreen, width: 1.5),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(8),
                    ),
                  ),
                  child: const Text(
                    'Keluar',
                    style: TextStyle(
                      color: primaryGreen,
                      fontWeight: FontWeight.bold,
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

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Column(
        children: [
          Stack(
            clipBehavior: Clip.none,
            alignment: Alignment.bottomCenter,
            children: [
              Container(
                width: double.infinity,
                height: 160,
                color: primaryGreen,
              ),
              const Positioned(bottom: -50, child: ProfileAvatar(radius: 50)),
            ],
          ),
          const SizedBox(height: 58),
          const Text(
            'KAYI NYAP NYAP',
            style: TextStyle(
              fontSize: 18,
              fontWeight: FontWeight.w900,
              color: Colors.black87,
              letterSpacing: 0.5,
            ),
          ),
          const SizedBox(height: 8),
          Container(
            padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 6),
            decoration: BoxDecoration(
              color: primaryGreen,
              borderRadius: BorderRadius.circular(20),
            ),
            child: const Text(
              'kayimail@gmail.com',
              style: TextStyle(
                color: Colors.white,
                fontSize: 12,
                fontWeight: FontWeight.w500,
              ),
            ),
          ),
          const SizedBox(height: 20),
          Expanded(
            child: ListView(
              padding: const EdgeInsets.symmetric(horizontal: 16),
              children: [
                _buildMenuItem(
                  context,
                  Icons.settings_outlined,
                  'Pengaturan',
                  () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (_) => const SettingsScreen()),
                    );
                  },
                ),
                _buildMenuItem(context, Icons.edit_outlined, 'Edit Profil', () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (_) => const EditProfileScreen(),
                    ),
                  );
                }),
                _buildMenuItem(
                  context,
                  Icons.lock_outline,
                  'Kebijakan Privasi',
                  () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (_) => const PrivacyPolicyScreen(),
                      ),
                    );
                  },
                ),
                _buildMenuItem(context, Icons.info_outline, 'Tentang Kami', () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (_) => const AboutUsScreen()),
                  );
                }),
                _buildMenuItem(
                  context,
                  Icons.assignment_outlined,
                  'Ketentuan Layanan',
                  () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (_) => const TermsOfServiceScreen(),
                      ),
                    );
                  },
                ),
                _buildMenuItem(
                  context,
                  Icons.logout,
                  'Keluar',
                  () => _showLogoutDialog(context),
                  isLogout: true,
                ),
              ],
            ),
          ),
        ],
      ),
      bottomNavigationBar: _buildCustomBottomNavBar(),
    );
  }

  Widget _buildMenuItem(
    BuildContext context,
    IconData icon,
    String title,
    VoidCallback onTap, {
    bool isLogout = false,
  }) {
    return Column(
      children: [
        ListTile(
          contentPadding: const EdgeInsets.symmetric(horizontal: 12),
          leading: Icon(icon, color: Colors.black87, size: 24),
          title: Text(
            title,
            style: const TextStyle(
              fontSize: 14,
              fontWeight: FontWeight.w600,
              color: Colors.black87,
            ),
          ),
          trailing: const Icon(
            Icons.arrow_forward_ios,
            size: 16,
            color: Colors.black87,
          ),
          onTap: onTap,
        ),
        if (!isLogout)
          Divider(
            height: 1,
            color: Colors.grey.shade300,
            indent: 12,
            endIndent: 12,
          ),
      ],
    );
  }

  Widget _buildCustomBottomNavBar() {
    return SizedBox(
      height: 76,
      child: Stack(
        alignment: Alignment.bottomCenter,
        children: [
          Container(height: 56, color: primaryGreen),
          Row(
            crossAxisAlignment: CrossAxisAlignment.end,
            children: [
              Expanded(
                child: SizedBox(
                  height: 56,
                  child: IconButton(
                    icon: const Icon(
                      Icons.home_outlined,
                      color: Colors.white,
                      size: 28,
                    ),
                    onPressed: () {},
                  ),
                ),
              ),
              Expanded(
                child: SizedBox(
                  height: 56,
                  child: IconButton(
                    icon: const Icon(
                      Icons.shield_outlined,
                      color: Colors.white,
                      size: 26,
                    ),
                    onPressed: () {},
                  ),
                ),
              ),
              Expanded(
                child: SizedBox(
                  height: 56,
                  child: IconButton(
                    icon: const Icon(
                      Icons.chat_bubble_outline,
                      color: Colors.white,
                      size: 26,
                    ),
                    onPressed: () {},
                  ),
                ),
              ),
              Expanded(
                child: Column(
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
                          child: const Icon(
                            Icons.person,
                            color: Colors.black87,
                            size: 22,
                          ),
                        ),
                      ),
                    ),
                    const SizedBox(height: 2),
                    const Text(
                      'AKUN',
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 10,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    const SizedBox(height: 3),
                  ],
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
