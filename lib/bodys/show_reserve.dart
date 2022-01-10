import 'package:flutter/material.dart';
import 'package:smallmarket/utillity/my_constant.dart';

class ShowReserve extends StatefulWidget {
  const ShowReserve({Key? key}) : super(key: key);

  @override
  _ShowReserveState createState() => _ShowReserveState();
}

class _ShowReserveState extends State<ShowReserve> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Text('แสดงการจอง'),
      floatingActionButton: FloatingActionButton(
        onPressed: () =>
            Navigator.pushNamed(context, MyConstant.routeAddReserve),
        child: Icon(Icons.add),
      ),
    );
  }
}
