import 'package:altimetre/domain/models/coordinates.dart';
import 'package:altimetre/domain/models/forecast.dart';
import 'package:open_meteo/open_meteo.dart';

class WeatherRepository {
  late final WeatherApi weatherApi;

  WeatherRepository({WeatherApi? weatherApi}) {
    this.weatherApi = weatherApi ?? WeatherApi();
  }

  Future<Forecast> getWeatherAt(Coordinates coordinates) async {
    final response = await weatherApi.request(
      latitude: coordinates.latitude,
      longitude: coordinates.longitude,
      current: {
        WeatherCurrent.temperature_2m,
        WeatherCurrent.pressure_msl,
        WeatherCurrent.surface_pressure
      },
    );

    final currentData = response.currentData;

    return Forecast(
      elevation: response.elevation,
      temperature: currentData[WeatherCurrent.temperature_2m]!.value,
      seaLevelPressure: currentData[WeatherCurrent.pressure_msl]!.value,
    );
  }
}
