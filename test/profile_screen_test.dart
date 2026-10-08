import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:ecowalk_application/screens/profile/profile_screen.dart';

void main() {
  testWidgets('ProfileScreen menampilkan identitas dan menu', (tester) async {
    await tester.pumpWidget(const MaterialApp(home: ProfileScreen()));

    expect(find.text('KAYI NYAP NYAP'), findsOneWidget);
    expect(find.text('kayimail@gmail.com'), findsOneWidget);
    expect(find.text('Pengaturan'), findsOneWidget);
    expect(find.text('Edit Profil'), findsOneWidget);
    expect(find.text('Kebijakan Privasi'), findsOneWidget);
    expect(find.text('Tentang Kami'), findsOneWidget);

    await tester.scrollUntilVisible(
      find.text('Ketentuan Layanan'),
      160,
      scrollable: find.byType(Scrollable).first,
    );
    expect(find.text('Ketentuan Layanan'), findsOneWidget);
    expect(find.text('Keluar'), findsOneWidget);
  });

  testWidgets('Keluar membuka dialog konfirmasi dan Batal menutupnya', (
    tester,
  ) async {
    await tester.pumpWidget(const MaterialApp(home: ProfileScreen()));

    await tester.scrollUntilVisible(
      find.text('Keluar'),
      160,
      scrollable: find.byType(Scrollable).first,
    );
    await tester.tap(find.text('Keluar'));
    await tester.pumpAndSettle();

    expect(find.text('Keluar?'), findsOneWidget);
    expect(find.text('Apakah Kamu Yakin Ingin Keluar?'), findsOneWidget);

    await tester.tap(find.text('Batal'));
    await tester.pumpAndSettle();
    expect(find.text('Keluar?'), findsNothing);
  });
}
