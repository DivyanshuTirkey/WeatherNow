import 'package:flutter/material.dart';
import 'screens/loading_screen.dart';
import 'constants.dart';

void main() {
  runApp(const WeatherNow());
}

class WeatherNow extends StatelessWidget {
  const WeatherNow({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData.dark().copyWith(
        scaffoldBackgroundColor: kBackgroundColor,
        appBarTheme: const AppBarTheme(
          color: kBackgroundColor,
        ),


      ),
      home: const LoadingScreen(),
    );
  }
}
