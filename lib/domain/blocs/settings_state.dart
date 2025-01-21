part of 'settings_cubit.dart';

class SettingsState extends Equatable {
  const SettingsState({
    this.temperature = TemperatureUnit.celsius,
    this.pressure = PressureUnit.hPa,
    this.distance = DistanceUnit.meters,
  });

  final TemperatureUnit temperature;
  final PressureUnit pressure;
  final DistanceUnit distance;

  @override
  List<Object> get props => [temperature, pressure, distance];

  SettingsState copyWith({
    TemperatureUnit? temperature,
    PressureUnit? pressure,
    DistanceUnit? distance,
  }) {
    return SettingsState(
      temperature: temperature ?? this.temperature,
      pressure: pressure ?? this.pressure,
      distance: distance ?? this.distance,
    );
  }
}
