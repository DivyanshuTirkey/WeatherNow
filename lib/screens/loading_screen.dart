

import 'package:flutter/material.dart';

import 'package:weather_now/location.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';


import '../location.dart';
import '../keys.dart';
import '../networking.dart';
import './home.dart';


class LoadingScreen extends StatefulWidget {
  const LoadingScreen({Key? key}) : super(key: key);

  @override
  State<LoadingScreen> createState() => _LoadingScreenState();
}

class _LoadingScreenState extends State<LoadingScreen> {

  void getLocationData() async {

    print('finding location');
    Location location = Location();
    await location.getCurrentLocation();

    print(location.latitude);
    print(location.longitude);
    
    NetworkHelp networkHelp = NetworkHelp(
        'http://api.weatherapi.com/v1/current.json?key=$apiKey&q=${location.latitude},${location.longitude}&aqi=no');

    print('got response');

    var weatherData = await networkHelp.getData();

    
    Navigator.push(context, MaterialPageRoute(builder: (context){
      return Home(
        locationWeather: weatherData,
      );
    }
    )
    );
  }



  @override
  void initState() {
    super.initState();
    getLocationData();
  }

  @override
  Widget build(BuildContext context) {

    // getLocation();

    return const Scaffold(
      body: Center(
        child: SpinKitDoubleBounce(
          color: Colors.white,
          size: 70.0,
        ),
      ),
    );
  }
}



