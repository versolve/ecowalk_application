import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:ecowalk_application/screens/home/add_review_screen.dart';
import 'package:ecowalk_application/screens/home/category_screen.dart';
import 'package:ecowalk_application/screens/home/notification_screen.dart';

void main() {
  testWidgets('filter Reset mengembalikan pilihan default', (tester) async {
    await tester.pumpWidget(const MaterialApp(home: CategoryScreen()));

    await tester.tap(find.text('Filter'));
    await tester.pumpAndSettle();
    await tester.tap(find.text('Terdekat').first);
    await tester.pump();
    await tester.tap(find.byKey(const Key('filter-reset-button')));
    await tester.pump();

    final selected = tester.widget<Container>(
      find.ancestor(of: find.text('500 M'), matching: find.byType(Container)).first,
    );
    expect(selected.decoration, isNotNull);
  });

  testWidgets('checkbox ulasan dapat diaktifkan', (tester) async {
    await tester.pumpWidget(const MaterialApp(home: AddReviewScreen()));

    final checkbox = find.byType(Checkbox);
    expect(tester.widget<Checkbox>(checkbox).value, isFalse);
    await tester.ensureVisible(checkbox);
    await tester.tap(checkbox);
    await tester.pump();
    expect(tester.widget<Checkbox>(checkbox).value, isTrue);
  });

  testWidgets('tandai semua dibaca mengubah checkbox notifikasi', (tester) async {
    await tester.pumpWidget(const MaterialApp(home: NotificationScreen()));

    final checkbox = find.byType(Checkbox);
    expect(tester.widget<Checkbox>(checkbox).value, isFalse);
    await tester.tap(find.text('Tandai Semua Dibaca'));
    await tester.pump();
    expect(tester.widget<Checkbox>(checkbox).value, isTrue);
  });
}
