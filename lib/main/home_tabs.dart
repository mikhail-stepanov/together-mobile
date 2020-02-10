import 'package:flutter/material.dart';
import 'package:together_mobile/main/tapes/future_event_tape.dart';
import 'package:together_mobile/main/tapes/old_event_tape.dart';
import 'package:together_mobile/profile/profile-drawer.dart';
import 'package:together_mobile/util/globals.dart';
import 'package:together_mobile/util/size_config.dart';

class HomeTabs extends StatefulWidget {
  @override
  _HomeTabsState createState() => new _HomeTabsState();
}

class _HomeTabsState extends State<HomeTabs> {
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
                bottom: TabBar(
                  isScrollable: true,
                  indicatorColor: Color(0xFF707070),
                  labelStyle: TextStyle(
                    fontSize: SizeConfig.height(2.7),
                    fontFamily: 'Futura',
                  ),
                  tabs: [
                    new Container(
                      width: SizeConfig.width(60.0),
                      child: new Tab(text: 'Ближайшие мероприятия'),
                    ),
                    new Container(
                      width: SizeConfig.width(60.0),
                      child: new Tab(text: 'Прошедшие мероприятия'),
                    ),
                  ],
                ),
              ),
              body: TabBarView(
                children: [
                  FutureEventTape(),
                  OldEventTape(),
                ],
              ),
              drawer: ProfileDrawer(),
            )));
  }
}
