import 'dart:convert';

import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:smallmarket/bodys/bank.dart';
import 'package:smallmarket/models/pay_model.dart';
import 'package:smallmarket/models/reserve_model.dart';
import 'package:smallmarket/states/add_payment.dart';
import 'package:smallmarket/states/details_reserve.dart';
import 'package:smallmarket/utillity/my_constant.dart';
import 'package:smallmarket/widgets/show_progress.dart';
import 'package:smallmarket/widgets/show_title.dart';

class ShowPayment extends StatefulWidget {
  const ShowPayment({Key? key}) : super(key: key);

  @override
  _ShowPaymentState createState() => _ShowPaymentState();
}

class _ShowPaymentState extends State<ShowPayment> {
  bool lond = true;
  bool? haveData;
  List<PayModel> payModels = [];

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    londValueFromAPI();
  }

  Future<Null> londValueFromAPI() async {
    if (payModels.length != 0) {
      payModels.clear();
    } else {}

    SharedPreferences preferences = await SharedPreferences.getInstance();
    String M_ID = preferences.getString('M_ID')!;
    String apiGetPay =
        '${MyConstant.domain}/smallmarket/getPayWhereUser.php?isAdd=true&M_ID=$M_ID';
    await Dio().get(apiGetPay).then((value) {
      print('value ==> $value');

      if (value.toString() == 'null') {
        //No Data
        setState(() {
          lond = false;
          haveData = false;
        });
      } else {
        //Have Data
        for (var item in json.decode(value.data)) {
          PayModel model = PayModel.fromMap(item);
          print('PayID ==> ${model.Pay_ID}');

          setState(() {
            lond = false;
            haveData = true;
            payModels.add(model);
          });
        }
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: lond
          ? const ShowProgress()
          : haveData!
              ? LayoutBuilder(
                  builder: (context, constraints) => buildListView(constraints),
                )
              : Center(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      ShowTitle(
                          title: 'NO DATE', textStyle: MyConstant().h1Stlye()),
                    ],
                  ),
                ),
    );
  }

  ListView buildListView(BoxConstraints constraints) {
    return ListView.builder(
      itemCount: payModels.length,
      itemBuilder: (context, index) => Card(
        child: Row(
          children: [
            Container(
              padding: EdgeInsets.all(4),
              width: constraints.maxWidth * 0.5 - 8,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  ShowTitle(title: '', textStyle: MyConstant().h3Stlye()),
                  ShowTitle(
                    title: 'Lock : ${payModels[index].L_Name}',
                    textStyle: MyConstant().h2Stlye(),
                  ),
                  ShowTitle(
                    title: 'วันที่ต้องการเช่า',
                    textStyle: MyConstant().h3Stlye(),
                  ),
                  ShowTitle(
                    title:
                        '${payModels[index].RE_FirstDate}/${payModels[index].RE_EndDate}',
                    textStyle: MyConstant().h3Stlye(),
                  ),
                ],
              ),
            ),
            Container(
              padding: EdgeInsets.all(4),
              width: constraints.maxWidth * 0.5 - 8,
              height: constraints.maxWidth * 0.4,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      IconButton(
                        onPressed: () {
                          print('## You Cick Payment');
                          // Navigator.pushNamed(
                          //     context, MyConstant.routeAddPayment);
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => Bank(
                                AddPay: payModels[index],
                              ),
                            ),
                          );
                        },
                        icon: Icon(
                          Icons.payments_outlined,
                          size: 28,
                          color: MyConstant.dart,
                        ),
                      ),
                    ],
                  ),
                  ShowTitle(
                    title: 'ราคา : ${payModels[index].Price} บาท',
                    textStyle: MyConstant().h2Stlye(),
                  ),
                  ShowTitle(title: '', textStyle: MyConstant().h3Stlye()),
                  ShowTitle(title: '', textStyle: MyConstant().h3Stlye()),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
