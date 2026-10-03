import 'package:flutter/material.dart';

class ProfileScreen extends StatelessWidget {
  const ProfileScreen({super.key});

  static const Color primaryGreen = Color(0xFF1B5E4B);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      // Hilangkan SafeArea di bagian atas agar warna hijau penuh hingga status bar
      body: Column(
        children: [
          // 1. Header Hijau & Foto Profil
          Stack(
            clipBehavior: Clip.none,
            alignment: Alignment.bottomCenter,
            children: [
              // Background Hijau Atas
              Container(
                width: double.infinity,
                height: 180,
                color: primaryGreen,
              ),
              // Foto Profil Bundar
              Positioned(
                bottom: -50,
                child: Container(
                  decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    border: Border.all(color: Colors.white, width: 4), // Border putih
                  ),
                  child: const CircleAvatar(
                    radius: 50,
                    backgroundColor: Colors.grey,
                    // Gunakan AssetImage('assets/profile.png') jika gambar ada di lokal
                    backgroundImage: NetworkImage(
                      'https://picsum.photos/200', // Placeholder gambar profil
                    ),
                  ),
                ),
              ),
            ],
          ),
          
          const SizedBox(height: 60), // Memberi ruang untuk foto profil yang overlap

          // 2. Nama Pengguna & Email
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

          const SizedBox(height: 24),

          // 3. Daftar Menu
          Expanded(
            child: ListView(
              padding: const EdgeInsets.symmetric(horizontal: 16),
              children: [
                _buildMenuItem(Icons.settings_outlined, 'Pengaturan'),
                _buildMenuItem(Icons.edit_outlined, 'Edit Profil'),
                _buildMenuItem(Icons.lock_outline, 'Kebijakan Privasi'),
                _buildMenuItem(Icons.info_outline, 'Tentang Kami'),
                _buildMenuItem(Icons.assignment_outlined, 'Ketentuan Layanan'),
                _buildMenuItem(Icons.logout, 'Keluar', isLogout: true),
              ],
            ),
          ),
        ],
      ),
      
      // 4. Custom Bottom Navigation Bar
      bottomNavigationBar: _buildCustomBottomNavBar(),
    );
  }

  // Widget Bantuan untuk Menu List
  Widget _buildMenuItem(IconData icon, String title, {bool isLogout = false}) {
    return Column(
      children: [
        ListTile(
          contentPadding: const EdgeInsets.symmetric(horizontal: 12),
          leading: Icon(icon, color: Colors.black87, size: 26),
          title: Text(
            title,
            style: const TextStyle(
              fontSize: 14,
              fontWeight: FontWeight.w600,
              color: Colors.black87,
            ),
          ),
          trailing: const Icon(Icons.arrow_forward_ios, size: 16, color: Colors.black87),
          onTap: () {
            // Logika ketika menu diklik
          },
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

  // Widget Bantuan untuk Custom Bottom Navigation Bar
  Widget _buildCustomBottomNavBar() {
    return SizedBox(
      height: 80, // Tinggi total untuk menampung tombol AKUN yang menonjol
      child: Stack(
        alignment: Alignment.bottomCenter,
        children: [
          // Background Bar Hijau
          Container(
            height: 60,
            decoration: const BoxDecoration(
              color: primaryGreen,
            ),
          ),
          
          // Ikon Navigasi
          Row(
            crossAxisAlignment: CrossAxisAlignment.end,
            children: [
              Expanded(
                child: SizedBox(
                  height: 60,
                  child: IconButton(
                    icon: const Icon(Icons.home_outlined, color: Colors.white, size: 28),
                    onPressed: () {},
                  ),
                ),
              ),
              Expanded(
                child: SizedBox(
                  height: 60,
                  child: IconButton(
                    icon: const Icon(Icons.shield_outlined, color: Colors.white, size: 26),
                    onPressed: () {},
                  ),
                ),
              ),
              Expanded(
                child: SizedBox(
                  height: 60,
                  child: IconButton(
                    icon: const Icon(Icons.chat_bubble_outline, color: Colors.white, size: 26),
                    onPressed: () {},
                  ),
                ),
              ),
              
              // Tab Aktif: AKUN
              Expanded(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    Container(
                      width: 56,
                      height: 56,
                      decoration: const BoxDecoration(
                        color: primaryGreen, // Warna tepi lingkaran luar
                        shape: BoxShape.circle,
                      ),
                      child: Center(
                        child: Container(
                          width: 44,
                          height: 44,
                          decoration: const BoxDecoration(
                            color: Colors.white, // Lingkaran dalam putih
                            shape: BoxShape.circle,
                          ),
                          child: const Icon(
                            Icons.person,
                            color: Colors.black87,
                            size: 24,
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
                    const SizedBox(height: 4), // Jarak ke bawah
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