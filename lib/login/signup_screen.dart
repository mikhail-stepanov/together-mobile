import 'package:flutter/material.dart';
import 'package:together_mobile/login/signup_popup.dart';
import 'package:together_mobile/util/globals.dart';
import 'package:together_mobile/util/size_config.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

class SignupScreen extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => SignupScreenState();
}

class SignupScreenState extends State {
  final _formKey = GlobalKey<FormState>();

  final color_text = Color(0xFF707070);
  bool _agreement = false;
  final TextEditingController _nameController = TextEditingController();
  final TextEditingController _phoneController =
      TextEditingController(text: '+7');
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _facebookController = TextEditingController();
  final TextEditingController _instagramController = TextEditingController();

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
                    new SizedBox(height: SizeConfig.height(10.0)),
                    new Text(
                      'Регистрация',
                      style: TextStyle(
                          fontSize: SizeConfig.height(5.0),
                          color: Colors.white),
                    ),
                    new SizedBox(height: SizeConfig.height(6.0)),
                    new Text(
                      'Имя и фамилия:',
                      style: TextStyle(
                          fontSize: SizeConfig.height(2.3),
                          color: Colors.white),
                    ),
                    new TextFormField(
                        controller: _nameController,
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
                            fontSize: SizeConfig.height(2.3),
                            color: color_text),
                        validator: (value) {
                          if (value.isEmpty)
                            return 'Пожалуйста введите свое имя';
                        }),
                    new SizedBox(height: SizeConfig.height(2.5)),
                    new Text(
                      'Номер телефона:',
                      style: TextStyle(
                          fontSize: SizeConfig.height(2.3),
                          color: Colors.white),
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
                            fontSize: SizeConfig.height(2.3),
                            color: color_text),
                        validator: (value) {
                          if (value.isEmpty)
                            return 'Пожалуйста введите свой телефон';
                        }),
                    new SizedBox(height: SizeConfig.height(2.5)),
                    new Text(
                      'Email:',
                      style: TextStyle(
                          fontSize: SizeConfig.height(2.3),
                          color: Colors.white),
                    ),
                    new TextFormField(
                        controller: _emailController,
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
                            fontSize: SizeConfig.height(2.3),
                            color: color_text),
                        validator: (value) {
                          if (value.isEmpty)
                            return 'Пожалуйста введите свой Email';
                          String p =
                              r'[a-zA-Z0-9+.\_\%-+]{1,256}@[a-zA-Z0-9][a-zA-Z0-9-]{0,64}(.[a-zA-Z0-9][a-zA-Z0-9-]{0,25})+';
                          RegExp regExp = new RegExp(p);
                          if (regExp.hasMatch(value)) return null;
                          return 'Некорректный Email';
                        }),
                    new SizedBox(height: SizeConfig.height(2.5)),
                    new Text(
                      'Ссылка на Facebook:',
                      style: TextStyle(
                          fontSize: SizeConfig.height(2.3),
                          color: Colors.white),
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
                            fontSize: SizeConfig.height(2.3),
                            color: color_text),
                        validator: (value) {
                          if (value.isEmpty)
                            return 'Пожалуйста введите ссылку на одну из соцсетей';
                        }),
                    new SizedBox(height: SizeConfig.height(2.5)),
                    new Text(
                      'Ссылка на Instagram:',
                      style: TextStyle(
                          fontSize: SizeConfig.height(2.3),
                          color: Colors.white),
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
                            fontSize: SizeConfig.height(2.3),
                            color: color_text),
                        validator: (value) {
                          if (value.isEmpty)
                            return 'Пожалуйста введите ссылку на одну из соцсетей';
                        }),
                    new SizedBox(height: SizeConfig.height(1.8)),
                    new Row(children: [
                      Theme(
                        data: Theme.of(context).copyWith(
                          unselectedWidgetColor: Colors.white,
                          backgroundColor: Colors.white,
                        ),
                        child: Checkbox(
                            checkColor: Colors.black,
                            hoverColor: Colors.white,
                            focusColor: Colors.white,
                            activeColor: Colors.white,
                            value: _agreement,
                            onChanged: (bool value) =>
                                setState(() => _agreement = value)),
                      ),
                      new Text(
                        'Даю согласие на обработку',
                        style: TextStyle(
                            fontSize: SizeConfig.height(2.3),
                            color: color_text),
                      ),
                    ]),
                    new SizedBox(height: SizeConfig.height(1.8)),
                    new ButtonTheme(
                      minWidth: SizeConfig.width(90.0),
                      height: SizeConfig.height(7.0),
                      child: RaisedButton(
                        onPressed: () async {
                          if (_agreement) {
                            String name = _nameController.text;
                            String phone = _phoneController.text;
                            String email = _emailController.text;
                            String facebook = _facebookController.text;
                            String instagram = _instagramController.text;
                            var response = await http.post(
                                'http://' + Globals.host + ':8080/v1/signup',
                                headers: {
                                  'Accept': 'application/json',
                                  'Content-Type': 'application/json'
                                },
                                body: jsonEncode({
                                  'name': name,
                                  'phone': phone,
                                  'email': email,
                                  'facebook': facebook,
                                  'instagram': instagram
                                }));
                            Navigator.push(
                                context,
                                PageRouteBuilder(
                                    opaque: false,
                                    pageBuilder:
                                        (BuildContext context, _, __) =>
                                            SignupPopup()));
                          }
                        },
                        child: Text(
                          'Отправить',
                          style: TextStyle(
                            fontSize: SizeConfig.height(2.7),
                          ),
                        ),
                        color: Color(0xFF707070),
                        textColor: Colors.white,
                      ),
                    ),
                    new SizedBox(height: SizeConfig.height(3.0)),
                    Container(
                      padding: EdgeInsets.symmetric(
                          horizontal: SizeConfig.width(42.0)),
                      child: Text(
                        'или',
                        style: TextStyle(
                            fontSize: SizeConfig.height(2),
                            color: Color(0xFF707070)),
                      ),
                    ),
                    new SizedBox(height: SizeConfig.height(3.0)),
//                    new ButtonTheme(
//                      minWidth: SizeConfig.width(90.0),
//                      height: SizeConfig.height(7.0),
//                      child: RaisedButton(
//                        onPressed: () {
//                          if (_agreement)
//                            Navigator.push(
//                                context,
//                                PageRouteBuilder(
//                                    opaque: false,
//                                    pageBuilder:
//                                        (BuildContext context, _, __) =>
//                                            SignupPopup()));
//                        },
//                        child: Text(
//                          'Facebook',
//                          style: TextStyle(
//                            fontSize: SizeConfig.height(2.7),
//                          ),
//                        ),
//                        color: Color(0xFF1977F3),
//                        textColor: Colors.white,
//                      ),
//                    ),
                    new SizedBox(height: SizeConfig.height(10)),
                  ],
                )))));
  }
}
