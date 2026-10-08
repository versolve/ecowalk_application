import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:ecowalk_application/screens/profile/edit_profile_screen.dart';

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
}
