import 'dart:convert';

import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:smallmarket/models/reserve_model.dart';
import 'package:smallmarket/states/details_reserve.dart';
import 'package:smallmarket/utillity/my_constant.dart';
import 'package:smallmarket/widgets/show_progress.dart';
import 'package:smallmarket/widgets/show_title.dart';

class ShowRent extends StatefulWidget {
  const ShowRent({Key? key}) : super(key: key);

  @override
  _ShowRentState createState() => _ShowRentState();
}

class _ShowRentState extends State<ShowRent> {
  bool lond = true;
  bool? haveData;
  List<ReserveModel> reserveModels = [];

  @override
  void initState() {
    super.initState();
    loadValueFromAPI();
  }

  Future<Null> loadValueFromAPI() async {
    if (reserveModels.length != 0) {
      reserveModels.clear();
    } else {}

    SharedPreferences preferences = await SharedPreferences.getInstance();
    String M_ID = preferences.getString('M_ID')!;
    String apiGetReserve =
        '${MyConstant.domain}/smallmarket/getRentWhereUser.php?isAdd=true&M_ID=$M_ID';
    await Dio().get(apiGetReserve).then((value) {
      // print('value ==> $value');

      if (value.toString() == 'null') {
        //No Data
        setState(() {
          lond = false;
          haveData = false;
        });
      } else {
        //Have Data
        for (var item in json.decode(value.data)) {
          ReserveModel model = ReserveModel.fromMap(item);
          print('Reserve ==> ${model.RES_Name}');

          setState(() {
            lond = false;
            haveData = true;
            reserveModels.add(model);
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
                          title: '?????????????????????????????????',
                          textStyle: MyConstant().h1Stlye()),
                      ShowTitle(
                          title: '???????????????????????????????????????',
                          textStyle: MyConstant().h2Stlye()),
                    ],
                  ),
                ),
      floatingActionButton: FloatingActionButton(
        onPressed: () =>
            Navigator.pushNamed(context, MyConstant.routeAddReserve)
                .then((value) => loadValueFromAPI()),
        child: Icon(Icons.add),
      ),
    );
  }

  ListView buildListView(BoxConstraints constraints) {
    return ListView.builder(
      itemCount: reserveModels.length,
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
                    title: 'Lock : ${reserveModels[index].L_Name}',
                    textStyle: MyConstant().h2Stlye(),
                  ),
                  ShowTitle(
                    title: '????????????????????????????????????',
                    textStyle: MyConstant().h3Stlye(),
                  ),
                  ShowTitle(
                    title:
                        '${reserveModels[index].RE_FirstDate}/${reserveModels[index].RE_EndDate}',
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
                          print('## ?????????????????????????????????????????????????????????????????? $index');
                          confirmDialogDelete(reserveModels[index]);
                        },
                        icon: Icon(
                          Icons.delete_outline,
                          size: 28,
                          color: MyConstant.dart,
                        ),
                      ),
                      IconButton(
                        onPressed: () {
                          print('## You Cick Datails');
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => DetailReserve(
                                detailModel: reserveModels[index],
                              ),
                            ),
                          );
                        },
                        icon: Icon(
                          Icons.more_horiz,
                          size: 28,
                          color: MyConstant.dart,
                        ),
                      ),
                    ],
                  ),
                  ShowTitle(
                    title: '???????????? : ${reserveModels[index].Price} ?????????',
                    textStyle: MyConstant().h2Stlye(),
                  ),
                  ShowTitle(
                    title: '??????????????? : ${reserveModels[index].RES_Name}',
                    textStyle: MyConstant().h3Stlye(),
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

  Future<Null> confirmDialogDelete(ReserveModel reserveModels) async {
    showDialog(
      context: context,
      builder: (context) => AlertDialog(
        title: ListTile(
          title: ShowTitle(
            title: '?????????????????????????????????????????????????????????????????????????????? ? ${reserveModels.L_Name}',
            textStyle: MyConstant().h2Stlye(),
          ),
          subtitle: ShowTitle(
            title: '???????????????????????????????????????????????????',
            textStyle: MyConstant().h3Stlye(),
          ),
        ),
        actions: [
          TextButton(
            onPressed: () async {
              print('## Confirm Delete at id ==> ${reserveModels.RE_ID}');
              String apiDeleteReserve =
                  '${MyConstant.domain}/smallmarket/deleteWhereId.php?isAdd=true&RE_ID=${reserveModels.RE_ID}';
              await Dio().get(apiDeleteReserve).then((value) {
                Navigator.pop(context);
                loadValueFromAPI();
              });
            },
            child: Text('??????????????????'),
          ),
          TextButton(
            onPressed: () => Navigator.pop(context),
            child: Text('????????????????????????'),
          ),
        ],
      ),
    );
  }
}
