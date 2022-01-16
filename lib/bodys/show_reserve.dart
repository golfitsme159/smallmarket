import 'dart:convert';

import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:smallmarket/models/reserve_model.dart';
import 'package:smallmarket/utillity/my_constant.dart';
import 'package:smallmarket/widgets/show_progress.dart';

class ShowReserve extends StatefulWidget {
  const ShowReserve({Key? key}) : super(key: key);

  @override
  _ShowReserveState createState() => _ShowReserveState();
}

class _ShowReserveState extends State<ShowReserve> {
  bool lond = true;

  @override
  void initState() {
    super.initState();
    loadValueFromAPI();
  }

  Future<Null> loadValueFromAPI() async {
    SharedPreferences preferences = await SharedPreferences.getInstance();
    String M_ID = preferences.getString('M_ID')!;
    String apiGetReserve =
        '${MyConstant.domain}/smallmarket/getReserveWhereUser.php?isAdd=true&M_ID=$M_ID';
    await Dio().get(apiGetReserve).then((value) {
      // print('value ==> $value');
      for (var item in json.decode(value.data)) {
        ReserveModel model = ReserveModel.fromMap(item);
        print('Reserve ==> ${model.RES_Name}');

        setState(() {
          lond = false;
        });
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: lond ? ShowProgress() : Text('Lond Finish'),
      floatingActionButton: FloatingActionButton(
        onPressed: () =>
            Navigator.pushNamed(context, MyConstant.routeAddReserve),
        child: Icon(Icons.add),
      ),
    );
  }
}
