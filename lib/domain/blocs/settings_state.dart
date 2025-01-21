part of 'settings_cubit.dart';

class SettingsState extends Equatable {
  const SettingsState({
    this.temperature = TemperatureUnit.celsius,
    this.pressure = PressureUnit.hPa,
  });

  final TemperatureUnit temperature;
  final PressureUnit pressure;

  @override
  List<Object> get props => [temperature, pressure];

  SettingsState copyWith({
    TemperatureUnit? temperature,
    PressureUnit? pressure,
  }) {
    return SettingsState(
      temperature: temperature ?? this.temperature,
      pressure: pressure ?? this.pressure,
    );
  }
}
