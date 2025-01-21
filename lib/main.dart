import 'package:altimetre/data/barometer_repository.dart';
import 'package:altimetre/data/settings_repository.dart';
import 'package:altimetre/domain/blocs/settings_cubit.dart';
import 'package:altimetre/presentation/home_page/home_page.dart';
import 'package:altimetre/presentation/theme.dart';
import 'package:altimetre/presentation/util.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:syncfusion_flutter_gauges/gauges.dart';

void main() {
  runApp(
    MultiRepositoryProvider(
      providers: [
        RepositoryProvider(
          create: (context) => BarometerRepository(),
        ),
        RepositoryProvider(
          create: (context) => SettingsRepository(),
        ),
      ],
      child: MultiBlocProvider(
        providers: [
          BlocProvider(
            create: (context) => SettingsCubit(
              settingsRepository: context.read<SettingsRepository>(),
            )..loadSettings(),
          ),
        ],
        child: const MyApp(),
      ),
    ),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    final brightness = Brightness
        .dark; // View.of(context).platformDispatcher.platformBrightness;
    final textTheme = createTextTheme(context, "DM Sans", "Lexend");
    final theme = MaterialTheme(textTheme);

    return MaterialApp(
      title: 'Voluptuaria',
      theme: brightness == Brightness.light ? theme.light() : theme.dark(),
      home: const HomePage(),
    );
  }
}

class GaugeWidget extends StatelessWidget {
  final double? pressure; // in hPa
  final double temperature; // in Celsius
  final double? measured; // in feet
  final double gpsAltitude; // in feet

  const GaugeWidget({
    Key? key,
    this.pressure,
    required this.temperature,
    this.measured,
    required this.gpsAltitude,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        SfRadialGauge(
          axes: <RadialAxis>[
            RadialAxis(
              minimum: 0,
              maximum: 3000, // Adjusted for altitude in feet
              interval: 500,
              labelFormat: '{value}ft',
              ranges: <GaugeRange>[
                GaugeRange(startValue: 0, endValue: 1000, color: Colors.green),
                GaugeRange(
                    startValue: 1000, endValue: 2000, color: Colors.orange),
                GaugeRange(startValue: 2000, endValue: 3000, color: Colors.red)
              ],
              pointers: <GaugePointer>[
                NeedlePointer(
                  value: measured ?? 0,
                  enableAnimation: true,
                  animationDuration: 1000,
                  needleColor: Theme.of(context).colorScheme.primary,
                )
              ],
              annotations: <GaugeAnnotation>[
                GaugeAnnotation(
                  widget: Column(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      Text(
                        '${pressure?.toStringAsFixed(1) ?? "N/A"} hPa',
                        style: Theme.of(context).textTheme.titleMedium,
                      ),
                      Text(
                        'Temperature: ${temperature.toStringAsFixed(1)}°C',
                        style: Theme.of(context).textTheme.titleMedium,
                      ),
                      Text(
                        'Measured: ${measured?.toStringAsFixed(1) ?? "N/A"} ft',
                        style: Theme.of(context).textTheme.titleMedium,
                      ),
                      Text(
                        'GPS: ${gpsAltitude.toStringAsFixed(1)} ft',
                        style: Theme.of(context).textTheme.titleMedium,
                      ),
                    ],
                  ),
                  angle: 90,
                  positionFactor: 0.5,
                )
              ],
            )
          ],
        ),
      ],
    );
  }
}

class MyHomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Gauge Demo'),
      ),
      body: Center(
        child: SfRadialGauge(
          axes: <RadialAxis>[
            RadialAxis(
              minimum: 0,
              maximum: 100,
              ranges: <GaugeRange>[
                GaugeRange(
                  startValue: 0,
                  endValue: 33,
                  color: Colors.green,
                ),
                GaugeRange(
                  startValue: 33,
                  endValue: 66,
                  color: Colors.orange,
                ),
                GaugeRange(
                  startValue: 66,
                  endValue: 100,
                  color: Colors.red,
                )
              ],
              pointers: <GaugePointer>[NeedlePointer(value: 60)],
            )
          ],
        ),
      ),
    );
  }
}
