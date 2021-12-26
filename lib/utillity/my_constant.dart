import 'package:flutter/material.dart';

class MyConstant {
  // Genernal
  static String appName = 'Small Merket';
  static String domain =
      'https://e70b-2001-fb1-120-b33d-b91e-3ad2-e59d-28cd.ngrok.io';

  // Route
  static String routeLogin = '/login';
  static String routeCreateAccount = '/createAccount';
  static String routeHome = '/home';
  static String routeReserve = '/reserve';
  static String routeRent = '/rent';

  // Image
  static String image1 = 'images/image1.png';
  static String image2 = 'images/image2.png';
  static String image3 = 'images/image3.png';
  static String image4 = 'images/image4.png';

  //Color
  static Color primary = Color(0xffffccbc);
  static Color dart = Color(0xffcb9b8c);
  static Color light = Color(0xffffffee);

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

  // ButtonStyle
  ButtonStyle myButtonStyle() => ElevatedButton.styleFrom(
        primary: MyConstant.primary,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(30),
        ),
      );
}
