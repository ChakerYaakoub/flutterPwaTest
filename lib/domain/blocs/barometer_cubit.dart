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

    // Check if barometer is available
    if (await _barometerRepository.isBarometerAvailable()) {
      try {
        _pressureSubscription =
            _barometerRepository.getBarometerEventStream().listen(
          (value) {
            print('Received pressure value: $value'); // Debug print
            if (value > 0) {
              // Only emit if we get valid readings
              emit(
                state.copyWith(
                  pressure: () => value,
                  elevation: () => calculateElevation(
                    pressure: value,
                    pressureAtSeaLevel: _forecast?.seaLevelPressure ??
                        defaultPressureAtSeaLevel,
                    temperatureAtSeaLevelInK: _forecast != null
                        ? celsiusToKelvin(_forecast!.temperature)
                        : defaultTemperatureAtSeaLevelInK,
                  ),
                ),
              );
            }
          },
          onError: (e) {
            print('Pressure sensor error: $e'); // Debug print
            emit(state.copyWith(pressure: () => null));
          },
        );
      } catch (e) {
        print('Error setting up pressure sensor: $e'); // Debug print
      }
    } else {
      print('Barometer not available on this device'); // Debug print
    }

    // Handle location updates
    try {
      _locationSubscription = _locationRepository.getLocationStream().listen(
        (value) async {
          print('Received location update: $value'); // Debug print
          emit(
            state.copyWith(
              gpsElevation: () => value.elevation,
            ),
          );
          try {
            _forecast = await _weatherRepository.getWeatherAt(value);
            emit(
              state.copyWith(
                forecast: () => _forecast,
              ),
            );
          } catch (e) {
            print('Weather fetch error: $e'); // Debug print
          }
        },
        onError: (e) {
          print('Location error: $e'); // Debug print
          emit(state.copyWith(
            gpsElevation: () => null,
            forecast: () => null,
          ));
        },
      );
    } catch (e) {
      print('Error setting up location updates: $e'); // Debug print
    }
  }

  @override
  Future<void> close() {
    _pressureSubscription?.cancel();
    _locationSubscription?.cancel();
    return super.close();
  }
}
