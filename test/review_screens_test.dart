import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:ecowalk_application/screens/home/add_review_screen.dart';
import 'package:ecowalk_application/screens/home/detail_wisata_screen.dart';
import 'package:ecowalk_application/screens/home/review_list_screen.dart';

void main() {
  testWidgets('ReviewListScreen menampilkan ringkasan dan filter ulasan', (
    tester,
  ) async {
    await tester.pumpWidget(const MaterialApp(home: ReviewListScreen()));

    expect(find.text('Nilai & Ulasan'), findsOneWidget);
    expect(find.text('4.75'), findsOneWidget);
    expect(find.text('24.543 Ulasan'), findsOneWidget);
    expect(find.text('Semua'), findsOneWidget);
    expect(find.text('Dengan Foto'), findsOneWidget);
    expect(find.text('Bintang'), findsOneWidget);
    expect(find.text('Kaisyarani Zahra'), findsWidgets);
  });

  testWidgets('AddReviewScreen memilih rating dan mengirim ulasan', (
    tester,
  ) async {
    await tester.pumpWidget(const MaterialApp(home: AddReviewScreen()));

    expect(find.text('Beri Ulasan'), findsOneWidget);
    expect(find.text('Hai, Kaisyarani !'), findsOneWidget);
    expect(find.text('Bagus'), findsOneWidget);
    expect(find.text('Tambahkan Gambar?'), findsOneWidget);
    expect(find.text('Sembunyikan Nama Pengguna'), findsOneWidget);
    expect(find.text('Kirim'), findsOneWidget);

    await tester.tap(find.byKey(const Key('rating-4')));
    await tester.enterText(find.byType(TextField), 'Tempatnya menyenangkan.');
    await tester.scrollUntilVisible(
      find.widgetWithText(ElevatedButton, 'Kirim'),
      300,
      scrollable: find.byType(Scrollable).first,
    );
    await tester.tap(find.widgetWithText(ElevatedButton, 'Kirim'));
    await tester.pump();

    expect(find.text('Ulasan berhasil dikirim.'), findsOneWidget);
  });

  testWidgets('DetailWisataScreen membuka daftar dan form ulasan', (
    tester,
  ) async {
    await tester.pumpWidget(
      const MaterialApp(
        home: DetailWisataScreen(
          name: 'Dunia Fantasi (DUFAN)',
          imagePath: 'lib/assets/images/dufan.jpg',
          location: 'Ancol, Jakarta Utara',
          price: 'Rp. 190.000 - Rp. 400.000',
        ),
      ),
    );

    await tester.scrollUntilVisible(
      find.text('Lihat Semua >'),
      300,
      scrollable: find.byType(Scrollable).first,
    );
    await tester.tap(find.text('Lihat Semua >'));
    await tester.pumpAndSettle();
    expect(find.byType(ReviewListScreen), findsOneWidget);

    await tester.tap(find.byIcon(Icons.arrow_back));
    await tester.pumpAndSettle();
    await tester.scrollUntilVisible(
      find.text('Beri Ulasan'),
      300,
      scrollable: find.byType(Scrollable).first,
    );
    await tester.tap(find.text('Beri Ulasan'));
    await tester.pumpAndSettle();
    expect(find.byType(AddReviewScreen), findsOneWidget);
  });
}
