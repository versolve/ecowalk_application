import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:ecowalk_application/screens/home/category_screen.dart';
import 'package:ecowalk_application/screens/home/home_screen.dart';
import 'package:ecowalk_application/screens/home/recently_viewed_screen.dart';
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
    expect(
      find.byKey(const Key('home-weather-smart-city-icon')),
      findsOneWidget,
    );
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
      find.byKey(const Key('compare-banner-image')),
      400,
      scrollable: find.byType(Scrollable).first,
    );
    expect(find.text('Pilihan Teratas'), findsOneWidget);
    expect(find.byKey(const Key('compare-banner-image')), findsOneWidget);

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
    await tester.scrollUntilVisible(
      find.byKey(const Key('compare-banner-image')),
      400,
      scrollable: find.byType(Scrollable).first,
    );
    expect(find.byKey(const Key('compare-banner-image')), findsOneWidget);
  });

  testWidgets('HomeScreen membuka ProfileScreen dari tab akun', (tester) async {
    await tester.pumpWidget(const MaterialApp(home: HomeScreen()));

    await tester.tap(find.byKey(const Key('home-nav-akun')));
    await tester.pumpAndSettle();

    expect(find.byType(ProfileScreen), findsOneWidget);
  });

  testWidgets('chip kategori Home memfilter list destinasi', (tester) async {
    await tester.pumpWidget(const MaterialApp(home: HomeScreen()));

    await tester.scrollUntilVisible(
      find.text('Alam'),
      200,
      scrollable: find.byType(Scrollable).first,
    );

    // Filter "Alam" langsung di halaman Home (tanpa pindah halaman)
    await tester.tap(find.text('Alam'));
    await tester.pumpAndSettle();

    expect(find.byType(HomeScreen), findsOneWidget);
    expect(find.byType(CategoryScreen), findsNothing);
    expect(find.text('Taman Safari Indonesia'), findsWidgets);
    expect(find.text('Dunia Fantasi (DUFAN)'), findsNothing);
    expect(find.text('Taman Mini Indonesia Indah (TMII)'), findsNothing);
  });

  testWidgets('tombol Jelajahi membuka CategoryScreen', (tester) async {
    await tester.pumpWidget(const MaterialApp(home: HomeScreen()));

    await tester.scrollUntilVisible(
      find.text('Jelajahi'),
      200,
      scrollable: find.byType(Scrollable).first,
    );

    await tester.tap(find.text('Jelajahi'));
    await tester.pumpAndSettle();

    expect(find.byType(CategoryScreen), findsOneWidget);
  });

  testWidgets('tombol Kunjungi Lagi membuka riwayat destinasi', (tester) async {
    await tester.pumpWidget(const MaterialApp(home: HomeScreen()));

    await tester.scrollUntilVisible(
      find.text('Kunjungi Lagi'),
      300,
      scrollable: find.byType(Scrollable).first,
    );
    await tester.tap(find.text('Kunjungi Lagi').last);
    await tester.pumpAndSettle();

    expect(find.byType(RecentlyViewedScreen), findsOneWidget);
  });

  testWidgets('tombol AI floating menampilkan icon robot di kanan bawah', (
    tester,
  ) async {
    await tester.pumpWidget(const MaterialApp(home: HomeScreen()));
    await tester.pumpAndSettle();

    expect(
      find.byKey(const Key('ai-floating-button')),
      findsOneWidget,
    );
    final images = tester.widgetList<Image>(find.byType(Image)).toList();
    expect(
      images.any((image) =>
          image.image is AssetImage &&
          (image.image as AssetImage).assetName == 'lib/assets/icons/robot.png'),
      isTrue,
    );
  });
}
