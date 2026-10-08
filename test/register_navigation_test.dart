import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:ecowalk_application/screens/auth/register_screen.dart';
import 'package:ecowalk_application/screens/auth/verification_screen.dart';

void main() {
  testWidgets('tekan BUAT AKUN saat form valid navigasi ke VerificationScreen', (tester) async {
    await tester.pumpWidget(const MaterialApp(home: RegisterScreen()));

    // Isi nama, email, hp, password
    await tester.enterText(find.widgetWithText(TextField, 'Nama Pengguna'), 'budi');
    await tester.enterText(find.widgetWithText(TextField, 'Email'), 'budi@example.com');
    await tester.enterText(find.widgetWithText(TextField, 'Nomor Hp'), '08123456789');
    await tester.enterText(find.widgetWithText(TextField, 'Kata Sandi'), 'secret123');
    await tester.enterText(find.widgetWithText(TextField, 'Konfirmasi Kata Sandi'), 'secret123');

    // Centang persetujuan
    await tester.tap(find.byType(Checkbox));
    await tester.pump();

    // Tekan BUAT AKUN
    await tester.tap(find.widgetWithText(ElevatedButton, 'BUAT AKUN'));
    await tester.pumpAndSettle();

    expect(find.byType(VerificationScreen), findsOneWidget);
  });
}
