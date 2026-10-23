import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:ecowalk_application/screens/profile/edit_profile_screen.dart';
import 'package:ecowalk_application/screens/profile/profile_widgets.dart';

void main() {
  testWidgets(
    'EditProfileScreen renders elemen profil dan membuka bottom sheet kamera/galeri',
    (tester) async {
      await tester.pumpWidget(const MaterialApp(home: EditProfileScreen()));

      expect(find.text('Edit Profil'), findsOneWidget);
      expect(find.widgetWithText(TextField, 'Nama Pengguna'), findsOneWidget);
      expect(find.text('SIMPAN'), findsOneWidget);

      // Buka bottom sheet dengan tap avatar/badge
      await tester.tap(find.byIcon(Icons.edit));
      await tester.pumpAndSettle();

      expect(find.text('Kamera'), findsOneWidget);
      expect(find.text('Galeri'), findsOneWidget);
    },
  );

  testWidgets('ProfileAvatar menampilkan FileImage saat imageFile diberikan', (
    tester,
  ) async {
    final file = File('test_avatar.png');
    await tester.pumpWidget(
      MaterialApp(
        home: Scaffold(body: ProfileAvatar(imageFile: file)),
      ),
    );

    final avatarFinder = find.byType(CircleAvatar);
    expect(avatarFinder, findsOneWidget);
    final CircleAvatar avatar = tester.widget(avatarFinder);
    expect(avatar.foregroundImage, isA<FileImage>());
  });
}
