import 'package:flutter_test/flutter_test.dart';
import 'package:flutter_application_1/main.dart';

void main() {
  testWidgets('App builds without error', (WidgetTester tester) async {
    await tester.pumpWidget(const SalonBookingApp());
    expect(find.text('Lumière'), findsOneWidget);
  });
}
