import 'package:altimetre/utils/convert.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  group('calculateAltitude', () {
    test('returns correct altitude for standard pressure at sea level', () {
      expect(calculateElevation(pressure: 1013.25), closeTo(0, 1e-2));
    });

    test('returns correct altitude for pressure at 500 meters', () {
      expect(calculateElevation(pressure: 954.61), closeTo(500, 1e-2));
    });
  });
}
