import 'package:flutter/material.dart';
import 'package:together_mobile/main/attend_tabs.dart';
import 'package:together_mobile/main/home_tabs.dart';
import 'package:together_mobile/main/tapes/entities//event_other.dart';
import 'package:together_mobile/main/tapes/entities/event_null.dart';
import 'package:together_mobile/util/globals.dart';
import 'package:together_mobile/util/size_config.dart';
import 'package:together_mobile/util/video_player.dart';

class EventFutureOpen extends StatefulWidget {
  @override
  _EventFutureOpenState createState() => new _EventFutureOpenState();
}

class _EventFutureOpenState extends State<EventFutureOpen> {
  final GlobalKey<ScaffoldState> _scaffoldKey = new GlobalKey<ScaffoldState>();

  final color_text = Color(0xFF707070);

  @override
  Widget build(BuildContext context) {
    return new Scaffold(
        key: _scaffoldKey,
        appBar: AppBar(
          title: Container(
            padding: EdgeInsets.all(30.0),
            child: new Image.asset('assets/images/together_word.png',
              height: SizeConfig.height(2.5),
              width: SizeConfig.width(30),),
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
        ),
        body: new Container(
            color: Color(0xFF231F20),
            child: new Form(
                child: SingleChildScrollView(
                    child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Container(
                  height: SizeConfig.height(40),
                  child: VideoPlayerScreen(),
                ),
//                Image.network(
//                    "https://moi-portal.ru/upload/iblock/f59/f59562c12f5e58cf69c4412d59d5a7b1.jpg",
//                    fit: BoxFit.fill,
//                    height: SizeConfig.height(45.0),
//                    width: SizeConfig.width(100.0)),
                Container(
                  padding: EdgeInsets.only(left: 15.0, top: 15.0),
                  child: Row(
                    children: [
                      new Text(
                        'TOGETHER NEW YEAR!',
                        style: TextStyle(
                            fontSize: SizeConfig.height(3.5),
                            color: Colors.white),
                      ),
                    ],
                  ),
                ),
                new SizedBox(height: SizeConfig.height(2.0)),
                Container(
                  padding: EdgeInsets.only(left: 15.0),
                  child: Row(
                    children: [
                      new Image.asset('assets/images/icon_location.png',
                          height: SizeConfig.height(4),
                          width: SizeConfig.width(4)),
                      new SizedBox(width: SizeConfig.width(2.7)),
                      Container(
                        padding: EdgeInsets.only(right: 15.0),
                        width: SizeConfig.width(80.0),
                        child: Text(
                          'Ресторан Центрального Дома Литераторов. Москва ул. Поварская 50/53 стр. 1',
                          style: TextStyle(
                              fontSize: SizeConfig.height(2.5),
                              color: Colors.white),
                        ),
                      ),
                    ],
                  ),
                ),
                new SizedBox(height: SizeConfig.height(1.0)),
                Container(
                  padding: EdgeInsets.only(left: 15.0),
                  child: Row(
                    children: [
                      new Image.asset('assets/images/icon_time.png',
                          height: SizeConfig.height(4),
                          width: SizeConfig.width(4)),
                      new SizedBox(width: SizeConfig.width(2.7)),
                      new Text(
                        '01.01.20 01:00-10:00',
                        style: TextStyle(
                            fontSize: SizeConfig.height(2.5),
                            color: Colors.white),
                      ),
                    ],
                  ),
                ),
                new SizedBox(height: SizeConfig.height(3.0)),
                Container(
                  padding: EdgeInsets.only(left: 15.0, right: 15.0),
                  width: SizeConfig.width(90.0),
                  child: Text(
                    "Новый год с TOGETHER!",
                    style: TextStyle(
                        fontSize: SizeConfig.height(2.2), color: Colors.white),
                  ),
                ),
                new SizedBox(height: SizeConfig.height(4.0)),
//                Container(
//                  padding: EdgeInsets.only(left: 20.0),
//                  child: ButtonTheme(
//                    minWidth: SizeConfig.width(90.0),
//                    height: SizeConfig.height(7.0),
//                    child: RaisedButton(
//                      onPressed: () {},
//                      child: Text(
//                        'Купить билет',
//                        style: TextStyle(
//                          fontSize: SizeConfig.height(3),
//                        ),
//                      ),
//                      color: Color(0xFF707070),
//                      textColor: Colors.white,
//                    ),
//                  ),
//                ),
                new SizedBox(height: SizeConfig.height(4.0)),
                Container(
                  padding: EdgeInsets.only(left: 20.0, right: 15.0),
                  width: SizeConfig.width(90.0),
                  child: Text(
                    "Другие мероприятия",
                    style: TextStyle(
                        fontSize: SizeConfig.height(2.8), color: Colors.white),
                  ),
                ),
                new SizedBox(height: SizeConfig.height(1.0)),
                Container(
                  margin: EdgeInsets.symmetric(vertical: 10.0),
                  padding: EdgeInsets.only(left: 15.0),
                  height: SizeConfig.height(30.0),
                  child: ListView.builder(
                    shrinkWrap: true,
                    scrollDirection: Axis.horizontal,
                    itemCount: 1,
                    itemBuilder: (context, index) => EventNull(),
                  ),
                ),
                new SizedBox(height: SizeConfig.height(2.0)),
              ],
            )))),
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
                          icon:
                              Image.asset('assets/images/icon_close_grey.png'),
                          onPressed: () {
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) => HomeTabs(),
                              ),
                            );
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
                      SizedBox(height: SizeConfig.height(7)),
                      FlatButton(
                          padding: EdgeInsets.only(right: 25.0),
                          color: Color(0x00000000),
                          onPressed: () {
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) => HomeTabs(),
                              ),
                            );
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
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) => AttendTabs(),
                              ),
                            );
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
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) => AttendTabs(),
                              ),
                            );
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
                    ]))));
  }
}
