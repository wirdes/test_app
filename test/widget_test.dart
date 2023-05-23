import 'dart:math';
import 'package:ai_app/cities.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:ai_app/main.dart';

void main() {
  // getPlateNumber test

  test('Test Random index', () {
    final randomNumber = Random().nextInt(cities.values.length);
    final randomCity = cities.values.elementAt(randomNumber);
    final plateNumber = getPlateNumber(randomCity);
    expect(plateNumber, cities.keys.elementAt(randomNumber));
  });

  test("Test specific index", () {
    final plateNumber = getPlateNumber("MERSİN");
    expect(plateNumber, "33");

    final plateNumber2 = getPlateNumber("İSTANBUL");
    expect(plateNumber2, "34");
  });

  // Write Widget test for MyHomePage

  testWidgets('Test MyHomePage', (WidgetTester tester) async {
    await tester.pumpWidget(const MyApp());
    expect(find.text('AI App'), findsOneWidget);
  });
}
