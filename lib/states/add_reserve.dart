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
  // DateTime? dateTime;
  String? dropdownMonth;
  String? dropdownYear;

  // String? pilihTanggal;
  String labelText = '';
  DateTime tgl = new DateTime.now();

  String? selectedName;
  List data = [];

  Future getAllName() async {
    var url = Uri.parse('http://192.168.1.42/smallmarket/lock.php');
    var response = await http.get(url, headers: {"Accept": "application/json"});
    var jsonBody = response.body;
    var jsonData = json.decode(jsonBody);

    setState(() {
      data = jsonData;
    });
    print(jsonData);
    return "success";
  }

  // Future<Null> _selectedDate(BuildContext context) async {
  //   final DateTime? picked = await showDatePicker(
  //     context: context,
  //     initialDate: tgl,
  //     firstDate: DateTime.now(),
  //     lastDate: DateTime(DateTime.now().year + 1),
  //   );

  //   if (picked != null && picked != tgl) {
  //     setState(() {
  //       tgl = picked;
  //       pilihTanggal = new DateFormat.yMd().format(tgl);
  //     });
  //   } else {}
  // }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    // dateTime = DateTime.now();
    getAllName();
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
            title: 'เลือกเดือนที่เช่า',
            textStyle: MyConstant().h3Stlye(),
          ),
          // DateDropDown(
          //   labelText: labelText,
          //   valueText: new DateFormat.yMd().format(tgl),
          //   onPressed: () {
          //     _selectedDate(context);
          //   },
          // ),
          buildDropMonth(),
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

  DropdownButton<String> buildDropMonth() {
    return DropdownButton(
      value: dropdownMonth,
      items: [
        'มกราคม',
        'กุมภาพันธ์',
        'มีนาคม',
        'เมษายน ',
        'พฤษภาคม',
        'มิถุนายน',
        'กรกฎาคม',
        'สิงหาคม',
        'กันยายน',
        'ตุลาคม ',
        'พฤศจิกายน',
        'ธันวาคม',
      ].map((String month) {
        // print(value);
        return DropdownMenuItem(
          value: month,
          child: Text(
            month.toString(),
            style: MyConstant().h3Stlye(),
          ),
        );
      }).toList(),
      onChanged: (String? month) {
        setState(() {
          dropdownMonth = month;
        });
        print('------value-------');
        print(dropdownMonth);
      },
      hint: const Text(
        'กรุณาเลือก',
        style: TextStyle(
            color: Colors.black, fontSize: 14, fontWeight: FontWeight.w500),
      ),
    );
  }

  DropdownButton<String> buildDropYear() {
    return DropdownButton(
      value: dropdownYear,
      items: [
        '2565',
        '2566',
      ].map((String year) {
        // print(value);
        return DropdownMenuItem(
          value: year,
          child: Text(
            year.toString(),
            style: MyConstant().h3Stlye(),
          ),
        );
      }).toList(),
      onChanged: (String? year) {
        setState(() {
          dropdownYear = year;
        });
        print('------value-------');
        print(dropdownYear);
      },
      hint: const Text(
        'กรุณาเลือก',
        style: TextStyle(
            color: Colors.black, fontSize: 14, fontWeight: FontWeight.w500),
      ),
    );
  }

  DropdownButton<String> buildDropLock() {
    return DropdownButton(
      value: selectedName,
      hint: const Text(
        'กรุณาเลือก',
        style: TextStyle(
            color: Colors.black, fontSize: 14, fontWeight: FontWeight.w500),
      ),
      items: data.map(
        (list) {
          return DropdownMenuItem(
            child: Text(list['L_Name']!),
            value: list['L_ID']!.toString(),
          );
        },
      ).toList(),
      onChanged: (String? lock) {
        setState(() {
          selectedName = lock;
        });
      },
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
    String? RE_Month = dropdownMonth;
    String? RE_Year = dropdownYear;
    String? L_ID = selectedName;
    String? RES_ID = '1';
    print(
        '## RE_Month = $RE_Month	,RE_Year = $RE_Year,L_ID = $L_ID , RES_ID = $RES_ID , M_ID = $M_ID');
    String path =
        '${MyConstant.domain}/smallmarket/getReserveWhereDateLock.php?isAdd=true&RE_Month	=$RE_Month&L_ID=$L_ID&RE_Year=$RE_Year';
    await Dio().get(path).then((value) {
      print('## value => $value');
      if (value.toString() == 'null') {
        print('## Reserve OK');
        processInserReseve(
            RE_Month: RE_Month,
            RE_Year: RE_Year,
            L_ID: L_ID,
            RES_ID: RES_ID,
            M_ID: M_ID);
      } else {
        MyDialog().normalDialog(context, 'มีการจองวันที่ $RE_Month ไปแล้ว',
            'กรุณาเปลี่ยนวันที่จอง หรือล็อคที่จอง');
      }
    });
  }

  Future<Null> processInserReseve(
      {String? RE_Month,
      String? RE_Year,
      String? L_ID,
      String? RES_ID,
      String? M_ID}) async {
    String apiInserReseve =
        '${MyConstant.domain}/smallmarket/insertReserve.php?isAdd=true&RE_Month=$RE_Month	&RE_Year=$RE_Year&L_ID=$L_ID&RES_ID=$RES_ID&M_ID=$M_ID';
    await Dio().post(apiInserReseve).then((value) {
      if (value.toString() == 'true') {
        Navigator.pop(context);
      } else {
        MyDialog().normalDialog(context, 'ทำการจองผิดพลาด!!!', 'กรุณาจองใหม่');
      }
    });
  }
}
