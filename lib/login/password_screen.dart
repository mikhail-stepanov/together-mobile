import 'dart:convert';
import 'dart:io';
import 'dart:typed_data';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:pin_view/pin_view.dart';
import 'package:together_mobile/exceptions/wrong_password.dart';
import 'package:together_mobile/util/globals.dart';
import 'package:together_mobile/util/refresh_globals_event.dart';
import 'package:together_mobile/util/size_config.dart';

class PasswordScreen extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => PasswordScreenState();
}

class PasswordScreenState extends State {
  final _formKey = GlobalKey<FormState>();

  final color_text = Color(0xFF707070);

  @override
  Widget build(BuildContext context) {
    SizeConfig().init(context);

    return Scaffold(
        body: new Container(
            padding: EdgeInsets.only(left: 20.0, right: 20.0),
            color: Color(0xFF231F20),
            child: new Form(
                key: _formKey,
                child: SingleChildScrollView(
                    child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    new SizedBox(height: SizeConfig.height(15.0)),
                    new Text(
                      'Введите пароль',
                      style: TextStyle(
                          fontSize: SizeConfig.height(4.8),
                          color: Colors.white),
                    ),
                    new SizedBox(height: SizeConfig.height(15.0)),
                    new PinView(
                        count: 4,
                        autoFocusFirstField: false,
                        // defaults to true
                        margin: EdgeInsets.all(1),
                        // margin between the fields
                        style: TextStyle(
                            // style for the fields
                            color: Colors.white,
                            fontSize: 40.0,
                            fontWeight: FontWeight.w500),
                        inputDecoration: new InputDecoration(
                            border: InputBorder.none,
                            fillColor: Colors.white,
                            focusedBorder: new UnderlineInputBorder(
                                borderSide: new BorderSide(
                              color: Colors.white,
                            )),
                            enabledBorder: new UnderlineInputBorder(
                                borderSide: new BorderSide(
                              color: color_text,
                            ))),
                        submit: (String password) {
                          // when all the fields are filled
                          // submit function runs with the pin
                          Globals.password = password;
                        }),
                    new SizedBox(height: SizeConfig.height(15.0)),
                    new ButtonTheme(
                      minWidth: SizeConfig.width(90.0),
                      height: SizeConfig.height(7.0),
                      child: RaisedButton(
                        onPressed: () async {
                          var response = await http.post(
                              Globals.host + '/v1/login/pass',
                              headers: {
                                'Accept': 'application/json; charset=utf-8',
                                'Content-Type':
                                    'application/json; charset=utf-8'
                              },
                              body: jsonEncode({
                                'userId': int.parse(Globals.pincode),
                                'password': Globals.password,
                              }));

                          if (response.statusCode == 200) {
                            Map<String, dynamic> responseJson =
                                json.decode(response.body);
                            // If server returns an OK response, parse the JSON.
                            if (responseJson['success'] == true) {
                              var responseInfo = await http.post(
                                  Globals.host + '/v1/info',
                                  headers: {
                                    'Accept': 'application/json; charset=utf-8',
                                    'Content-Type':
                                        'application/json; charset=utf-8'
                                  },
                                  body: jsonEncode({
                                    'userId': int.parse(Globals.pincode),
                                  }));
                              Map<String, dynamic> responseInfoJson =
                                  json.decode(responseInfo.body);
                              Globals.firstName = responseInfoJson['firstName'];
                              Globals.lastName = responseInfoJson['lastName'];
                              Globals.facebook = responseInfoJson['facebook'];
                              Globals.instagram = responseInfoJson['instagram'];
                              Globals.phone = responseInfoJson['phone'];
                              Globals.id = responseInfoJson['userId'];
                              Globals.user_pic = responseInfoJson['picId'];

                              var responseImage = await http.post(
                                  Globals.host + '/v1/image/get',
                                  headers: {
                                    'Accept': 'application/json; charset=utf-8',
                                    'Content-Type':
                                    'application/json; charset=utf-8'
                                  },
                                  body: jsonEncode({
                                    'id': Globals.user_pic,
                                  }));
                              Map<String, dynamic> responseImageJson = json.decode(responseImage.body);
                              String encodedStr = responseImageJson['content'];
                              Uint8List bytes = base64Decode(encodedStr);
                              Globals.user_image = bytes;

                              RefreshEvents.refresh();

                              Navigator.pushReplacementNamed(context, '/home');
                            }
                            if (responseJson['error'] == "Wrong password") {
                              Navigator.push(
                                  context,
                                  PageRouteBuilder(
                                      opaque: false,
                                      pageBuilder:
                                          (BuildContext context, _, __) =>
                                              WrongPasswordPopup()));
                            }
                          } else {
                            // If that response was not OK, throw an error.
                            throw Exception('Failed to load post');
                          }
                        },
                        child: Text(
                          'Войти',
                          style: TextStyle(
                            fontSize: SizeConfig.height(3),
                          ),
                        ),
                        color: Color(0xFF707070),
                        textColor: Colors.white,
                      ),
                    ),
                    new SizedBox(height: SizeConfig.height(34.0)),
                  ],
                )))));
  }
}
