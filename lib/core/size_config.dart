import 'package:flutter/material.dart';

class SizeConfig {
  static late MediaQueryData _mediaQueryData;
  static late double _screenWidth;
  static late double _screenHeight;
  static late double _safeAreaHorizontal;
  static late double _safeAreaVertical;

  static late double _safeWidth;
  static late double _safeHeight;

  static void init(BuildContext context) {
    _mediaQueryData = MediaQuery.of(context);
    _screenWidth = _mediaQueryData.size.width;
    _screenHeight = _mediaQueryData.size.height;

    _safeAreaHorizontal =
        _mediaQueryData.padding.left + _mediaQueryData.padding.right;
    _safeAreaVertical =
        _mediaQueryData.padding.top + _mediaQueryData.padding.bottom;

    _safeWidth = _screenWidth - _safeAreaHorizontal;
    _safeHeight = _screenHeight - _safeAreaVertical;
  }

  
  static double get screenWidth => _screenWidth;
  static double get screenHeight => _screenHeight;

  // safe area dimensions
  static double get safeWidth => _safeWidth;
  static double get safeHeight => _safeHeight;

  
  static double blockWidth(double percent) => _screenWidth * (percent / 100);
  static double blockHeight(double percent) => _screenHeight * (percent / 100);
  static double safeBlockWidth(double percent) => _safeWidth * (percent / 100);
  static double safeBlockHeight(double percent) => _safeHeight * (percent / 100);
}
