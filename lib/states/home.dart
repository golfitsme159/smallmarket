import 'package:flutter/material.dart';
import 'package:smallmarket/utillity/my_constant.dart';

class Home extends StatelessWidget {
  const Home({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(MyConstant.appName),
      ),
    );
  }
}
