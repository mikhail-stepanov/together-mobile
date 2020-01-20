import 'package:flutter/material.dart';
import 'package:together_mobile/main/tapes/attend_event_tape.dart';
import 'package:together_mobile/main/tapes/old_event_tape.dart';
import 'package:together_mobile/util/globals.dart';
import 'package:together_mobile/util/size_config.dart';

class AttendTabs extends StatefulWidget {
  @override
  _AttendTabsState createState() => new _AttendTabsState();
}

class _AttendTabsState extends State<AttendTabs> {

  final GlobalKey<ScaffoldState> _scaffoldKey = new GlobalKey<ScaffoldState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: DefaultTabController(
            length: 2,
            child: Scaffold(
              key: _scaffoldKey,
              appBar: AppBar(
                title: Container(
                  padding: EdgeInsets.all(30.0),
                  child: new Image.asset('assets/images/together_word.png', fit: BoxFit.cover),
                ),
                backgroundColor: Color(0xFF231F20),
                titleSpacing: 0.0,
                actions: <Widget>[
                  IconButton(
                    padding: EdgeInsets.only(right: 15.0),
                    icon: Image.asset('assets/images/icon_menu.png'),
                    onPressed: () => _scaffoldKey.currentState.openDrawer(),
                  )
                ],
                automaticallyImplyLeading: false,
                bottom: TabBar(
                  isScrollable: true,
                  indicatorColor: Color(0xFF707070),
                  labelStyle: TextStyle(
                    fontSize: SizeConfig.height(2.7),
                  ),
                  tabs: [
                    new Container(
                      width: SizeConfig.width(60.0),
                      child: new Tab(text: 'Посещенные мероприятия'),
                    ),
                    new Container(
                      width: SizeConfig.width(60.0),
                      child: new Tab(text: 'Билеты'),
                    ),
                  ],
                ),
              ),
              body: TabBarView(
                //TODO: ПОФИКСИТЬ ЭТОТ ПИЗДЕЦ
                children: [
                  AttendEventTape(),
                  AttendEventTape(),
                ],
              ),
              drawer: Drawer(
                  child: Container(
                      padding: EdgeInsets.all(30.0),
                      color: Color(0xFF231F20),
                      child: Column(
                          mainAxisAlignment: MainAxisAlignment.start,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: <Widget>[
                            IconButton(
                                padding: EdgeInsets.only(left: 230.0),
                                icon: Image.asset(
                                    'assets/images/icon_close_grey.png'),
                                onPressed: () {
                                  Navigator.pushReplacementNamed(
                                      context, '/home');
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
                                      Globals.name,
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
                            SizedBox(height: SizeConfig.height(8)),
                            FlatButton(
                                padding: EdgeInsets.only(right: 25.0),
                                color: Color(0x00000000),
                                onPressed: () {
                                  Navigator.pushReplacementNamed(
                                      context, '/home');
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
                                  Navigator.pushReplacementNamed(
                                      context, '/attend');
                                },
                                child: Text(
                                  'БИЛЕТЫ',
                                  style: TextStyle(
                                      fontSize: SizeConfig.height(2.7),
                                      color: Colors.white),
                                )),
                            SizedBox(height: SizeConfig.height(3)),
                            FlatButton(
                                padding: EdgeInsets.only(right: 25.0),
                                color: Color(0x00000000),
                                onPressed: () {
                                  Navigator.pushReplacementNamed(
                                      context, '/attend');
                                },
                                child: Text(
                                  'ПРОШЛЫЕ МЕРОПРИЯТИЯ',
                                  style: TextStyle(
                                      fontSize: SizeConfig.height(2.7),
                                      color: Colors.white),
                                )),
                            SizedBox(height: SizeConfig.height(3)),
                            FlatButton(
                                padding: EdgeInsets.only(right: 25.0),
                                color: Color(0x00000000),
                                onPressed: () {
                                  Navigator.pushReplacementNamed(
                                      context, '/login');
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
                                  fontSize: SizeConfig.height(2.5),
                                  color: Colors.white),
                            ),
                            SizedBox(height: SizeConfig.height(3)),
                            Text(
                              'Версия 0.7',
                              style: TextStyle(
                                  fontSize: SizeConfig.height(2),
                                  color: Color(0x80EAEAEA)),
                            ),
                          ]))),
            )));
  }
}
