import 'package:flutter/material.dart';

import 'profile_widgets.dart';

class TermsOfServiceScreen extends StatelessWidget {
  const TermsOfServiceScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: const ProfileAppBar(title: 'Ketentuan Layanan'),
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
              'KETENTUAN PENGGUNAAN APLIKASI ECOWALK',
              style: TextStyle(fontWeight: FontWeight.bold, fontSize: 13),
            ),
            const Text(
              'Diperbaharui tanggal 16 Februari 2024',
              style: TextStyle(fontStyle: FontStyle.italic, fontSize: 11),
            ),
            const SizedBox(height: 26),
            const Text(
              'Selamat datang di ECOWALK! Dengan menggunakan aplikasi ini, Anda setuju dengan ketentuan dan persyaratan berikut:\n\n'
              '1. Dengan menggunakan aplikasi ECOWALK, Anda dapat menemukan informasi tentang tempat wisata, rekomendasi tempat, perbandingan harga, dan layanan peta berbasis lokasi.\n\n'
              '2. Anda bertanggung jawab atas keakuratan data, termasuk ulasan dan foto, yang Anda masukkan.\n\n'
              '3. Perubahan Layanan\n'
              'ECOWALK berhak mengubah, menambah, atau menghentikan layanan tanpa pemberitahuan sebelumnya. Pengguna bertanggung jawab atas keamanan akun mereka, termasuk kata sandi. Pengguna juga dilarang menggunakan aplikasi untuk tujuan yang dapat merugikan pihak lain.\n'
              'Informasi yang diberikan oleh sumber seperti tiket atau biaya transportasi tidak akurat, dan kami tidak bertanggung jawab atas kesalahan tersebut.\n\n'
              '4. Penolakan Tanggung Jawab\n'
              '• ECOWALK hanya menyediakan informasi sebagai referensi dan bukan penyedia layanan wisata atau transportasi.\n'
              '• Kami tidak bertanggung jawab atas perubahan harga, ketersediaan tempat, atau keterlambatan transportasi.\n\n'
              'Dengan menggunakan aplikasi ini, Anda menyetujui semua ketentuan di atas.',
              style: TextStyle(fontSize: 13, height: 1.6),
            ),
          ],
        ),
      ),
    );
  }
}
