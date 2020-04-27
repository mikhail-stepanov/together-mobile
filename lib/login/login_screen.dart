import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:pin_view/pin_view.dart';
import 'package:together_mobile/exceptions/not_verified.dart';
import 'package:together_mobile/push/push_notifications.dart';
import 'package:together_mobile/util/globals.dart';
import 'package:together_mobile/util/size_config.dart';

class LoginScreen extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => LoginScreenState();
}

class LoginScreenState extends State {
  final _formKey = GlobalKey<FormState>();

  final color_text = Color(0xFF707070);

  @override
  Widget build(BuildContext context) {
    SizeConfig().init(context);
    PushNotificationsManager pushNotificationsManager =
        new PushNotificationsManager();
    pushNotificationsManager.init();

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
                      'Войти в приложение',
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
                        submit: (String pin) {
                          // when all the fields are filled
                          // submit function runs with the pin
                          Globals.pincode = pin;
                          print(pin);
                        }),
                    new SizedBox(height: SizeConfig.height(15.0)),
                    new ButtonTheme(
                      minWidth: SizeConfig.width(90.0),
                      height: SizeConfig.height(7.0),
                      child: RaisedButton(
                        onPressed: () async {
                          var response = await http.post(
                              Globals.host + '/v1/login',
                              headers: {
                                'Accept': 'application/json; charset=utf-8',
                                'Content-Type':
                                    'application/json; charset=utf-8'
                              },
                              body: jsonEncode({
                                'userId': int.parse(Globals.pincode),
                              }));

                          if (response.statusCode == 200) {
                            Map<String, dynamic> responseJson =
                                json.decode(response.body);
                            // If server returns an OK response, parse the JSON.
                            if (responseJson['success'] == true &&
                                responseJson['status'] == 1) {
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
                              Globals.id = responseInfoJson['userId'];

                              Navigator.pushReplacementNamed(
                                  context, '/setpass');
                            }
                            if (responseJson['success'] == true &&
                                responseJson['status'] == 2) {
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
                              Globals.id = responseInfoJson['userId'];

                              Navigator.pushReplacementNamed(
                                  context, '/password');
                            }
                            if (responseJson['error'] ==
                                "User with this id doesn't verified") {
                              Navigator.push(
                                  context,
                                  PageRouteBuilder(
                                      opaque: false,
                                      pageBuilder:
                                          (BuildContext context, _, __) =>
                                              NotVerifiedPopup()));
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
                    new SizedBox(height: SizeConfig.height(4.0)),
                    new ButtonTheme(
                      minWidth: SizeConfig.width(90.0),
                      height: SizeConfig.height(7.0),
                      child: RaisedButton(
                        onPressed: () {
                          Navigator.pushReplacementNamed(context, '/signup');
                        },
                        child: Text(
                          'Регистрация',
                          style: TextStyle(
                            fontSize: SizeConfig.height(3),
                          ),
                        ),
                        color: Color(0xFF231F20),
                        textColor: Color(0xFF707070),
                      ),
                    ),
                    new SizedBox(height: SizeConfig.height(22.5)),
                  ],
                )))));
  }
}
