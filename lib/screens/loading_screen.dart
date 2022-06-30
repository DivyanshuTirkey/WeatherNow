
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import '../constants.dart';
import '../components/bottom_icon.dart';


class LoadingScreen extends StatefulWidget {
  const LoadingScreen({Key? key}) : super(key: key);

  @override
  State<LoadingScreen> createState() => _LoadingScreenState();
}

class _LoadingScreenState extends State<LoadingScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: Container(
          margin: const EdgeInsets.all(8.0),
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
        children: [
          const Expanded(
              child: Text("Today's Report",
              )
          ),
          const Expanded(
              flex: 3,
              child: Text("icon")
          ),
          const Expanded(

              child: Text("Its Cloudy")
          ),
          const Expanded(
              child: Text("29")
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



