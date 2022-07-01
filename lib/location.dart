import 'package:geolocator/geolocator.dart';


class Location{

  double? latitude;
  double? longitude;


  Future<void> getCurrentLocation() async {

    try{
      Position position = await Geolocator.getCurrentPosition();
      latitude = position.latitude;
      longitude = position.longitude;
    }
    catch(error){
      bool serviceEnabled;
      LocationPermission permission;

      serviceEnabled = await Geolocator.isLocationServiceEnabled();
      if (!serviceEnabled) {
        bool openSettings = await Geolocator.openLocationSettings();
        if (!openSettings) {
          return Future.error('Location Services are disabled.');
        }
      }

      permission = await Geolocator.checkPermission();
      if(permission == LocationPermission.denied){
        permission = await Geolocator.requestPermission();
        if(permission == LocationPermission.denied){
          return Future.error('Location permissions are denied');
        }
      }
      if(permission == LocationPermission.deniedForever){
        return Future.error('Location permissions denied permanently');
      }
    }
    Position position = await Geolocator.getCurrentPosition();
    latitude = position.latitude;
    longitude = position.longitude;
  }

}

