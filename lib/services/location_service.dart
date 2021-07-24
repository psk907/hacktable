import 'package:location/location.dart';

class LocationService {
  Future<List<double>> getLocation() async {
    Location location = new Location();

    bool _serviceEnabled;
    PermissionStatus _permissionGranted;
    LocationData _locationData;
    //Asking the user for location permission 3 times
    _serviceEnabled = await location.serviceEnabled();
    if (!_serviceEnabled) {
      _serviceEnabled = await location.requestService();
      if (!_serviceEnabled) {
        _serviceEnabled = await location.requestService();
        if (!_serviceEnabled) {
          _serviceEnabled = await location.requestService();
          if (!_serviceEnabled) {
            return [0, 0];
          }
          return [0, 0];
        }
      }
    }

    _permissionGranted = await location.hasPermission();
    if (_permissionGranted == PermissionStatus.denied) {
      _permissionGranted = await location.requestPermission();
      if (_permissionGranted != PermissionStatus.granted) {
        _permissionGranted = await location.requestPermission();
        if (_permissionGranted != PermissionStatus.granted) {
          _permissionGranted = await location.requestPermission();
          if (_permissionGranted != PermissionStatus.granted) {
            _permissionGranted = await location.requestPermission();
          }
        }
      }
    }

    _locationData = await location.getLocation();
    print('my location ${[_locationData.latitude, _locationData.longitude]}');

    return [_locationData.latitude, _locationData.longitude];
  }
}
