import 'package:flutter/material.dart';

class HeaderDiagonalClipper extends CustomClipper<Path> {
  @override
  Path getClip(Size size) {
    Path path = Path();
    
    // Titik awal default ada di (0,0) yaitu kiri atas
    
    // 1. Tarik garis dari kiri atas ke kiri bawah
    path.lineTo(0, size.height); 
    
    // 2. Tarik garis dari kiri bawah ke kanan bawah
    // Dikurangi 60 agar sisi kanan bawah posisinya lebih tinggi (miring ke atas)
    path.lineTo(size.width, size.height - 60); 
    
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