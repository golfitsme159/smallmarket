import 'package:flutter/material.dart';

class MyConstant {
  // Genernal
  static String appName = 'Small Market';
  static String domain =
      'https://b4a0-2001-fb1-122-3740-a854-2a0-6392-f0c0.ngrok.io';

  // Route
  static String routeLogin = '/login';
  static String routeCreateAccount = '/createAccount';
  static String routeHome = '/home';
  static String routeReserve = '/reserve';
  static String routeRent = '/rent';
  static String routeAddReserve = '/add_reserve';

  // Image
  static String image1 = 'images/image1.png';
  static String image2 = 'images/image2.png';
  static String image3 = 'images/image3.png';
  static String image4 = 'images/image4.png';

  //Color
  static Color primary = Color(0xffffccbc);
  static Color dart = Color(0xffcb9b8c);
  static Color light = Color(0xffffffee);
  static Map<int, Color> mapMaterialColor = {
    50: Color.fromRGBO(203, 155, 140, 0.1),
    100: Color.fromRGBO(203, 155, 140, 0.2),
    200: Color.fromRGBO(203, 155, 140, 0.3),
    300: Color.fromRGBO(203, 155, 140, 0.4),
    400: Color.fromRGBO(203, 155, 140, 0.5),
    500: Color.fromRGBO(203, 155, 140, 0.6),
    600: Color.fromRGBO(203, 155, 140, 0.7),
    700: Color.fromRGBO(203, 155, 140, 0.8),
    800: Color.fromRGBO(203, 155, 140, 0.9),
    900: Color.fromRGBO(203, 155, 140, 1.0),
  };

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
  TextStyle h2WhiteStlye() => TextStyle(
        fontSize: 18,
        color: Colors.white,
        fontWeight: FontWeight.w700,
      );
  TextStyle h3Stlye() => TextStyle(
        fontSize: 14,
        color: dart,
        fontWeight: FontWeight.normal,
      );
  TextStyle h3WhiteStlye() => TextStyle(
        fontSize: 14,
        color: Colors.white,
        fontWeight: FontWeight.normal,
      );

  // ButtonStyle
  ButtonStyle myButtonStyle() => ElevatedButton.styleFrom(
        primary: MyConstant.primary,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(30),
        ),
      );
}
