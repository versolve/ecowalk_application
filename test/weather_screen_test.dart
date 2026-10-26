import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:ecowalk_application/screens/home/home_screen.dart';
import 'package:ecowalk_application/screens/home/weather_screen.dart';

void main() {
  testWidgets('WeatherScreen menampilkan detail cuaca dan container rapi', (
    tester,
  ) async {
    await tester.pumpWidget(const MaterialApp(home: WeatherScreen()));

    expect(find.text('Cuaca'), findsOneWidget);
    expect(find.text('Prakiraan Cuaca'), findsOneWidget);
    expect(find.text('Klapanunggal, Bogor'), findsOneWidget);
    expect(find.text('30°C'), findsWidgets);
    expect(find.text('Kelembapan'), findsOneWidget);
    expect(find.text('92%'), findsOneWidget);
    expect(find.text('Kualitas Udara'), findsOneWidget);
    expect(find.text('39.1'), findsOneWidget);
    expect(find.text('Hari ini'), findsWidgets);

    final cards = find.byKey(const Key('weather-metric-card'));
    expect(cards, findsNWidgets(2));
    expect(
      tester.getTopLeft(cards.at(0)).dy,
      tester.getTopLeft(cards.at(1)).dy,
    );

    await tester.scrollUntilVisible(
      find.text('Aktivitas Harian'),
      300,
      scrollable: find.byType(Scrollable).first,
    );
    expect(find.text('Aktivitas Harian'), findsOneWidget);
  });

  testWidgets('HomeScreen membuka WeatherScreen dari card cuaca', (
    tester,
  ) async {
    await tester.pumpWidget(const MaterialApp(home: HomeScreen()));

    await tester.tap(find.text('30°C').first);
    await tester.pumpAndSettle();

    expect(find.byType(WeatherScreen), findsOneWidget);
  });
}
