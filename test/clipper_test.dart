import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:ecowalk_application/widgets/custom_clipper.dart';

void main() {
  test('header diagonal turun ke kanan: kiri tinggi, kanan penuh', () {
    const size = Size(400, 260);
    final path = HeaderDiagonalClipper().getClip(size);

    // Pojok kiri atas -> turun ke kiri bawah, dipotong 60 (lebih tinggi)
    expect(path.contains(Offset(0, size.height - 60)), true);
    // Pojok kanan bawah penuh masih termasuk
    expect(path.contains(Offset(size.width - 1, size.height - 1)), true);
    // Titik di bawah potongan kiri (y > height-60) di kiri TIDAK termasuk
    expect(path.contains(const Offset(1, 250)), false);
  });
}
