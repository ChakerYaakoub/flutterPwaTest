import 'dart:async';

import 'package:altimetre/data/barometer_repository.dart';
import 'package:altimetre/data/location_repository.dart';
import 'package:altimetre/data/weather_repository.dart';
import 'package:altimetre/domain/models/coordinates.dart';
import 'package:altimetre/domain/models/forecast.dart';
import 'package:altimetre/utils/convert.dart';
import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:meta/meta.dart';

part 'barometer_state.dart';

class BarometerCubit extends Cubit<BarometerState> {
  StreamSubscription<double>? _pressureSubscription;
  StreamSubscription<Coordinates>? _locationSubscription;
  late final BarometerRepository _barometerRepository;
  late final LocationRepository _locationRepository;
  late final WeatherRepository _weatherRepository;

  Forecast? _forecast;

  BarometerCubit({
    BarometerRepository? barometerRepository,
    LocationRepository? locationRepository,
    WeatherRepository? weatherRepository,
  }) : super(BarometerState()) {
    _barometerRepository = barometerRepository ?? BarometerRepository();
    _locationRepository = locationRepository ?? LocationRepository();
    _weatherRepository = weatherRepository ?? WeatherRepository();
  }

  Future<void> listenUpdates() async {
    _pressureSubscription?.cancel();
    _locationSubscription?.cancel();

    try {
      _pressureSubscription =
          _barometerRepository.getBarometerEventStream().listen(
        (value) {
          emit(
            state.copyWith(
              pressure: () => value,
              elevation: () => calculateElevation(
                pressure: value,
                pressureAtSeaLevel:
                    _forecast?.seaLevelPressure ?? defaultPressureAtSeaLevel,
                temperatureAtSeaLevelInK: _forecast != null
                    ? celsiusToKelvin(_forecast!.temperature)
                    : defaultTemperatureAtSeaLevelInK,
              ),
            ),
          );
        },
        onError: (e) {
          emit(state.copyWith(pressure: () => null));
        },
      );
    } catch (e) {/* no-op */}

    try {
      _locationSubscription = _locationRepository.getLocationStream().listen(
        (value) async {
          emit(
            state.copyWith(
              gpsElevation: () => value.elevation,
            ),
          );
          _forecast = await _weatherRepository.getWeatherAt(value);
          print(_forecast);
        },
        onError: (e) {
          emit(state.copyWith(gpsElevation: () => null));
        },
      );
    } catch (e) {/* no-op */}
  }

  @override
  Future<void> close() {
    _pressureSubscription?.cancel();
    _locationSubscription?.cancel();
    return super.close();
  }
}
