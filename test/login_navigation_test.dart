import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:ecowalk_application/screens/auth/login_screen.dart';
import 'package:ecowalk_application/screens/main_navigation_screen.dart';

void main() {
  testWidgets('login dengan admin/admin123 navigasi ke MainNavigationScreen', (
    tester,
  ) async {
    await tester.pumpWidget(const MaterialApp(home: LoginScreen()));

    final fields = find.byType(TextField);
    await tester.enterText(fields.at(0), 'admin');
    await tester.enterText(fields.at(1), 'admin123');

    await tester.tap(find.widgetWithText(ElevatedButton, 'MASUK'));
    await tester.pumpAndSettle();

    expect(find.byType(MainNavigationScreen), findsOneWidget);
  });
}
