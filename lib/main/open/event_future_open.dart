import 'package:flutter/material.dart';
import 'package:together_mobile/main/tapes/entities/event_json.dart';
import 'package:together_mobile/main/tapes/models/event_future_small_card.dart';
import 'package:together_mobile/main/tapes/models/event_null.dart';
import 'package:together_mobile/profile/profile_drawer.dart';
import 'package:together_mobile/util/globals.dart';
import 'package:together_mobile/util/size_config.dart';
import 'package:together_mobile/util/video_player.dart';
import 'package:url_launcher/url_launcher.dart';

class EventFutureOpen extends StatefulWidget {
  final EventJson eventJson;

  const EventFutureOpen({Key key, this.eventJson}) : super(key: key);

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
                  height: SizeConfig.height(5), width: SizeConfig.width(5)),
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
                  height: SizeConfig.height(46),
                  child: VideoPlayerScreen(videoUrl: widget.eventJson.video),
                ),
                Container(
                  padding: EdgeInsets.only(left: 15.0, top: 15.0),
                  child: Row(
                    children: [
                      new Text(
                        widget.eventJson.title,
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
                          widget.eventJson.place,
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
                        widget.eventJson.date,
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
                    widget.eventJson.description,
                    style: TextStyle(
                        fontSize: SizeConfig.height(2.2), color: Colors.white),
                  ),
                ),
                new SizedBox(height: SizeConfig.height(4.0)),
                Container(
                  padding: EdgeInsets.only(left: 20.0),
                  child: ButtonTheme(
                    minWidth: SizeConfig.width(90.0),
                    height: SizeConfig.height(7.0),
                    child: RaisedButton(
                      onPressed: () {
                        launch(widget.eventJson.ticketcloud);
                      },
                      child: Text(
                        'Купить билет',
                        style: TextStyle(
                          fontSize: SizeConfig.height(3),
                        ),
                      ),
                      color: Color(0xFF707070),
                      textColor: Colors.white,
                    ),
                  ),
                ),
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
                  child: Globals.futureEvents == null ||
                          Globals.futureEvents.isEmpty ||
                          Globals.futureEvents.length == 0
                      ? Scaffold(
                          body: Container(
                              color: Color(0xFF231F20),
                              alignment: Alignment.topCenter,
                              child: ListView.builder(
                                shrinkWrap: true,
                                scrollDirection: Axis.horizontal,
                                itemCount: 1,
                                itemBuilder: (context, index) => EventNull(),
                              )),
                        )
                      : Scaffold(
                          body: Container(
                              color: Color(0xFF231F20),
                              alignment: Alignment.topCenter,
                              child: ListView.builder(
                                shrinkWrap: true,
                                scrollDirection: Axis.horizontal,
                                itemCount: Globals.futureEvents.length,
                                itemBuilder: (context, index) =>
                                    FutureEventSmall(
                                        Globals.futureEvents[index]),
                              )),
                        ),
                ),
                new SizedBox(height: SizeConfig.height(2.0)),
              ],
            )))),
        drawer: ProfileDrawer());
  }
}
