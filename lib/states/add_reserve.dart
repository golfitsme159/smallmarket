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
import 'package:smallmarket/utillity/my_dialog.dart';
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

  DropdownButton<String> buildDropLock() {
    return DropdownButton(
      value: dropdownValue,
      items: <String>[
        'A1',
        'A2',
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
                uplondReserve();
              }
            },
            child: Text('ตกลง'),
          ),
        ),
      ],
    );
  }

  Future<Null> uplondReserve() async {
    SharedPreferences preferences = await SharedPreferences.getInstance();
    String M_ID = preferences.getString('M_ID')!;
    String? RE_FDate = pilihTanggal;
    String? RE_EDate = pilihTanggal;
    String? L_ID = dropdownValue;
    String? RES_ID = '1';
    if (L_ID == 'A1') {
      L_ID = '1';
    } else {
      L_ID = '2';
    }
    print(
        '## RE_FDate = $RE_FDate,RE_EDate = $RE_EDate,L_ID = $L_ID , RES_ID = $RES_ID , M_ID = $M_ID');
    String path =
        '${MyConstant.domain}/smallmarket/getReserveWhereDateLock.php?isAdd=true&RE_FDate=$RE_FDate&L_ID=$L_ID';
    await Dio().get(path).then((value) {
      print('## value => $value');
      if (value.toString() == 'null') {
        print('## Reserve OK');
        processInserReseve(
            RE_FDate: RE_FDate,
            RE_EDate: RE_EDate,
            L_ID: L_ID,
            RES_ID: RES_ID,
            M_ID: M_ID);
      } else {
        MyDialog().normalDialog(context, 'มีการจองวันที่ $RE_FDate ไปแล้ว',
            'กรุณาเปลี่ยนวันที่จอง หรือล็อคที่จอง');
      }
    });
  }

  Future<Null> processInserReseve(
      {String? RE_FDate,
      String? RE_EDate,
      String? L_ID,
      String? RES_ID,
      String? M_ID}) async {
    String apiInserReseve =
        '${MyConstant.domain}/smallmarket/insertReserve.php?isAdd=true&RE_FDate=$RE_FDate&RE_EDate=$RE_EDate&L_ID=$L_ID&RES_ID=$RES_ID&M_ID=$M_ID';
    await Dio().post(apiInserReseve).then((value) {
      if (value.toString() == 'true') {
        Navigator.pop(context);
      } else {
        MyDialog().normalDialog(context, 'ทำการจองผิดพลาด!!!', 'กรุณาจองใหม่');
      }
    });
  }
}
