

import 'package:flutter/material.dart';

class SizeConfig {
  static MediaQueryData? _mediaQueryData;
  static double screenWidth = 0;
  static double screenHeight = 0;
  static double defaultSize = 0;
  static Orientation orientation = Orientation.portrait;

  void init(BuildContext context) {
    _mediaQueryData = MediaQuery.of(context);
    screenWidth = _mediaQueryData!.size.width;
    screenHeight = _mediaQueryData!.size.height;
    orientation = _mediaQueryData!.orientation;
  }
}

double getProportionalScreenHeight(double inputHeight) {
  double screenHeight = SizeConfig.screenHeight;
  //812 is the layout height for iPhone X (current design standard by Apple)
  return (inputHeight / 812.0) * screenHeight;
}

double getProportionalScreenWidth(double inputWidth) {
  double screenWidth = SizeConfig.screenWidth;
  //375 is the layout width for iPhone X (current design standard by Apple)
  return (inputWidth / 375.0) * screenWidth;
}
