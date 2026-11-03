import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:ecowalk_application/screens/auth/login_screen.dart';
import 'package:ecowalk_application/screens/auth/reset_password_screen.dart';
import 'package:ecowalk_application/screens/auth/verification_screen.dart';
import 'package:ecowalk_application/screens/home/favorite_screen.dart';
import 'package:ecowalk_application/screens/home/recommendation_screen.dart';
import 'package:ecowalk_application/screens/main_navigation_screen.dart';
import 'package:ecowalk_application/screens/profile/profile_screen.dart';

void main() {
  testWidgets('tab Favorit membuka daftar destinasi favorit', (tester) async {
    await tester.pumpWidget(const MaterialApp(home: MainNavigationScreen()));

    await tester.tap(find.byKey(const Key('bottom-nav-favorit')));
    await tester.pumpAndSettle();

    expect(find.byType(FavoriteScreen), findsOneWidget);
    expect(find.text('FAVORIT'), findsOneWidget);
    expect(find.text('Destinasi Favorit'), findsOneWidget);
  });

  testWidgets('tab sekunder profil membuka rekomendasi dan favorit', (
    tester,
  ) async {
    await tester.pumpWidget(const MaterialApp(home: ProfileScreen()));

    await tester.tap(find.byKey(const Key('profile-nav-rekomendasi')));
    await tester.pumpAndSettle();
    expect(find.byType(RecommendationScreen), findsOneWidget);

    await tester.pageBack();
    await tester.pumpAndSettle();
    await tester.tap(find.byKey(const Key('profile-nav-favorit')));
    await tester.pumpAndSettle();
    expect(find.byType(FavoriteScreen), findsOneWidget);
  });

  testWidgets('verifikasi menolak OTP kosong dan menerima empat digit', (
    tester,
  ) async {
    await tester.pumpWidget(const MaterialApp(home: VerificationScreen()));

    await tester.tap(find.text('KIRIM'));
    await tester.pump();
    expect(find.text('Masukkan kode verifikasi lengkap.'), findsOneWidget);

    final fields = find.byType(TextField);
    for (var index = 0; index < 4; index++) {
      await tester.enterText(fields.at(index), '${index + 1}');
    }
    await tester.tap(find.text('KIRIM'));
    await tester.pumpAndSettle();
    expect(find.byType(ResetPasswordScreen), findsOneWidget);
  });

  testWidgets('kirim ulang OTP memberi konfirmasi', (tester) async {
    await tester.pumpWidget(const MaterialApp(home: VerificationScreen()));

    await tester.tap(find.text('Kirim Ulang Kode'));
    await tester.pump();
    expect(find.text('Kode verifikasi telah dikirim ulang.'), findsOneWidget);
  });

  testWidgets('reset password memvalidasi konfirmasi lalu kembali login', (
    tester,
  ) async {
    await tester.pumpWidget(const MaterialApp(home: ResetPasswordScreen()));

    final fields = find.byType(TextField);
    await tester.enterText(fields.at(0), 'rahasia1');
    await tester.enterText(fields.at(1), 'berbeda1');
    await tester.tap(find.text('UBAH KATA SANDI'));
    await tester.pump();
    expect(find.text('Konfirmasi kata sandi tidak sama.'), findsOneWidget);

    await tester.enterText(fields.at(1), 'rahasia1');
    await tester.tap(find.text('UBAH KATA SANDI'));
    await tester.pumpAndSettle();
    expect(find.byType(LoginScreen), findsOneWidget);
  });
}
