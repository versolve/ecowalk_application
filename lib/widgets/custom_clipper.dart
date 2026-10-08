import 'package:flutter/material.dart';

class HeaderDiagonalClipper extends CustomClipper<Path> {
  @override
  Path getClip(Size size) {
    Path path = Path();

    // Titik awal default ada di (0,0) yaitu kiri atas

    // 1. Tarik garis ke kiri bawah, tetapi posisinya dikurangi (lebih tinggi)
    path.lineTo(0, size.height - 60);

    // 2. Tarik garis turun ke sudut kanan bawah penuh
    path.lineTo(size.width, size.height);

    // 3. Tarik garis dari kanan bawah ke kanan atas
    path.lineTo(size.width, 0);

    // 4. Tutup jalur kembali ke titik awal (0,0)
    path.close();

    return path;
  }

  @override
  bool shouldReclip(covariant CustomClipper<Path> oldClipper) {
    // Karena bentuk potongannya statis (tidak berubah-ubah), kita kembalikan false
    return false;
  }
}
