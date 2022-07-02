import 'package:flutter/material.dart';




const Color kBackgroundColor = Color(0xff0e071e);
const double kLeftMargin = 8.0;
const Color kButtonColor = Color(0xff252134);
const TextStyle kTitleTextStyle = TextStyle(
                                              color: Colors.white,
                                              fontSize: 25.0,
                                            );
ButtonStyle kAppBarStyle = ButtonStyle(
                                  shape: MaterialStateProperty.all(const CircleBorder()),
                                  backgroundColor: MaterialStateProperty.all(kButtonColor),
                                  padding: MaterialStateProperty.all(const EdgeInsets.all(10.0)),
                                );
const TextStyle kLabelStyle = TextStyle(
                                          fontSize: 35.0,
                                          fontWeight: FontWeight.w600,
                                        );

const TextStyle kWeatherRep = TextStyle(
                                          fontSize: 30.0,
                                          fontWeight: FontWeight.w600,
                                        );
const TextStyle kTempStyle = TextStyle(
  fontSize: 80,
  fontWeight: FontWeight.w900,
);


