import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:ecowalk_application/screens/profile/change_phone_screen.dart';
import 'package:ecowalk_application/screens/profile/change_email_screen.dart';
import 'package:ecowalk_application/screens/profile/change_password_screen.dart';
import 'package:ecowalk_application/screens/auth/forgot_password_screen.dart';

void main() {
  testWidgets('ChangePhoneScreen menolak nomor kosong', (tester) async {
    await tester.pumpWidget(const MaterialApp(home: ChangePhoneScreen()));
    await tester.tap(find.text('KIRIM'));
    await tester.pump();
    expect(find.text('Masukkan nomor HP.'), findsOneWidget);
  });

  testWidgets('ChangeEmailScreen menolak email invalid', (tester) async {
    await tester.pumpWidget(const MaterialApp(home: ChangeEmailScreen()));
    await tester.enterText(find.byType(TextField), 'bukan-email');
    await tester.tap(find.text('KIRIM'));
    await tester.pump();
    expect(find.text('Masukkan email yang valid.'), findsOneWidget);
  });

  testWidgets('ChangePasswordScreen menolak konfirmasi berbeda', (
    tester,
  ) async {
    await tester.pumpWidget(const MaterialApp(home: ChangePasswordScreen()));
    final fields = find.byType(TextField);
    await tester.enterText(fields.at(0), 'lama123');
    await tester.enterText(fields.at(1), 'baru123');
    await tester.enterText(fields.at(2), 'beda123');
    await tester.tap(find.text('UBAH'));
    await tester.pump();
    expect(find.text('Konfirmasi kata sandi tidak sama.'), findsOneWidget);
  });

  testWidgets('Lupa Kata Sandi membuka ForgotPasswordScreen', (tester) async {
    await tester.pumpWidget(const MaterialApp(home: ChangePasswordScreen()));
    await tester.tap(find.text('Lupa Kata Sandi?'));
    await tester.pumpAndSettle();
    expect(find.byType(ForgotPasswordScreen), findsOneWidget);
  });
}
