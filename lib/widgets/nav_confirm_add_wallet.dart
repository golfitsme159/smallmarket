import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:smallmarket/models/pay_model.dart';
import 'package:smallmarket/utillity/my_constant.dart';
import 'package:smallmarket/widgets/show_title.dart';

class NavConfirmAddWallet extends StatelessWidget {
  const NavConfirmAddWallet({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 80,
      // height: 80,
      child: InkWell(
        onTap: () => Navigator.pushNamedAndRemoveUntil(
            context, MyConstant.routeConfirmAddWallet, (route) => false),
        child: Card(
          color: MyConstant.light,
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                Image.asset('images/bill.png'),
                ShowTitle(title: 'ส่งสลิป'),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
