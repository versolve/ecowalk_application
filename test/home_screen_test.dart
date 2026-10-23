import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:ecowalk_application/screens/home/home_screen.dart';
import 'package:ecowalk_application/screens/profile/profile_screen.dart';

void main() {
  testWidgets('HomeScreen menampilkan elemen utama dari referensi UI', (
    tester,
  ) async {
    await tester.pumpWidget(const MaterialApp(home: HomeScreen()));

    expect(find.text('ECOWA'), findsOneWidget);
    expect(find.byIcon(Icons.notifications_none), findsOneWidget);
    expect(find.text('Minggu, 16 Febuari 2025'), findsOneWidget);
    expect(find.text('Klapanunggal, Bogor'), findsOneWidget);
    expect(find.text('30°C'), findsOneWidget);
    expect(find.text('Cerah Berawan'), findsOneWidget);
    expect(find.text('Rekomendasi'), findsOneWidget);
    expect(find.text('BERANDA'), findsOneWidget);

    await tester.scrollUntilVisible(
      find.text('Kategori'),
      400,
      scrollable: find.byType(Scrollable).first,
    );
    expect(find.text('Kategori'), findsOneWidget);
    expect(find.text('Semua'), findsOneWidget);
    expect(find.text('Kuliner'), findsOneWidget);

    await tester.scrollUntilVisible(
      find.text('Banyak pilihan tempat wisata bikin bingung?'),
      400,
      scrollable: find.byType(Scrollable).first,
    );
    expect(find.text('Pilihan Teratas'), findsOneWidget);
    expect(
      find.text('Banyak pilihan tempat wisata bikin bingung?'),
      findsOneWidget,
    );
    expect(find.text('Bandingkan Sekarang'), findsOneWidget);

    await tester.scrollUntilVisible(
      find.text('Terakhir Dilihat'),
      500,
      scrollable: find.byType(Scrollable).first,
    );
    expect(find.text('Kunjungi Lagi'), findsOneWidget);
    expect(find.text('Terakhir Dilihat'), findsOneWidget);
  });

  testWidgets('HomeScreen memakai asset foto destinasi', (tester) async {
    await tester.pumpWidget(const MaterialApp(home: HomeScreen()));

    final assetNames = tester
        .widgetList<Image>(find.byType(Image))
        .map((image) => (image.image as AssetImage).assetName)
        .toList();

    expect(assetNames, contains('lib/assets/images/dufan.jpg'));
    expect(assetNames, contains('lib/assets/images/tmii.jpg'));
    expect(assetNames, contains('lib/assets/images/taman_safari.jpg'));
  });

  testWidgets('HomeScreen membuka ProfileScreen dari tab akun', (tester) async {
    await tester.pumpWidget(const MaterialApp(home: HomeScreen()));

    await tester.tap(find.byIcon(Icons.person_outline));
    await tester.pumpAndSettle();

    expect(find.byType(ProfileScreen), findsOneWidget);
  });
}
