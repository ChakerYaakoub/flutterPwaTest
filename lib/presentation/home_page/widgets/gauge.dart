import 'package:altimetre/domain/models/units.dart';
import 'package:flutter/material.dart';
import 'package:syncfusion_flutter_gauges/gauges.dart';

class Gauge extends StatelessWidget {
  const Gauge({
    super.key,
    required this.value,
    required this.unit,
  });

  final double value;
  final PressureUnit unit;

  @override
  Widget build(BuildContext context) {
    // Define ranges based on unit
    final min = unit == PressureUnit.hPa ? 800.0 : 23.6;
    final max = unit == PressureUnit.hPa ? 1100.0 : 32.5;
    final interval = unit == PressureUnit.hPa ? 50.0 : 1.0;

    return SizedBox(
      height: 250,
      child: SfRadialGauge(
        axes: <RadialAxis>[
          RadialAxis(
            minimum: min,
            maximum: max,
            interval: interval,
            labelFormat:
                unit == PressureUnit.hPa ? '{value} hPa' : '{value} inHg',
            ranges: <GaugeRange>[
              GaugeRange(
                startValue: min,
                endValue: (min + max) / 2,
                color: Colors.red,
              ),
              GaugeRange(
                startValue: (min + max) / 2,
                endValue: max,
                color: Colors.green,
              ),
            ],
            pointers: <GaugePointer>[
              NeedlePointer(
                value: value,
                enableAnimation: true,
                animationDuration: 1000,
                needleColor: Theme.of(context).colorScheme.primary,
                knobStyle: KnobStyle(
                  color: Theme.of(context).colorScheme.primary,
                ),
              ),
            ],
            annotations: <GaugeAnnotation>[
              GaugeAnnotation(
                widget: Text(
                  value.toStringAsFixed(unit == PressureUnit.hPa ? 1 : 2),
                  style: Theme.of(context).textTheme.titleLarge,
                ),
                angle: 90,
                positionFactor: 0.5,
              ),
            ],
          ),
        ],
      ),
    );
  }
}
