import 'package:flutter/material.dart';
import 'package:smallmarket/widgets/show_image.dart';
import 'package:smallmarket/widgets/show_title.dart';
import 'package:smallmarket/utillity/my_constant.dart';

class MyDialog {
  Future<Null> normalDialog(
      BuildContext context, String title, String message) async {
    showDialog(
      context: context,
      builder: (context) => SimpleDialog(
        title: ListTile(
          leading: ShowImage(pathImage: MyConstant.image1),
          title: ShowTitle(
            title: title,
            textStyle: MyConstant().h2Stlye(),
          ),
          subtitle:
              ShowTitle(title: message, textStyle: MyConstant().h3Stlye()),
        ),
        children: [
          TextButton(
            onPressed: () => Navigator.pop(context),
            child: Text('OK'),
          )
        ],
      ),
    );
  }
}
