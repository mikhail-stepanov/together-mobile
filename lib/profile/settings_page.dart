import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:together_mobile/exceptions/server_error.dart';
import 'package:together_mobile/exceptions/success_settings.dart';
import 'package:together_mobile/profile/profile_drawer.dart';
import 'package:together_mobile/util/globals.dart';
import 'package:together_mobile/util/size_config.dart';

class SettingsPage extends StatefulWidget {
  @override
  _SettingsPageState createState() => new _SettingsPageState();
}

class _SettingsPageState extends State<SettingsPage> {
  final _formKey = GlobalKey<FormState>();

  final GlobalKey<ScaffoldState> _scaffoldKey = new GlobalKey<ScaffoldState>();

  final color_text = Color(0xFF707070);

  final TextEditingController _firstNameController =
      TextEditingController(text: Globals.firstName);
  final TextEditingController _lastNameController =
      TextEditingController(text: Globals.lastName);
  final TextEditingController _phoneController =
      TextEditingController(text: Globals.phone);
  final TextEditingController _facebookController =
      TextEditingController(text: Globals.facebook);
  final TextEditingController _instagramController =
      TextEditingController(text: Globals.instagram);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xFF231F20),
      key: _scaffoldKey,
      appBar: AppBar(
        title: Container(
          padding: EdgeInsets.all(30.0),
          child: new Image.asset(
            'assets/images/together_word.png',
            height: SizeConfig.height(2.5),
            width: SizeConfig.width(30),
          ),
        ),
        backgroundColor: Color(0xFF231F20),
        titleSpacing: 0.0,
        actions: <Widget>[
          IconButton(
            padding: EdgeInsets.only(right: 15.0),
            icon: Image.asset(
              'assets/images/icon_menu.png',
              height: SizeConfig.height(5),
              width: SizeConfig.width(5),
            ),
            onPressed: () => _scaffoldKey.currentState.openDrawer(),
          )
        ],
        automaticallyImplyLeading: false,
      ),
      body: new Container(
          padding: EdgeInsets.only(left: 20.0, right: 20.0),
          color: Color(0xFF231F20),
          child: new Form(
              key: _formKey,
              child: SingleChildScrollView(
                  child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  new SizedBox(height: SizeConfig.height(4.0)),
                  new Text(
                    'Настройки профиля',
                    style: TextStyle(
                        fontSize: SizeConfig.height(5.0), color: Colors.white),
                  ),
                  new SizedBox(height: SizeConfig.height(6.0)),
                  new Text(
                    'Фамилия:',
                    style: TextStyle(
                        fontSize: SizeConfig.height(2.3), color: Colors.white),
                  ),
                  new TextFormField(
                      controller: _lastNameController,
                      decoration: new InputDecoration(
                          focusedBorder: new UnderlineInputBorder(
                              borderSide: new BorderSide(
                            color: color_text,
                          )),
                          enabledBorder: new UnderlineInputBorder(
                              borderSide: new BorderSide(
                            color: color_text,
                          ))),
                      cursorColor: color_text,
                      style: TextStyle(
                          fontSize: SizeConfig.height(2.3), color: color_text),
                      validator: (value) {
                        if (value.isEmpty) return 'Пожалуйста введите свое имя';
                      }),
                  new SizedBox(height: SizeConfig.height(2.5)),
                  new Text(
                    'Имя:',
                    style: TextStyle(
                        fontSize: SizeConfig.height(2.3), color: Colors.white),
                  ),
                  new TextFormField(
                      controller: _firstNameController,
                      decoration: new InputDecoration(
                          focusedBorder: new UnderlineInputBorder(
                              borderSide: new BorderSide(
                            color: color_text,
                          )),
                          enabledBorder: new UnderlineInputBorder(
                              borderSide: new BorderSide(
                            color: color_text,
                          ))),
                      cursorColor: color_text,
                      style: TextStyle(
                          fontSize: SizeConfig.height(2.3), color: color_text),
                      validator: (value) {
                        if (value.isEmpty) return 'Пожалуйста введите свое имя';
                      }),
                  new SizedBox(height: SizeConfig.height(2.5)),
                  new Text(
                    'Номер телефона:',
                    style: TextStyle(
                        fontSize: SizeConfig.height(2.3), color: Colors.white),
                  ),
                  new TextFormField(
                      controller: _phoneController,
                      decoration: new InputDecoration(
                          focusedBorder: new UnderlineInputBorder(
                              borderSide: new BorderSide(
                            color: color_text,
                          )),
                          enabledBorder: new UnderlineInputBorder(
                              borderSide: new BorderSide(
                            color: color_text,
                          ))),
                      cursorColor: color_text,
                      style: TextStyle(
                          fontSize: SizeConfig.height(2.3), color: color_text),
                      validator: (value) {
                        if (value.isEmpty)
                          return 'Пожалуйста введите свой телефон';
                      }),
                  new SizedBox(height: SizeConfig.height(2.5)),
                  new Text(
                    'Facebook:',
                    style: TextStyle(
                        fontSize: SizeConfig.height(2.3), color: Colors.white),
                  ),
                  new TextFormField(
                      controller: _facebookController,
                      decoration: new InputDecoration(
                          focusedBorder: new UnderlineInputBorder(
                              borderSide: new BorderSide(
                            color: color_text,
                          )),
                          enabledBorder: new UnderlineInputBorder(
                              borderSide: new BorderSide(
                            color: color_text,
                          ))),
                      cursorColor: color_text,
                      style: TextStyle(
                          fontSize: SizeConfig.height(2.3), color: color_text),
                      validator: (value) {
                        if (value.isEmpty)
                          return 'Пожалуйста введите ссылку на одну из соцсетей';
                      }),
                  new SizedBox(height: SizeConfig.height(2.5)),
                  new Text(
                    'Instagram:',
                    style: TextStyle(
                        fontSize: SizeConfig.height(2.3), color: Colors.white),
                  ),
                  new TextFormField(
                      controller: _instagramController,
                      decoration: new InputDecoration(
                          focusedBorder: new UnderlineInputBorder(
                              borderSide: new BorderSide(
                            color: color_text,
                          )),
                          enabledBorder: new UnderlineInputBorder(
                              borderSide: new BorderSide(
                            color: color_text,
                          ))),
                      cursorColor: color_text,
                      style: TextStyle(
                          fontSize: SizeConfig.height(2.3), color: color_text),
                      validator: (value) {
                        if (value.isEmpty)
                          return 'Пожалуйста введите ссылку на одну из соцсетей';
                      }),
                  new SizedBox(height: SizeConfig.height(8)),
                  new ButtonTheme(
                    minWidth: SizeConfig.width(90.0),
                    height: SizeConfig.height(7.0),
                    child: RaisedButton(
                      onPressed: () async {
                        String firstName = _firstNameController.text;
                        String lastName = _lastNameController.text;
                        String phone = _phoneController.text;
                        String facebook = _facebookController.text;
                        String instagram = _instagramController.text;
                        var response = await http.post(
                            'http://' + Globals.host + ':8080/v1/user/update',
                            headers: {
                              'Accept': 'application/json; charset=utf-8',
                              'Content-Type': 'application/json; charset=utf-8'
                            },
                            body: jsonEncode({
                              'userId': Globals.id,
                              'firstName': firstName,
                              'lastName': lastName,
                              'phone': phone,
                              'facebook': facebook,
                              'instagram': instagram
                            }));
                        Map<String, dynamic> responseJson =
                            json.decode(response.body);
                        if (responseJson['error']
                            .toString()
                            .contains('error')) {
                          Navigator.push(
                              context,
                              PageRouteBuilder(
                                  opaque: false,
                                  pageBuilder: (BuildContext context, _, __) =>
                                      ServerErrorPopup()));
                        } else {
                          Globals.firstName = firstName;
                          Globals.lastName = lastName;
                          Navigator.push(
                              context,
                              PageRouteBuilder(
                                  opaque: false,
                                  pageBuilder: (BuildContext context, _, __) =>
                                      SettingsSuccessPopup()));
                        }
                      },
                      child: Text(
                        'Обновить',
                        style: TextStyle(
                          fontSize: SizeConfig.height(2.7),
                        ),
                      ),
                      color: Color(0xFF707070),
                      textColor: Colors.white,
                    ),
                  ),
                  new SizedBox(height: SizeConfig.height(3.0)),
                  new SizedBox(height: SizeConfig.height(10)),
                ],
              )))),
      drawer: ProfileDrawer(),
    );
  }
}
