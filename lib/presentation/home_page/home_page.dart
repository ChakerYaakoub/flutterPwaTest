import 'dart:async';

import 'package:altimetre/data/barometer_repository.dart';
import 'package:altimetre/data/settings_repository.dart';
import 'package:altimetre/domain/blocs/barometer_cubit.dart';
import 'package:altimetre/domain/blocs/settings_cubit.dart';
import 'package:altimetre/presentation/home_page/widgets/gauge.dart';
import 'package:altimetre/presentation/paddings.dart';
import 'package:altimetre/presentation/settings_page/settings_page.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:sensors_plus/sensors_plus.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  double _pressure = 0.0;
  StreamSubscription<BarometerEvent>? _subscription;

  @override
  void initState() {
    _subscription = barometerEventStream().listen((event) {
      setState(() {
        _pressure = event.pressure;
      });
    });

    super.initState();
  }

  @override
  void dispose() {
    _subscription?.cancel();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final textTheme = Theme.of(context).textTheme;

    return BlocProvider(
      create: (context) => BarometerCubit(
          barometerRepository: context.read<BarometerRepository>())
        ..listenUpdates(),
      child: Scaffold(
        appBar: AppBar(
          title: const Text('Voluptuaria'),
          actions: [
            IconButton(
              icon: const Icon(Icons.settings),
              onPressed: () {
                Navigator.of(context).push(
                  MaterialPageRoute(
                    builder: (context) => RepositoryProvider(
                      create: (context) => SettingsRepository(),
                      child: BlocProvider(
                          create: (context) => SettingsCubit(
                              settingsRepository:
                                  context.read<SettingsRepository>()),
                          child: const SettingsPage()),
                    ),
                  ),
                );
              },
            ),
          ],
        ),
        body: Center(
          child: BlocBuilder<BarometerCubit, BarometerState>(
            builder: (context, state) {
              return Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  if (state.pressure != null) Gauge(value: state.pressure!),
                  Text(
                    '${state.pressure} hPa',
                    style: textTheme.displayMedium,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Text(
                        'Measured: ${state.elevation} m',
                        style: textTheme.bodyLarge,
                      ),
                      const SizedBox(width: Paddings.large),
                      Text(
                        'GPS: ${state.gpsElevation} m',
                        style: textTheme.bodyLarge,
                      ),
                    ],
                  )
                ],
              );
            },
          ),
        ),
      ),
    );
  }
}
