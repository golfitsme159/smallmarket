import 'dart:convert';

import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:smallmarket/bodys/show_payment.dart';
import 'package:smallmarket/bodys/show_rent.dart';
import 'package:smallmarket/bodys/show_reserve.dart';
import 'package:smallmarket/models/user_model.dart';
import 'package:smallmarket/utillity/my_constant.dart';
import 'package:smallmarket/widgets/show_signout.dart';
import 'package:smallmarket/widgets/show_title.dart';

class Home extends StatefulWidget {
  const Home({Key? key}) : super(key: key);

  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  List<Widget> widgets = [
    ShowReserve(),
    ShowRent(),
    ShowPayment(),
  ];
  int indexWidget = 0;
  UserModel? userModel;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    findUserModel();
  }

  Future<Null> findUserModel() async {
    SharedPreferences preferences = await SharedPreferences.getInstance();
    String id = preferences.getString('M_User')!;
    print('## ID Logined == $id');
    String apiGetUserWhereUser =
        '${MyConstant.domain}/smallmarket/getUserWhereUser.php?isAdd=true&M_User=$id';
    await Dio().get(apiGetUserWhereUser).then((value) {
      print('## value == >$value');
      for (var item in json.decode(value.data)) {
        setState(() {
          userModel = UserModel.fromMap(item);
          print('### name logined = ${userModel!.M_Name}');
        });
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        // backgroundColor: MyConstant.dart,
        title: Text(MyConstant.appName),
      ),
      drawer: Drawer(
        child: Stack(
          children: [
            ShowSignOut(),
            Column(
              children: [
                buildHead(),
                menuShowReserve(),
                menuShowRent(),
                menuShowPayment(),
              ],
            )
          ],
        ),
      ),
      body: widgets[indexWidget],
    );
  }

  UserAccountsDrawerHeader buildHead() {
    return UserAccountsDrawerHeader(
      otherAccountsPictures: [
        IconButton(
          onPressed: () =>
              Navigator.pushNamed(context, MyConstant.routeEditProfile),
          icon: Icon(Icons.face_outlined),
          iconSize: 36,
          color: MyConstant.light,
          tooltip: 'แก้ไขข้อมูลส่วนตัว',
        ),
      ],
      decoration: BoxDecoration(
        gradient: RadialGradient(
          colors: [MyConstant.light, MyConstant.dart],
          center: Alignment(-0.8, -0.2),
          radius: 1,
        ),
      ),
      accountName: Text(userModel == null ? 'Name ?' : userModel!.M_Name!),
      accountEmail: null,
    );
  }

  ListTile menuShowReserve() {
    return ListTile(
      onTap: () {
        setState(() {
          indexWidget = 0;
          Navigator.pop(context);
        });
      },
      leading: Icon(Icons.filter_1),
      title: ShowTitle(
        title: 'แสดงการจองแผง',
        textStyle: MyConstant().h2Stlye(),
      ),
      subtitle: ShowTitle(
        title: 'แสดงรายละเอียดการจองแผง',
        textStyle: MyConstant().h3Stlye(),
      ),
    );
  }

  ListTile menuShowRent() {
    return ListTile(
      onTap: () {
        setState(() {
          indexWidget = 1;
          Navigator.pop(context);
        });
      },
      leading: Icon(Icons.filter_2),
      title: ShowTitle(
        title: 'แสดงการเช่าแผง',
        textStyle: MyConstant().h2Stlye(),
      ),
      subtitle: ShowTitle(
        title: 'แสดงรายละเอียดการเช่าแผง',
        textStyle: MyConstant().h3Stlye(),
      ),
    );
  }

  ListTile menuShowPayment() {
    return ListTile(
      onTap: () {
        setState(() {
          indexWidget = 2;
          Navigator.pop(context);
        });
      },
      leading: Icon(Icons.filter_3),
      title: ShowTitle(
        title: 'แสดงการชำระเงิน',
        textStyle: MyConstant().h2Stlye(),
      ),
      subtitle: ShowTitle(
        title: 'แสดงรายละเอียดการชำระเงิน',
        textStyle: MyConstant().h3Stlye(),
      ),
    );
  }
}
