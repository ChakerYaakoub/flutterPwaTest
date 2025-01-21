import 'dart:async';

import 'package:sensors_plus/sensors_plus.dart';

class BarometerRepository {
  Stream<double> getBarometerEventStream() {
    return barometerEventStream().map((event) {
      print('Raw pressure event: ${event.pressure}'); // Debug print
      if (event.pressure <= 0 || event.pressure > 2000) {
        throw Exception('Invalid pressure reading: ${event.pressure}');
      }
      return event.pressure;
    }).handleError((error) {
      print('Barometer error: $error');
      return 0.0;
    });
  }

  Future<bool> isBarometerAvailable() async {
    try {
      final event = await barometerEventStream().first;
      print('Test pressure reading: ${event.pressure}'); // Debug print
      return event.pressure > 0;
    } catch (e) {
      print('Barometer availability check failed: $e'); // Debug print
      return false;
    }
  }
}
