

import 'dart:ui';
import 'package:flutter/material.dart';

import 'package:font_awesome_flutter/font_awesome_flutter.dart';


import '../constants.dart';
import '../components/bottom_icon.dart';
import '../icon_selector.dart';

class Home extends StatefulWidget {
  const Home({Key? key,this.locationWeather}) : super(key: key);


  final dynamic locationWeather;

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  int? temperature;
  int? weatherCode;
  String? condition;
  String? cityName;

  @override
  void initState() {
    super.initState();
    dynamic locationWeather = widget.locationWeather;
    updateUI(locationWeather);
  }

  void updateUI(dynamic weatherData){
    double temp = weatherData['current']['temp_c'];
    temperature = temp.toInt();
    condition = weatherData['current']['condition']['text'];
    cityName = weatherData['location']['name'];
    weatherCode = weatherData['current']['condition']['code'];

  }

  @override
  Widget build(BuildContext context) {
    String? imageId = SelectIcon(weatherCode).getIcon();

    return Scaffold(
      appBar: AppBar(
        leading:Container(
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
        automaticallyImplyLeading: false,
        title: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Icon(
              Icons.location_on_outlined,
              color: Colors.blue,
              size: 22.0,
            ),

            Text(
              '$cityName',
              style: kTitleTextStyle,
            ),
          ],
        ),
        actions: [
          Container(
            margin: EdgeInsets.all(kLeftMargin),
            child: const Text('T',
              style: kTitleTextStyle,
            ),
          )
        ],
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
          Expanded(
              child: Image.asset('assets/icons/$imageId.png',
                scale: 0.001,
              )
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
                  Text("$temperature",
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


