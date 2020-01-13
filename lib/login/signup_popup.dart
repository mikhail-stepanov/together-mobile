import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:together_mobile/util/size_config.dart';

class SignupPopup extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return new BackdropFilter(
        filter: ImageFilter.blur(sigmaX: 6, sigmaY: 6),
        child: AlertDialog(
            backgroundColor: Color(0xFF231F20),
            content: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                mainAxisSize: MainAxisSize.min,
                children: <Widget>[
                  Text(
                    'Спасибо за регистрацию!\nВ случае одобрения Вашей\nзаявки Вам на почту\nпридёт ваш личный ID.',
                    style: TextStyle(
                        fontSize: SizeConfig.height(3), color: Colors.white),
                  ),
                  SizedBox(height: SizeConfig.height(2)),
                  FlatButton(
                      color: Colors.black,
                      onPressed: () {
                        Navigator.pushReplacementNamed(context, '/login');
                      },
                      child: Text(
                        'Ввести ID',
                        style: TextStyle(
                            fontSize: SizeConfig.height(3),
                            color: Colors.white),
                      )),
                ])));
  }
}
