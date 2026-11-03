import 'package:flutter_test/flutter_test.dart';
import 'package:ecowalk_application/main.dart';

void main() {
  testWidgets('Aplikasi menampilkan splash screen ECOWALK', (tester) async {
    await tester.pumpWidget(const MyApp());

    expect(find.text('ECOWA'), findsOneWidget);
    expect(find.text('"Bandingkan, pilih, liburan tanpa ragu !"'), findsOneWidget);

    await tester.pump(const Duration(seconds: 3));
    await tester.pumpAndSettle();
  });
}
