import 'package:flutter/material.dart';

import 'profile_widgets.dart';

class PrivacyPolicyScreen extends StatelessWidget {
  const PrivacyPolicyScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: const ProfileAppBar(title: 'Kebijakan Privasi'),
      body: SingleChildScrollView(
        padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 24),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Align(
              alignment: Alignment.centerRight,
              child: EcoWalkSmallLogo(),
            ),
            const SizedBox(height: 20),
            const Text(
              'KEBIJAKAN PRIVASI APLIKASI ECOWALK',
              style: TextStyle(fontWeight: FontWeight.bold, fontSize: 13),
            ),
            const Text(
              'Diperbaharui tanggal 16 Februari 2024',
              style: TextStyle(
                fontStyle: FontStyle.italic,
                fontSize: 11,
                color: Colors.black87,
              ),
            ),
            const SizedBox(height: 24),
            const Text(
              'Kami menghargai privasi pengguna. Kebijakan ini menjelaskan bagaimana ECOWALK mengumpulkan, menggunakan, dan melindungi data Anda.\n\n'
              '1. Data yang Kami Kumpulkan\n'
              'Kami dapat mengumpulkan data berikut:\n'
              '• Data Pribadi: Nama, email, dan informasi akun.\n'
              '• Data Lokasi: Untuk memberikan rekomendasi wisata dan perhitungan jarak.\n'
              '• Ulasan dan Foto: Jika Anda memposting ulasan atau berbagi pengalaman wisata.\n\n'
              '2. Cara Kami Menggunakan Data\n'
              '• Memberikan rekomendasi tempat wisata berdasarkan lokasi.\n'
              '• Memproses pencarian dan filter destinasi sesuai preferensi.\n'
              '• Menampilkan ulasan dan foto yang dibagikan pengguna lain.\n'
              '• Menyediakan informasi transportasi berdasarkan data lokasi.\n\n'
              '3. Keamanan Data\n'
              'Kami menggunakan enkripsi dan metode keamanan lainnya untuk melindungi data Anda.\n\n'
              '4. Hak Pengguna\n'
              '• Anda dapat memperbarui atau menghapus informasi akun kapan saja.\n'
              '• Anda dapat menonaktifkan fitur lokasi jika tidak ingin berbagi data lokasi.\n'
              '• Kami tidak akan membagikan data pribadi Anda kepada pihak ketiga tanpa izin.\n',
              style: TextStyle(
                fontSize: 13,
                height: 1.5,
                color: Colors.black87,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
