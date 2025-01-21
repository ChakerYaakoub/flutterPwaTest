import 'package:altimetre/domain/blocs/settings_cubit.dart';
import 'package:altimetre/domain/models/units.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class SettingsPage extends StatelessWidget {
  const SettingsPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Settings'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text(
              'Units',
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 16),
            const Text('Temperature'),
            ListTile(
              title: const Text('Celsius'),
              leading: Builder(builder: (context) {
                final value = context
                    .select((SettingsCubit cubit) => cubit.state.temperature);
                return Radio(
                  value: TemperatureUnit.celsius,
                  groupValue: value,
                  onChanged: (value) {
                    if (value != null) {
                      context
                          .read<SettingsCubit>()
                          .updateTemperatureUnit(value);
                    }
                  },
                );
              }),
            ),
            ListTile(
              title: const Text('Fahrenheit'),
              leading: Builder(builder: (context) {
                final value = context
                    .select((SettingsCubit cubit) => cubit.state.temperature);
                return Radio(
                  value: TemperatureUnit.fahrenheit,
                  groupValue: value,
                  onChanged: (value) {
                    if (value != null) {
                      context
                          .read<SettingsCubit>()
                          .updateTemperatureUnit(value);
                    }
                  },
                );
              }),
            ),
            const SizedBox(height: 16),
            const Text('Air Pressure'),
            ListTile(
              title: const Text('hPa'),
              leading: Builder(builder: (context) {
                final value = context
                    .select((SettingsCubit cubit) => cubit.state.pressure);

                return Radio<PressureUnit>(
                  value: PressureUnit.hPa,
                  groupValue: value,
                  onChanged: (value) {
                    if (value != null) {
                      context.read<SettingsCubit>().updatePressureUnit(value);
                    }
                  },
                );
              }),
            ),
            ListTile(
              title: const Text('inHg'),
              leading: Builder(builder: (context) {
                final value = context
                    .select((SettingsCubit cubit) => cubit.state.pressure);

                return Radio<PressureUnit>(
                  value: PressureUnit.inHg,
                  groupValue: value,
                  onChanged: (value) {
                    if (value != null) {
                      context.read<SettingsCubit>().updatePressureUnit(value);
                    }
                  },
                );
              }),
            ),
          ],
        ),
      ),
    );
  }
}
