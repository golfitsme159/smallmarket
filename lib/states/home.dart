import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:smallmarket/bodys/show_payment.dart';
import 'package:smallmarket/bodys/show_rent.dart';
import 'package:smallmarket/bodys/show_reserve.dart';
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
                UserAccountsDrawerHeader(
                  accountName: null,
                  accountEmail: null,
                ),
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
