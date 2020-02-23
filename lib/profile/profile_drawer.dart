import 'package:flutter/material.dart';
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
                      Image.network(
                          "https://zenit.org/wp-content/uploads/2018/05/no-image-icon.png",
                          width: SizeConfig.width(15.0),
                          height: SizeConfig.height(15.0)),
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
