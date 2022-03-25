import 'package:flutter/material.dart';
import 'package:smallmarket/models/reserve_model.dart';
import 'package:smallmarket/utillity/my_constant.dart';
import 'package:smallmarket/widgets/show_title.dart';

class DetailReserve extends StatefulWidget {
  final ReserveModel? detailModel;
  const DetailReserve({Key? key, required this.detailModel}) : super(key: key);

  @override
  _DetailReserveState createState() => _DetailReserveState();
}

class _DetailReserveState extends State<DetailReserve> {
  ReserveModel? detailModel;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    detailModel = widget.detailModel;
    print('## name Details ==> ${detailModel!.L_Name}');
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('รายระเลีอดการจอง'),
      ),
      body: Card(
        margin: EdgeInsets.all(30),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            ShowTitle(title: '', textStyle: MyConstant().h1Stlye()),
            Center(
                child: ShowTitle(
                    title: 'ข้อมูลการจอง', textStyle: MyConstant().h1Stlye())),
            Container(
              padding: EdgeInsets.all(10),
              child: ShowTitle(
                title: 'ชื่อ : ${detailModel!.M_Name}',
                textStyle: MyConstant().h2Stlye(),
              ),
            ),
            Container(
              padding: EdgeInsets.all(10),
              child: ShowTitle(
                title: 'ล็อกที่จอง : ${detailModel!.L_Name}',
                textStyle: MyConstant().h2Stlye(),
              ),
            ),
            Container(
              padding: EdgeInsets.all(10),
              child: ShowTitle(
                title: 'ราคา : ${detailModel!.Price} บาท',
                textStyle: MyConstant().h2Stlye(),
              ),
            ),
            Container(
              padding: EdgeInsets.all(10),
              child: ShowTitle(
                title:
                    'เดือนเช่า : ${detailModel!.RE_FirstDate}/${detailModel!.RE_EndDate}',
                textStyle: MyConstant().h2Stlye(),
              ),
            ),
            Container(
              padding: EdgeInsets.all(10),
              child: ShowTitle(
                title: 'ประเภท : ${detailModel!.T_Name}',
                textStyle: MyConstant().h2Stlye(),
              ),
            ),
            Container(
              padding: EdgeInsets.all(10),
              child: ShowTitle(
                title: 'โซน : ${detailModel!.Z_Name}',
                textStyle: MyConstant().h2Stlye(),
              ),
            ),
            Container(
              padding: EdgeInsets.all(10),
              child: ShowTitle(
                title: 'สถานะ : ${detailModel!.RES_Name}',
                textStyle: MyConstant().h2Stlye(),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
