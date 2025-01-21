import 'dart:async';

import 'package:altimetre/domain/models/coordinates.dart';
import 'package:location/location.dart';

class LocationRepository {
  final Location location;
  bool _serviceEnabled = false;
  late PermissionStatus _permissionGranted = PermissionStatus.denied;

  final Completer<void> _initCompleter = Completer();

  LocationRepository({Location? location}) : location = location ?? Location() {
    _init();
  }

  Future<void> _init() async {
    _serviceEnabled = await location.serviceEnabled();
    if (!_serviceEnabled) {
      _serviceEnabled = await location.requestService();
    }

    location.changeSettings(
      accuracy: LocationAccuracy.high,
      interval: 10000,
      distanceFilter: 1000,
    );

    _initCompleter.complete();
  }

  /// Request location permission if necessary
  Future<bool> ensureHasPermission() async {
    if (!_initCompleter.isCompleted) await _initCompleter.future;

    if (_permissionGranted == PermissionStatus.granted ||
        _permissionGranted == PermissionStatus.grantedLimited) {
      return true;
    }

    _permissionGranted = await location.hasPermission();
    if (_permissionGranted == PermissionStatus.denied ||
        _permissionGranted == PermissionStatus.deniedForever) {
      _permissionGranted = await location.requestPermission();
    }

    return _permissionGranted == PermissionStatus.granted ||
        _permissionGranted == PermissionStatus.grantedLimited;
  }

  Coordinates _mapLocationDataToCoordinates(LocationData locationData) {
    if (locationData.latitude == null ||
        locationData.longitude == null ||
        locationData.altitude == null) {
      throw Exception('Location data is not available');
    }

    return Coordinates(
      latitude: locationData.latitude!,
      longitude: locationData.longitude!,
      elevation: locationData.altitude!,
    );
  }

  /// Stream of location data
  Stream<Coordinates> getLocationStream() async* {
    if (!(await ensureHasPermission())) return;
    yield* location.onLocationChanged
        .map((e) => _mapLocationDataToCoordinates(e));
  }

  /// Get the current location
  Future<Coordinates> getLocation() async {
    if (!(await ensureHasPermission())) {
      throw Exception('Permission denied');
    }

    return _mapLocationDataToCoordinates(await location.getLocation());
  }
}
