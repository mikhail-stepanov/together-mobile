import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:together_mobile/util/size_config.dart';

class WrongPasswordPopup extends StatelessWidget {
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
                    'Неверный пароль',
                    style: TextStyle(
                        fontSize: SizeConfig.height(3), color: Colors.white),
                  ),
                  SizedBox(height: SizeConfig.height(2)),
                  FlatButton(
                      color: Color(0xFF707070),
                      onPressed: () {
                        Navigator.of(context).pop();                      },
                      child: Text(
                        'Ввести заново',
                        style: TextStyle(
                            fontSize: SizeConfig.height(2.5),
                            color: Colors.white),
                      )),
                ])));
  }
}
