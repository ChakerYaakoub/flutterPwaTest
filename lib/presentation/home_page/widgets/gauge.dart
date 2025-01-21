import 'package:altimetre/presentation/palette.dart';
import 'package:flutter/material.dart';
import 'package:geekyants_flutter_gauges/geekyants_flutter_gauges.dart';

class Gauge extends StatelessWidget {
  const Gauge({super.key, required this.value});

  final double value;

  static const double min = 950;
  static const double max = 1060;

  @override
  Widget build(BuildContext context) {
    final width = MediaQuery.of(context).size.width;
    final brightness = Theme.of(context).brightness;
    final textColor =
        brightness == Brightness.light ? Colors.black : Colors.white;
    final textStyle = Theme.of(context).textTheme.bodyLarge;

    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Center(
          child: RadialGauge(
            valueBar: const [
              RadialValueBar(
                gradient: LinearGradient(colors: Palette.colors),
                value: 1100,
                valueBarThickness: 16,
              ),
            ],
            needlePointer: [
              NeedlePointer(
                value: value,
                tailColor: Colors.black,
                color: Palette.blue,
                needleHeight: width / 5,
                needleWidth: 10,
                tailRadius: 20,
                needleStyle: NeedleStyle.gaugeNeedle,
              ),
            ],
            track: RadialTrack(
              steps: 40,
              hideTrack: false,
              trackStyle: TrackStyle(
                showPrimaryRulers: true,
                showSecondaryRulers: true,
                primaryRulerColor: textColor,
                labelStyle: textStyle,
              ),
              start: 800,
              thickness: 10,
              end: 1100,
              trackLabelFormater: (value) => value.toStringAsFixed(0),
            ),
          ),
        ),
      ],
    );
  }
}
