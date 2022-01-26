// ignore_for_file: deprecated_member_use

import 'dart:convert';
import 'dart:ffi';

import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:smallmarket/models/lock_model.dart';
import 'package:smallmarket/states/datePicker.dart';
import 'package:smallmarket/utillity/my_constant.dart';
import 'package:http/http.dart' as http;
import 'package:smallmarket/widgets/show_title.dart';

class AddReserve extends StatefulWidget {
  const AddReserve({Key? key}) : super(key: key);

  @override
  _AddReserveState createState() => _AddReserveState();
}

class _AddReserveState extends State<AddReserve> {
  final formkey = GlobalKey<FormState>();
  DateTime? dateTime;
  String? dropdownValue = 'A1';

  String? pilihTanggal;
  String labelText = '';
  DateTime tgl = new DateTime.now();

  Future<Null> _selectedDate(BuildContext context) async {
    final DateTime? picked = await showDatePicker(
      context: context,
      initialDate: tgl,
      firstDate: DateTime.now(),
      lastDate: DateTime(DateTime.now().year + 1),
    );

    if (picked != null && picked != tgl) {
      setState(() {
        tgl = picked;
        pilihTanggal = new DateFormat.yMd().format(tgl);
      });
    } else {}
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    dateTime = DateTime.now();
  }

  @override
  Widget build(BuildContext context) {
    double size = MediaQuery.of(context).size.width;
    return Scaffold(
      appBar: AppBar(
        title: Text('ทำการจองแผง'),
      ),
      body: Form(
        key: formkey,
        child: Card(
          child: SingleChildScrollView(
            child: buildListForm(size),
          ),
        ),
      ),
    );
  }

  Container buildListForm(double size) {
    return Container(
      padding: EdgeInsets.all(8),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          ShowTitle(title: '', textStyle: MyConstant().h3Stlye()),
          ShowTitle(
            title: 'รายการจอง',
            textStyle: MyConstant().h1Stlye(),
          ),
          ShowTitle(title: '', textStyle: MyConstant().h3Stlye()),
          ShowTitle(
            title: 'เลือกวันที่จอง',
            textStyle: MyConstant().h3Stlye(),
          ),
          DateDropDown(
            labelText: labelText,
            valueText: new DateFormat.yMd().format(tgl),
            onPressed: () {
              _selectedDate(context);
            },
          ),
          ShowTitle(title: '', textStyle: MyConstant().h3Stlye()),
          ShowTitle(
            title: 'เลือกล็อค',
            textStyle: MyConstant().h3Stlye(),
          ),
          buildDropLock(),
          buildConfirm(size),
        ],
      ),
    );
  }

  Row buildConfirm(double size) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Container(
          margin: EdgeInsets.symmetric(
            vertical: 16,
          ),
          width: size * 0.6,
          child: ElevatedButton(
            style: MyConstant().myButtonStyle(),
            onPressed: () {
              if (formkey.currentState!.validate()) {
                // MyDialog().normalDialog(context, title, message);
                print('กระบวนการแทรกลงในฐานข้อมูล');
              }
            },
            child: Text('ตกลง'),
          ),
        ),
      ],
    );
  }

  Future<Null> uplondReserve() async {}

  DropdownButton<String> buildDropLock() {
    return DropdownButton(
      value: dropdownValue,
      items: <String>[
        'A1',
        'A2',
        'A3',
        'B1',
        'B2',
        'B3',
      ].map((String value) {
        // print(value);
        return DropdownMenuItem(
          value: value,
          child: Text(
            value.toString(),
            style: MyConstant().h3Stlye(),
          ),
        );
      }).toList(),
      onChanged: (String? value) {
        setState(() {
          dropdownValue = value;
        });
        print('------value-------');
        print(dropdownValue);
      },
      hint: const Text(
        'กรุณาเลือก',
        style: TextStyle(
            color: Colors.black, fontSize: 14, fontWeight: FontWeight.w500),
      ),
    );
  }
}
