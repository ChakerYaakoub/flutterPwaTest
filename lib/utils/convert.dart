import 'dart:math' as math;

const defaultPressureAtSeaLevel = 1013.25; // hPa
const defaultTemperatureAtSeaLevelInK = 288.15;
const troposhereLimit = 11000; // meters

const double L = 0.0065; // Temperature lapse rate in K/m
const double g = 9.80665; // Gravitational acceleration in m/s²
const double M = 0.0289644; // Molar mass of Earth's air in kg/mol
const double R = 8.3144598; // Universal gas constant in J/(mol·K)

/// Convert the given temperature in Celsius to Kelvin.
double celsiusToKelvin(double celsius) => celsius + 273.15;

/// Calculate the altitude in meters freom the given pressure in hecto Pascals.
double calculateElevation({
  required double pressure,
  double pressureAtSeaLevel = defaultPressureAtSeaLevel,
  double temperatureAtSeaLevelInK = defaultTemperatureAtSeaLevelInK,
}) {
  // Solve for altitude using the rearranged Barometric formula
  double altitude = (temperatureAtSeaLevelInK / L) *
      (1 - math.pow((pressure / pressureAtSeaLevel), (R * L) / (g * M)));

  return altitude; // in meters
}

/// Calculate the pressure in hectopascals from the given altitude in meters.
double calculatePressure({
  required double altitude,
  double pressureAtSeaLevel = defaultPressureAtSeaLevel,
  double temperatureAtSeaLevelInK = defaultTemperatureAtSeaLevelInK,
}) {
  if (altitude < 0) {
    throw ArgumentError("Altitude cannot be negative");
  }

  // Ensure altitude doesn't exceed the troposphere
  if (altitude > troposhereLimit) {
    throw ArgumentError(
        "This formula applies only up to $troposhereLimit meters");
  }

  // Apply the barometric formula
  double pressure = pressureAtSeaLevel *
      math.pow(
          1 - (L * altitude / temperatureAtSeaLevelInK), (g * M) / (R * L));

  return pressure; // Pressure in hPa
}
