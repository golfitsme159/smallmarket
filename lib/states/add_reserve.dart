import 'package:flutter/material.dart';
import 'package:smallmarket/utillity/my_constant.dart';

class AddReserve extends StatefulWidget {
  const AddReserve({Key? key}) : super(key: key);

  @override
  _AddReserveState createState() => _AddReserveState();
}

class _AddReserveState extends State<AddReserve> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('ทำการจองแผง'),
      ),
      body: LayoutBuilder(
        builder: (context, constraints) => buildAdd(constraints),
      ),
    );
  }

  Widget buildAdd(BoxConstraints constraints) {
    return Container(
      width: constraints.maxWidth * 0.75,
      margin: EdgeInsets.only(
        top: 16,
      ),
      child: TextFormField(
        decoration: InputDecoration(
          labelStyle: MyConstant().h3Stlye(),
          labelText: 'ID',
          prefixIcon: Icon(
            Icons.account_circle_outlined,
            color: MyConstant.dart,
          ),
          enabledBorder: OutlineInputBorder(
            borderSide: BorderSide(color: MyConstant.dart),
            borderRadius: BorderRadius.circular(30),
          ),
          focusedBorder: OutlineInputBorder(
            borderSide: BorderSide(color: MyConstant.light),
            borderRadius: BorderRadius.circular(30),
          ),
        ),
      ),
    );
  }
}
