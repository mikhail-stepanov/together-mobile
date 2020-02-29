import 'dart:convert';
import 'dart:io';
import 'dart:typed_data';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:image_picker/image_picker.dart';
import 'package:together_mobile/exceptions/server_error.dart';
import 'package:together_mobile/exceptions/success_settings.dart';
import 'package:together_mobile/util/globals.dart';
import 'package:together_mobile/util/refresh_globals_event.dart';
import 'package:together_mobile/util/size_config.dart';

class ProfileDrawer extends StatelessWidget {
  Widget build(BuildContext context) {
    return Drawer(
        child: Container(
            padding: EdgeInsets.all(30.0),
            color: Color(0xFF231F20),
            child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  IconButton(
                      padding: EdgeInsets.only(left: 230.0),
                      icon: Image.asset('assets/images/icon_close_grey.png'),
                      onPressed: () {
                        Navigator.pushReplacementNamed(context, '/home');
                      }),
                  Row(
                    children: <Widget>[
                      new ButtonTheme(
                        minWidth: SizeConfig.width(15.0),
                        height: SizeConfig.height(10.0),
                        child: RaisedButton(
                          onPressed: () async {
                            File file = await ImagePicker.pickImage(
                                source: ImageSource.gallery);
                            if (file == null) return;
                            String base64Image =
                                base64Encode(file.readAsBytesSync());
                            String fileName = file.path.split("/").last;

                            var responseUpload = await http.post(
                                'http://' +
                                    Globals.host +
                                    ':8080/v1/image/upload',
                                headers: {
                                  'Accept': 'application/json; charset=utf-8',
                                  'Content-Type':
                                      'application/json; charset=utf-8'
                                },
                                body: jsonEncode({
                                  'name': fileName,
                                  'content': base64Image
                                }));
                            Map<String, dynamic> responseUploadJson =
                                json.decode(responseUpload.body);

                            var response = await http.post(
                                'http://' +
                                    Globals.host +
                                    ':8080/v1/user/update',
                                headers: {
                                  'Accept': 'application/json; charset=utf-8',
                                  'Content-Type':
                                      'application/json; charset=utf-8'
                                },
                                body: jsonEncode({
                                  'userId': Globals.id,
                                  'picId': responseUploadJson["id"]
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
                                      pageBuilder:
                                          (BuildContext context, _, __) =>
                                              ServerErrorPopup()));
                            } else {
                              var responseInfo = await http.post(
                                  'http://' + Globals.host + ':8080/v1/info',
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
                                  'http://' +
                                      Globals.host +
                                      ':8080/v1/image/get',
                                  headers: {
                                    'Accept': 'application/json; charset=utf-8',
                                    'Content-Type':
                                        'application/json; charset=utf-8'
                                  },
                                  body: jsonEncode({
                                    'id': Globals.user_pic,
                                  }));
                              Map<String, dynamic> responseImageJson =
                                  json.decode(responseImage.body);
                              String encodedStr = responseImageJson['content'];
                              Uint8List bytes = base64Decode(encodedStr);
                              Globals.user_image = bytes;

                              RefreshEvents.refresh();
                              Navigator.push(
                                  context,
                                  PageRouteBuilder(
                                      opaque: false,
                                      pageBuilder:
                                          (BuildContext context, _, __) =>
                                              SettingsSuccessPopup()));
                            }
                          },
                          child: Image.memory(Globals.user_image,
                              width: SizeConfig.width(15.0),
                              height: SizeConfig.height(15.0)),
                        ),
                        buttonColor: Color(0xFF231F20),
                      ),
                      SizedBox(width: SizeConfig.width(2)),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: <Widget>[
                          Text(
                            Globals.lastName + ' ' + Globals.firstName,
                            style: TextStyle(
                                fontSize: SizeConfig.height(2.3),
                                color: Colors.white),
                          ),
                          SizedBox(height: SizeConfig.height(1)),
                          Text(
                            'id ' + Globals.id.toString(),
                            style: TextStyle(
                                fontSize: SizeConfig.height(2.3),
                                color: Colors.white),
                          ),
                        ],
                      )
                    ],
                  ),
                  SizedBox(height: SizeConfig.height(7)),
                  FlatButton(
                      padding: EdgeInsets.only(right: 25.0),
                      color: Color(0x00000000),
                      onPressed: () {
                        RefreshEvents.refresh();
                        Navigator.pushReplacementNamed(context, '/home');
                      },
                      child: Text(
                        'ГЛАВНАЯ',
                        style: TextStyle(
                            fontSize: SizeConfig.height(2.7),
                            color: Colors.white),
                      )),
                  SizedBox(height: SizeConfig.height(3)),
                  FlatButton(
                      padding: EdgeInsets.only(right: 25.0),
                      color: Color(0x00000000),
                      onPressed: () {
                        RefreshEvents.refresh();
                        Navigator.pushReplacementNamed(context, '/attend');
                      },
                      child: Text(
                        'МОИ МЕРОПРИЯТИЯ',
                        style: TextStyle(
                            fontSize: SizeConfig.height(2.7),
                            color: Colors.white),
                      )),
                  SizedBox(height: SizeConfig.height(3)),
                  FlatButton(
                      padding: EdgeInsets.only(right: 25.0),
                      color: Color(0x00000000),
                      onPressed: () {
                        RefreshEvents.refresh();
                        Navigator.pushReplacementNamed(context, '/settings');
                      },
                      child: Text(
                        'НАСТРОЙКИ',
                        style: TextStyle(
                            fontSize: SizeConfig.height(2.7),
                            color: Colors.white),
                      )),
                  SizedBox(height: SizeConfig.height(3)),
                  FlatButton(
                      padding: EdgeInsets.only(right: 25.0),
                      color: Color(0x00000000),
                      onPressed: () {
                        Navigator.pushReplacementNamed(context, '/login');
                      },
                      child: Text(
                        'ВЫЙТИ',
                        style: TextStyle(
                            fontSize: SizeConfig.height(2.7),
                            color: Colors.white),
                      )),
                  SizedBox(height: SizeConfig.height(9)),
                  Text(
                    'Оценить приложение',
                    style: TextStyle(
                        fontSize: SizeConfig.height(2.5), color: Colors.white),
                  ),
                  SizedBox(height: SizeConfig.height(3)),
                  Text(
                    Globals.version,
                    style: TextStyle(
                        fontSize: SizeConfig.height(2),
                        color: Color(0x80EAEAEA)),
                  ),
                ])));
  }
}
