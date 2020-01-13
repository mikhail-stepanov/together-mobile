import 'package:flutter/material.dart';
import 'package:together_mobile/util/size_config.dart';
import 'package:pin_view/pin_view.dart';

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
                          print(pin);
                        }),
                    new SizedBox(height: SizeConfig.height(15.0)),
                    new ButtonTheme(
                      minWidth: SizeConfig.width(90.0),
                      height: SizeConfig.height(7.0),
                      child: RaisedButton(
                        onPressed: () {
                          Navigator.pushReplacementNamed(context, '/home');
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
