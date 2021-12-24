import 'package:flutter/material.dart';

class MyConstant {
  // Genernal
  static String appName = 'SmallMerket';

  // Route
  static String routeLogin = '/login';
  static String routeCreateAccount = '/createAccount';
  static String routeHome = 'home';
  static String routeReserve = 'reserve';
  static String routeRent = 'rent';

  // Image
  static String image1 = 'images/image1.png';
  static String image2 = 'images/image2.png';
  static String image3 = 'images/image3.png';
  static String image4 = 'images/image4.png';
  static String image5 = 'images/image5.png';

  //Color
  static Color primary = Color(0xff827717);
  static Color dart = Color(0xff524c00);
  static Color light = Color(0xffb4a647);

  // Style
  TextStyle h1Stlye() => TextStyle(
        fontSize: 24,
        color: dart,
        fontWeight: FontWeight.bold,
      );
  TextStyle h2Stlye() => TextStyle(
        fontSize: 18,
        color: dart,
        fontWeight: FontWeight.w700,
      );
  TextStyle h3Stlye() => TextStyle(
        fontSize: 14,
        color: dart,
        fontWeight: FontWeight.normal,
      );
}
