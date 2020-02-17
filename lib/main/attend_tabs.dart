import 'package:flutter/material.dart';
import 'package:together_mobile/main/tapes/attend_event_tape.dart';
import 'package:together_mobile/main/tapes/ticket_tape.dart';
import 'package:together_mobile/profile/profile_drawer.dart';
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
                    icon: Image.asset('assets/images/icon_menu.png',
                        height: SizeConfig.height(5),
                        width: SizeConfig.width(5)),
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
                      child: new Tab(text: 'Посещенные мероприятия'),
                    ),
                    new Container(
                      width: SizeConfig.width(40.0),
                      child: new Tab(text: 'Билеты'),
                    ),
                  ],
                ),
              ),
              body: TabBarView(
                children: [
                  AttendTape(),
                  TicketTape(),
                ],
              ),
              drawer: ProfileDrawer(),
            )));
  }
}
