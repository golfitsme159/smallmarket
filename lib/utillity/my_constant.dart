import 'package:flutter/material.dart';

class MyConstant {
  // Genernal
  static String appName = 'Small Market';
  static String domain =
      'https://feaa-2001-fb1-12a-27c3-bd18-4bde-76ad-de06.ngrok.io';
  static String urlPromptpay = 'https://promptpay.io/0910488104.png';

  // Route
  static String routeLogin = '/login';
  static String routeCreateAccount = '/createAccount';
  static String routeHome = '/home';
  static String routeReserve = '/reserve';
  static String routeRent = '/rent';
  static String routeAddReserve = '/add_reserve';
  static String routeEditProfile = '/edit_profile';
  static String routeAddPayment = '/add_payment';
  static String routeConfirmAddWallet = '/confirm_add_wallet';

  // Image
  static String image1 = 'images/image1.png';
  static String image2 = 'images/image2.png';
  static String image3 = 'images/image3.png';
  static String image4 = 'images/image4.png';

  //Color
  static Color w = Color(0xffffffff);
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
  TextStyle h1WhiteStlye() => TextStyle(
        fontSize: 24,
        color: Colors.white,
        fontWeight: FontWeight.w700,
      );
  TextStyle h1BlackStlye() => TextStyle(
        fontSize: 24,
        color: Colors.black,
        fontWeight: FontWeight.w700,
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
  TextStyle h2BlackStlye() => TextStyle(
        fontSize: 18,
        color: Colors.black,
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
  TextStyle h3BlackStlye() => TextStyle(
        fontSize: 14,
        color: Colors.black,
        fontWeight: FontWeight.w700,
      );

  // ButtonStyle
  ButtonStyle myButtonStyle() => ElevatedButton.styleFrom(
        primary: MyConstant.primary,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(30),
        ),
      );
}
