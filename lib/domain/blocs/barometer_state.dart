part of 'barometer_cubit.dart';

@immutable
class BarometerState extends Equatable {
  final double? pressure;
  final double? elevation;
  final double? gpsElevation;

  const BarometerState({
    this.pressure,
    this.elevation,
    this.gpsElevation,
  });

  BarometerState copyWith({
    double? Function()? pressure,
    double? Function()? elevation,
    double? Function()? gpsElevation,
  }) {
    return BarometerState(
      pressure: pressure != null ? pressure() : this.pressure,
      elevation: elevation != null ? elevation() : this.elevation,
      gpsElevation: gpsElevation != null ? gpsElevation() : this.gpsElevation,
    );
  }

  @override
  List<Object?> get props => [pressure, elevation, gpsElevation];
}
