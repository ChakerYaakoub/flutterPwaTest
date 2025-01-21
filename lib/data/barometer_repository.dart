import 'dart:async';

import 'package:sensors_plus/sensors_plus.dart';

class BarometerRepository {
  Stream<double> getBarometerEventStream() {
    return barometerEventStream().map((event) => event.pressure);
  }
}
