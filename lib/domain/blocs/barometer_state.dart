part of 'barometer_cubit.dart';

@immutable
class BarometerState extends Equatable {
  final double? pressure;
  final double? elevation;
  final double? gpsElevation;
  final Forecast? forecast;

  const BarometerState({
    this.pressure,
    this.elevation,
    this.gpsElevation,
    this.forecast,
  });

  BarometerState copyWith({
    double? Function()? pressure,
    double? Function()? elevation,
    double? Function()? gpsElevation,
    Forecast? Function()? forecast,
  }) {
    return BarometerState(
      pressure: pressure != null ? pressure() : this.pressure,
      elevation: elevation != null ? elevation() : this.elevation,
      gpsElevation: gpsElevation != null ? gpsElevation() : this.gpsElevation,
      forecast: forecast != null ? forecast() : this.forecast,
    );
  }

  @override
  List<Object?> get props => [pressure, elevation, gpsElevation, forecast];
}
