import 'package:flutter/material.dart';

const Color kBackgroundColor = Color(0xff0e071e);
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

