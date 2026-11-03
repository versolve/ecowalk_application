import 'package:flutter/material.dart';
import 'package:flutter_map/flutter_map.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:ecowalk_application/screens/home/recommendation_screen.dart';
import 'package:ecowalk_application/screens/main_navigation_screen.dart';

void main() {
  testWidgets('RecommendationScreen menampilkan pencarian rute', (tester) async {
    await tester.pumpWidget(const MaterialApp(home: RecommendationScreen()));

    expect(find.text('MAU KEMANA HARI INI?'), findsOneWidget);
    expect(find.text('Masukan Lokasi Asal'), findsOneWidget);
    expect(find.text('Masukan Lokasi Tujuan'), findsOneWidget);
    expect(find.text('Cari Rute'), findsOneWidget);
    expect(find.text('Rekomendasi Tujuan'), findsOneWidget);
  });

  testWidgets('Cari Rute membuka perbandingan transportasi', (tester) async {
    await tester.pumpWidget(const MaterialApp(home: RecommendationScreen()));

    await tester.tap(find.text('Cari Rute'));
    await tester.pumpAndSettle();

    expect(find.byType(RouteRecommendationScreen), findsOneWidget);
    expect(find.text('KLAPANUNGGAL'), findsOneWidget);
    expect(find.text('Trans Studio Cibubur'), findsOneWidget);
    expect(find.text('Opsi Kendaraan'), findsOneWidget);
    expect(find.text('Ojek Online'), findsOneWidget);
    expect(find.text('Transportasi Umum'), findsOneWidget);
  });

  testWidgets('Menu rekomendasi pada navigasi utama membuka halaman rekomendasi', (
    tester,
  ) async {
    await tester.pumpWidget(const MaterialApp(home: MainNavigationScreen()));

    await tester.tap(find.byKey(const Key('bottom-nav-rekomendasi')));
    await tester.pumpAndSettle();

    expect(find.byType(RecommendationScreen), findsOneWidget);
    expect(find.text('BERANDA'), findsNothing);
    expect(find.text('REKOMENDASI'), findsOneWidget);
  });

  testWidgets('Transportasi umum membuka detail dan jadwal keberangkatan', (
    tester,
  ) async {
    await tester.pumpWidget(const MaterialApp(home: RecommendationScreen()));

    await tester.tap(find.text('Cari Rute'));
    await tester.pumpAndSettle();
    await tester.tap(find.byKey(const Key('vehicle-public-transport')));
    await tester.pumpAndSettle();

    expect(find.byType(PublicTransportDetailScreen), findsOneWidget);
    await tester.ensureVisible(find.text('TransJakarta'));
    await tester.pumpAndSettle();
    expect(find.text('Opsi Transportasi Umum'), findsOneWidget);
    expect(find.text('TransJakarta'), findsOneWidget);

    await tester.tap(find.text('TransJakarta'));
    await tester.pumpAndSettle();
    expect(find.text('TransJakarta'), findsAtLeastNWidgets(1));
    expect(find.text('Kelebihan'), findsOneWidget);
    expect(find.text('Kekurangan'), findsOneWidget);
    expect(
      find.textContaining('Jalur khusus bus mengurangi risiko terjebak macet'),
      findsOneWidget,
    );
    expect(
      find.textContaining('Kepadatan penumpang pada jam sibuk'),
      findsOneWidget,
    );

    final tjImages = tester.widgetList<Image>(find.byType(Image));
    expect(
      tjImages.any(
        (image) =>
            image.image is AssetImage &&
            (image.image as AssetImage).assetName == 'lib/assets/images/tj.png',
      ),
      isTrue,
    );

    await tester.ensureVisible(find.text('Selengkapnya'));
    await tester.pumpAndSettle();
    await tester.tap(find.text('Selengkapnya'));
    await tester.pumpAndSettle();
    expect(find.byType(DepartureScreen), findsOneWidget);
    expect(find.text('Terlambat 11 mnt'), findsOneWidget);
  });

  testWidgets('detail MRT, LRT, KRL, dan Mikrotrans membuka banner gambar masing-masing', (
    tester,
  ) async {
    final modes = [
      ('MRT Jakarta', 'lib/assets/images/mrt.png', 'MRT Jakarta'),
      ('LRT Jabodetabek', 'lib/assets/images/lrt.png', 'LRT Jakarta'),
      ('KRL Commuter Line', 'lib/assets/images/krl.png', 'KRL (Commuter Line)'),
      ('Mikrotrans (JakLingko)', 'lib/assets/images/microtrans.png', 'Jaklingko (Microtrans)'),
    ];

    for (final mode in modes) {
      await tester.pumpWidget(const SizedBox());
      await tester.pumpWidget(const MaterialApp(home: RecommendationScreen()));
      await tester.pumpAndSettle();
      await tester.ensureVisible(find.text('Cari Rute'));
      await tester.tap(find.text('Cari Rute'));
      await tester.pumpAndSettle();
      await tester.tap(find.byKey(const Key('vehicle-public-transport')));
      await tester.pumpAndSettle();

      await tester.ensureVisible(find.text(mode.$1));
      await tester.pumpAndSettle();
      await tester.tap(find.text(mode.$1));
      await tester.pumpAndSettle();

      expect(find.text(mode.$3), findsAtLeastNWidgets(1));
      final modeImages = tester.widgetList<Image>(find.byType(Image));
      expect(
        modeImages.any(
          (image) =>
              image.image is AssetImage &&
              (image.image as AssetImage).assetName == mode.$2,
        ),
        isTrue,
      );
    }
  });

  testWidgets('kardus transportasi menampilkan aset gambar yang sesuai', (
    tester,
  ) async {
    await tester.pumpWidget(const MaterialApp(home: RecommendationScreen()));
    await tester.tap(find.text('Cari Rute'));
    await tester.pumpAndSettle();

    final assetNames = tester
        .widgetList<Image>(find.byType(Image))
        .map((image) => (image.image as AssetImage).assetName)
        .toSet();

    expect(assetNames, contains('lib/assets/images/Ojek-Online.jpg'));
    expect(assetNames, contains('lib/assets/images/transportasi-umum.jpg'));
    expect(assetNames, contains('lib/assets/images/taxi.jpg'));
  });

  testWidgets('halaman rekomendasi rute menampilkan peta FlutterMap', (
    tester,
  ) async {
    await tester.pumpWidget(const MaterialApp(home: RecommendationScreen()));
    await tester.tap(find.text('Cari Rute'));
    await tester.pumpAndSettle();

    expect(find.byType(FlutterMap), findsOneWidget);
  });

  testWidgets('detail Ojek Online menampilkan foto dan peta rute', (
    tester,
  ) async {
    await tester.pumpWidget(const MaterialApp(home: RecommendationScreen()));
    await tester.tap(find.text('Cari Rute'));
    await tester.pumpAndSettle();
    await tester.tap(find.text('Ojek Online'));
    await tester.pumpAndSettle();

    final images = tester.widgetList<Image>(find.byType(Image));
    expect(
      images.any(
        (image) =>
            image.image is AssetImage &&
            (image.image as AssetImage).assetName ==
                'lib/assets/images/Ojek-Online.jpg',
      ),
      isTrue,
    );
    expect(find.byType(FlutterMap), findsOneWidget);
  });
}
