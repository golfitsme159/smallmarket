import 'package:flutter/material.dart';
import 'package:smallmarket/utillity/my_constant.dart';
import 'package:smallmarket/widgets/show_title.dart';

class CreateAccount extends StatefulWidget {
  const CreateAccount({Key? key}) : super(key: key);

  @override
  _CreateAccountState createState() => _CreateAccountState();
}

class _CreateAccountState extends State<CreateAccount> {
  final formkey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    double size = MediaQuery.of(context).size.width;

    return GestureDetector(
      onTap: () => FocusScope.of(context).requestFocus(FocusNode()),
      behavior: HitTestBehavior.opaque,
      child: Scaffold(
        appBar: AppBar(
          title: Text('สมัครสมาชิก'),
          backgroundColor: MyConstant.primary,
        ),
        body: Form(
          key: formkey,
          child: ListView(
            padding: EdgeInsets.all(16),
            children: [
              buildTitle('ข้อมูลในการสมัคร'),
              buildUser(size),
              buildPassword(size),
              buildName(size),
              buildPhoneNumber(size),
              buildCreate(size),
            ],
          ),
        ),
      ),
    );
  }

  Row buildCreate(double size) {
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
              } else {}
            },
            child: Text('สมัคร'),
          ),
        ),
      ],
    );
  }

  Row buildName(double size) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Container(
          margin: EdgeInsets.only(
            top: 16,
          ),
          width: size * 0.6,
          child: TextFormField(
            validator: (value) {
              if (value!.isEmpty) {
                return 'กรุณากรอกชื่อ - นามสกุล';
              } else {}
            },
            decoration: InputDecoration(
              labelStyle: MyConstant().h3Stlye(),
              labelText: 'ชื่อ - นามสกุล',
              prefixIcon: Icon(
                Icons.fingerprint,
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
        ),
      ],
    );
  }

  Row buildPhoneNumber(double size) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Container(
          margin: EdgeInsets.only(
            top: 16,
          ),
          width: size * 0.6,
          child: TextFormField(
            validator: (value) {
              if (value!.isEmpty) {
                return 'กรุณากรอกเบอร์ติดต่อ';
              } else {}
            },
            decoration: InputDecoration(
              labelStyle: MyConstant().h3Stlye(),
              labelText: 'เบอร์ติดต่อ',
              prefixIcon: Icon(
                Icons.phone,
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
        ),
      ],
    );
  }

  Row buildUser(double size) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Container(
          margin: EdgeInsets.only(
            top: 16,
          ),
          width: size * 0.6,
          child: TextFormField(
            validator: (value) {
              if (value!.isEmpty) {
                return 'กรุณากรอก ID';
              } else {}
            },
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
        ),
      ],
    );
  }

  Row buildPassword(double size) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Container(
          margin: EdgeInsets.only(
            top: 16,
          ),
          width: size * 0.6,
          child: TextFormField(
            validator: (value) {
              if (value!.isEmpty) {
                return 'กรุณากรอกรหัสผ่าน';
              } else {}
            },
            decoration: InputDecoration(
              labelStyle: MyConstant().h3Stlye(),
              labelText: 'รหัสผ่าน',
              prefixIcon: Icon(
                Icons.password,
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
        ),
      ],
    );
  }

  ShowTitle buildTitle(String title) {
    return ShowTitle(
      title: title,
      textStyle: MyConstant().h2Stlye(),
    );
  }
}
