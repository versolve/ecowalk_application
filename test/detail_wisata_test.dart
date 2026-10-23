import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:ecowalk_application/screens/home/home_screen.dart';
import 'package:ecowalk_application/screens/home/detail_wisata_screen.dart';

void main() {
  testWidgets('DetailWisataScreen menampilkan informasi DUFAN', (tester) async {
    await tester.pumpWidget(
      const MaterialApp(
        home: DetailWisataScreen(
          name: 'Dunia Fantasi (DUFAN)',
          imagePath: 'lib/assets/images/dufan.jpg',
          location: 'Jl. Lodan Timur No. 7, Ancol, Jakarta Utara',
          price: 'Rp. 190.000 - Rp. 400.000',
        ),
      ),
    );

    expect(
      find.widgetWithText(AppBar, 'Dunia Fantasi (DUFAN)'),
      findsOneWidget,
    );
    expect(find.text('Open | 10:00 - 22:00'), findsOneWidget);
    expect(find.text('Nilai & Ulasan'), findsOneWidget);
    expect(find.text('Lihat Peta'), findsOneWidget);
    expect(find.text('Rp. 190.000 - Rp. 400.000'), findsOneWidget);
  });

  testWidgets('HomeScreen membuka detail saat card destinasi ditekan', (
    tester,
  ) async {
    await tester.pumpWidget(const MaterialApp(home: HomeScreen()));

    await tester.tap(find.text('Dunia Fantasi (DUFAN)').first);
    await tester.pumpAndSettle();

    expect(find.byType(DetailWisataScreen), findsOneWidget);
  });
}
