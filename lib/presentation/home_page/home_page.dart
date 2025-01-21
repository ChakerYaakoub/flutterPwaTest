import 'dart:async';

import 'package:altimetre/data/barometer_repository.dart';
import 'package:altimetre/data/settings_repository.dart';
import 'package:altimetre/domain/blocs/barometer_cubit.dart';
import 'package:altimetre/domain/blocs/settings_cubit.dart';
import 'package:altimetre/domain/models/units.dart';
import 'package:altimetre/presentation/home_page/widgets/gauge.dart';
import 'package:altimetre/presentation/paddings.dart';
import 'package:altimetre/presentation/settings_page/settings_page.dart';
import 'package:altimetre/utils/convert.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:sensors_plus/sensors_plus.dart';
import 'package:syncfusion_flutter_gauges/gauges.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => BarometerCubit(
        barometerRepository: context.read<BarometerRepository>(),
      )..listenUpdates(),
      child: Scaffold(
        appBar: AppBar(
          title: const Text('Voluptuaria'),
          actions: [
            IconButton(
              icon: const Icon(Icons.settings),
              onPressed: () {
                Navigator.of(context).push(
                  MaterialPageRoute(
                    builder: (context) => const SettingsPage(),
                  ),
                );
              },
            ),
          ],
        ),
        body: BlocBuilder<BarometerCubit, BarometerState>(
          builder: (context, barometerState) {
            return BlocBuilder<SettingsCubit, SettingsState>(
              builder: (context, settingsState) {
                // Get pressure value with fallback
                final pressure = barometerState.pressure ?? 0.0;
                final displayPressure =
                    settingsState.pressure == PressureUnit.inHg
                        ? hPaToInHg(pressure)
                        : pressure;

                // Get temperature with fallback
                final temperature = barometerState.forecast?.temperature ?? 0.0;
                final displayTemperature =
                    settingsState.temperature == TemperatureUnit.fahrenheit
                        ? celsiusToFahrenheit(temperature)
                        : temperature;

                // Get elevation values with fallback
                final measuredElevation = barometerState.elevation ?? 0.0;
                final gpsElevation = barometerState.gpsElevation ?? 0.0;

                final displayMeasured =
                    settingsState.distance == DistanceUnit.feet
                        ? metersToFeet(measuredElevation)
                        : measuredElevation;

                final displayGPS = settingsState.distance == DistanceUnit.feet
                    ? metersToFeet(gpsElevation)
                    : gpsElevation;

                return Center(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Gauge(
                        value: displayPressure,
                        unit: settingsState.pressure,
                      ),
                      const SizedBox(height: 20),
                      Text(
                        '${displayPressure.toStringAsFixed(1)} ${settingsState.pressure == PressureUnit.inHg ? 'inHg' : 'hPa'}',
                        style: Theme.of(context).textTheme.headlineMedium,
                      ),
                      const SizedBox(height: 10),
                      Text(
                        'Temperature: ${displayTemperature.toStringAsFixed(1)}°${settingsState.temperature == TemperatureUnit.fahrenheit ? 'F' : 'C'}',
                        style: Theme.of(context).textTheme.titleLarge,
                      ),
                      const SizedBox(height: 10),
                      Text(
                        'Measured: ${displayMeasured.toStringAsFixed(1)} ${settingsState.distance == DistanceUnit.feet ? 'ft' : 'm'}',
                        style: Theme.of(context).textTheme.titleLarge,
                      ),
                      Text(
                        'GPS: ${displayGPS.toStringAsFixed(1)} ${settingsState.distance == DistanceUnit.feet ? 'ft' : 'm'}',
                        style: Theme.of(context).textTheme.titleLarge,
                      ),
                    ],
                  ),
                );
              },
            );
          },
        ),
      ),
    );
  }
}
