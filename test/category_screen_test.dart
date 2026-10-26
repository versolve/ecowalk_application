import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:ecowalk_application/screens/home/category_screen.dart';
import 'package:ecowalk_application/screens/home/home_screen.dart';

void main() {
  testWidgets(
    'CategoryScreen menampilkan judul, tab kategori, filter, urutkan',
    (tester) async {
      await tester.pumpWidget(const MaterialApp(home: CategoryScreen()));

      expect(find.text('Kategori'), findsOneWidget);
      expect(find.text('Cari destinasi wisata'), findsOneWidget);
      expect(find.text('Semua'), findsOneWidget);
      expect(find.text('Kuliner'), findsOneWidget);
      expect(find.text('Filter'), findsWidgets);
      expect(find.text('Urutkan'), findsOneWidget);
      expect(find.text('Dunia Fantasi (DUFAN)'), findsWidgets);

      await tester.tap(find.byKey(const Key('category-filter-button')));
      await tester.pumpAndSettle();
      expect(find.text('Filter'), findsWidgets);
      expect(find.text('Rentang Jarak'), findsOneWidget);
      expect(find.text('Rentang Harga'), findsOneWidget);
      await tester.tap(find.byKey(const Key('filter-close-button')));
      await tester.pumpAndSettle();

      await tester.tap(find.text('Urutkan'));
      await tester.pumpAndSettle();
      expect(find.text('Direkomendasikan'), findsOneWidget);
      expect(find.text('Harga Tertinggi'), findsOneWidget);
      expect(find.text('Harga Terendah'), findsOneWidget);
      expect(find.text('Ulasan Terbaik'), findsOneWidget);
      expect(find.text('Jarak Terdekat'), findsOneWidget);
    },
  );

  testWidgets('HomeScreen membuka CategoryScreen saat chip kategori ditekan', (
    tester,
  ) async {
    await tester.pumpWidget(const MaterialApp(home: HomeScreen()));

    await tester.scrollUntilVisible(
      find.text('Kuliner'),
      300,
      scrollable: find.byType(Scrollable).first,
    );
    await tester.tap(find.text('Kuliner'));
    await tester.pumpAndSettle();

    expect(find.byType(CategoryScreen), findsOneWidget);
  });
}
