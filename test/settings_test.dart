import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:ecowalk_application/screens/profile/settings_screen.dart';

void main() {
  testWidgets('SettingsScreen menampilkan seluruh menu', (tester) async {
    await tester.pumpWidget(const MaterialApp(home: SettingsScreen()));

    expect(find.text('Ubah Nomor Hp'), findsOneWidget);
    expect(find.text('Ubah Email'), findsOneWidget);
    expect(find.text('Ubah Kata Sandi'), findsOneWidget);
    expect(find.text('Hapus Akun'), findsOneWidget);
  });

  testWidgets('Hapus Akun membuka dialog dan memblokir kata sandi kosong', (
    tester,
  ) async {
    await tester.pumpWidget(const MaterialApp(home: SettingsScreen()));

    await tester.tap(find.text('Hapus Akun'));
    await tester.pumpAndSettle();
    expect(find.text('HAPUS AKUN'), findsOneWidget);
    final alertDialog = tester.widget<AlertDialog>(find.byType(AlertDialog));
    expect(alertDialog.backgroundColor, Colors.white);
    expect(find.text('Kata Sandi'), findsOneWidget);
    expect(find.text('Masukan Kata Sandi'), findsOneWidget);
    expect(
      find.text(
        'Anda akan menghapus akun anda. Tindakan ini tidak dapat dibatalkan. Semua data akan hilang.',
      ),
      findsOneWidget,
    );
    expect(find.byIcon(Icons.visibility_off_outlined), findsOneWidget);
    expect(find.widgetWithText(TextButton, 'Batal'), findsOneWidget);

    await tester.tap(find.widgetWithText(ElevatedButton, 'Hapus'));
    await tester.pump();
    expect(find.text('Masukkan kata sandi.'), findsOneWidget);
  });
}
