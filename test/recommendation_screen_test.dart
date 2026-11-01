import 'package:flutter/material.dart';
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
    await tester.tap(find.text('Transportasi Umum').last);
    await tester.pumpAndSettle();

    expect(find.byType(PublicTransportDetailScreen), findsOneWidget);
    expect(find.text('Opsi Transportasi Umum'), findsOneWidget);

    await tester.tap(find.text('TransJakarta'));
    await tester.pumpAndSettle();
    expect(find.text('TRANSJAKARTA'), findsOneWidget);

    await tester.tap(find.text('Selengkapnya'));
    await tester.pumpAndSettle();
    expect(find.byType(DepartureScreen), findsOneWidget);
    expect(find.text('Terlambat 11 mnt'), findsOneWidget);
  });
}
