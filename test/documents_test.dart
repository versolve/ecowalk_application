import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:ecowalk_application/screens/profile/privacy_policy_screen.dart';
import 'package:ecowalk_application/screens/profile/about_us_screen.dart';
import 'package:ecowalk_application/screens/profile/terms_of_service_screen.dart';

void main() {
  testWidgets('PrivacyPolicyScreen menampilkan judul & logo ECOWALK', (
    tester,
  ) async {
    await tester.pumpWidget(const MaterialApp(home: PrivacyPolicyScreen()));
    expect(find.text('Kebijakan Privasi'), findsOneWidget);
    expect(find.text('ECOWA'), findsOneWidget);
  });

  testWidgets('AboutUsScreen menampilkan judul & logo ECOWALK', (tester) async {
    await tester.pumpWidget(const MaterialApp(home: AboutUsScreen()));
    expect(find.text('Tentang Kami'), findsOneWidget);
    expect(find.text('ECOWA'), findsOneWidget);
  });

  testWidgets('TermsOfServiceScreen menampilkan judul & logo ECOWALK', (
    tester,
  ) async {
    await tester.pumpWidget(const MaterialApp(home: TermsOfServiceScreen()));
    expect(find.text('Ketentuan Layanan'), findsOneWidget);
    expect(find.text('ECOWA'), findsOneWidget);
  });
}
