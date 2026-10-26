import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:ecowalk_application/screens/main_navigation_screen.dart';
import 'package:ecowalk_application/screens/home/home_screen.dart';
import 'package:ecowalk_application/screens/profile/profile_screen.dart';

void main() {
  testWidgets(
    'MainNavigationScreen menampung Home dan Profile tanpa reload/transisi bar',
    (tester) async {
      await tester.pumpWidget(const MaterialApp(home: MainNavigationScreen()));

      // Awal di Home
      expect(find.byType(HomeScreen), findsOneWidget);
      expect(find.text('BERANDA'), findsOneWidget);
      expect(find.text('REKOMENDASI'), findsNothing);
      expect(find.text('FAVORIT'), findsNothing);
      expect(find.text('AKUN'), findsNothing);
      final navBar = tester.widget<SizedBox>(
        find.byWidgetPredicate(
          (widget) => widget is SizedBox && widget.height == 76,
        ),
      );
      expect(navBar.height, 76);

      // Pindah ke Profile via tab AKUN
      await tester.tap(find.byKey(const Key('bottom-nav-akun')));
      await tester.pumpAndSettle();

      expect(find.byType(ProfileScreen), findsOneWidget);
      expect(find.text('AKUN'), findsOneWidget);
      expect(find.text('BERANDA'), findsNothing);
      expect(find.text('REKOMENDASI'), findsNothing);
      expect(find.text('FAVORIT'), findsNothing);
      expect(find.text('KAYI NYAP NYAP'), findsOneWidget);

      // Pindah balik ke Home via tab BERANDA
      await tester.tap(find.byKey(const Key('bottom-nav-beranda')));
      await tester.pumpAndSettle();

      expect(find.byType(HomeScreen), findsOneWidget);
    },
  );
}
