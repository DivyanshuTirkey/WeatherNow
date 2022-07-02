

import 'dart:ui';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:weather_now/location.dart';
import 'dart:convert';

import '../constants.dart';
import '../components/bottom_icon.dart';
import '../location.dart';
import '../keys.dart';


class LoadingScreen extends StatefulWidget {
  const LoadingScreen({Key? key}) : super(key: key);

  @override
  State<LoadingScreen> createState() => _LoadingScreenState();
}

class _LoadingScreenState extends State<LoadingScreen> {

  double? _latitude;
  double? _longitude;

  void getLocation() async {
    Location location = Location();
    await location.getCurrentLocation();
    _latitude = location.latitude;
    _longitude = location.longitude;
  }
  void getData() async {
    http.Response response = await http.get(Uri.parse('http://api.weatherapi.com/v1/current.json?'
        'key=$apiKey&'
        'q=$_latitude,$_longitude&'
        'aqi=no'
      )
    );

    if(response.statusCode == 200) {
      String data = response.body;
      var decodedData = jsonDecode(data);
      double temp = decodedData['current']['temp_c'];
      String condition = decodedData['current']['condition']['text'];
      Uri iconLink = decodedData['current']['condition']['icon'];
      String cityName = decodedData['location']['name'];
    }

  }

  @override
  void initState() {
    super.initState();
    getData();
    // getLocation();
  }

  @override
  Widget build(BuildContext context) {

    // getLocation();

    return Scaffold(
      appBar: AppBar(
        leading: Container(
          margin: const EdgeInsets.all(kLeftMargin),
          child: TextButton(
            onPressed: (){

            },
            style: kAppBarStyle,
            child: const Icon(
              FontAwesomeIcons.bars,
              color: Colors.white,
              size: 22.0,
            ),
          ),
        ),
        title: const Text('Seattle',
          style: kTitleTextStyle,
        ),
        centerTitle: true,
        elevation: 2.0,
      ),

      body: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          Expanded(
              child:Container(
                  margin: const EdgeInsets.only(left: kLeftMargin, top: 15.0),
                  child: const Text("Today's Report",
                    style: kLabelStyle,
                  )
              )
          ),

          const Expanded(
              child: Text("icon")
          ),
          const Text("Its Cloudy",
            style: kWeatherRep,
            textAlign: TextAlign.center,
          ),
          Expanded(
              child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const Text("29",
                      style: kTempStyle,
                    ),
                    Text("\u00b0",
                      style: kTempStyle.copyWith(
                        color: Colors.blue,
                        fontFeatures: [const FontFeature.superscripts(),],
                      ),
                    ),
                  ],
              )
          ),
          const Expanded(
              child: Text("icons")
          ),
          Container(
            padding: const EdgeInsets.only(top: 18.0,bottom: 18.0),
            margin: const EdgeInsets.all(12.0),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(15.0),
              color: kButtonColor,
            ),

            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: const [
                BottomIcon(
                  icon: FontAwesomeIcons.house,


                ),
                BottomIcon(
                    icon: FontAwesomeIcons.magnifyingGlass,
                ),
                BottomIcon(
                    icon: FontAwesomeIcons.compass,
                ),
                BottomIcon(
                    icon: FontAwesomeIcons.user,
                ),
                
              ],
            ),
          )
        ],
      ),
    );
  }
}



