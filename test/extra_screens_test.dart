import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:ecowalk_application/screens/home/notification_screen.dart';
import 'package:ecowalk_application/screens/home/after_trip_screen.dart';
import 'package:ecowalk_application/screens/home/recently_viewed_screen.dart';
import 'package:ecowalk_application/screens/home/home_screen.dart';

void main() {
  testWidgets('NotificationScreen menampilkan daftar notifikasi', (
    tester,
  ) async {
    await tester.pumpWidget(const MaterialApp(home: NotificationScreen()));

    expect(find.text('Notifikasi'), findsOneWidget);
    expect(find.text('Perjalanan Selesai'), findsWidgets);
    expect(find.text('Tandai Semua Dibaca'), findsOneWidget);
  });

  testWidgets('AfterTripScreen menampilkan ringkasan perjalanan', (
    tester,
  ) async {
    await tester.pumpWidget(const MaterialApp(home: AfterTripScreen()));

    expect(find.text('Detail Perjalanan'), findsOneWidget);
    expect(find.text('Dunia Fantasi (DUFAN)'), findsOneWidget);
    expect(find.text('Beri Ulasan'), findsOneWidget);
  });

  testWidgets('RecentlyViewedScreen menampilkan riwayat destinasi', (
    tester,
  ) async {
    await tester.pumpWidget(const MaterialApp(home: RecentlyViewedScreen()));

    expect(find.text('Terakhir Dilihat'), findsOneWidget);
    expect(find.text('Dunia Fantasi (DUFAN)'), findsOneWidget);
    expect(find.text('Taman Mini Indonesia Indah (TMII)'), findsOneWidget);
  });

  testWidgets(
    'HomeScreen membuka NotificationScreen dan RecentlyViewedScreen',
    (tester) async {
      await tester.pumpWidget(const MaterialApp(home: HomeScreen()));

      await tester.tap(find.byIcon(Icons.notifications_none));
      await tester.pumpAndSettle();
      expect(find.byType(NotificationScreen), findsOneWidget);

      await tester.tap(find.byIcon(Icons.arrow_back));
      await tester.pumpAndSettle();

      await tester.scrollUntilVisible(
        find.byKey(const Key('recently-viewed-more')),
        400,
        scrollable: find.byType(Scrollable).first,
      );
      await tester.tap(find.byKey(const Key('recently-viewed-more')));
      await tester.pumpAndSettle();
      expect(find.byType(RecentlyViewedScreen), findsOneWidget);
    },
  );
}
