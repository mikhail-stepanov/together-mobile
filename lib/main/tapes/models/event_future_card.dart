import 'package:flutter/material.dart';
import 'file:///C:/Users/heirl/Documents/Projects/MobileProjects/Together/together_mobile/lib/main/open/event_future_open.dart';
import 'package:together_mobile/main/tapes/entities/event_json.dart';
import 'package:together_mobile/util/size_config.dart';

class FutureEvent extends StatelessWidget {
  final EventJson eventJson;

  const FutureEvent(this.eventJson);

  @override
  Widget build(BuildContext context) {
    return new GestureDetector(
        onTap: () {
          Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => EventFutureOpen(eventJson: eventJson),
            ),
          );
        },
        child: Container(
            margin: EdgeInsets.only(left: 20.0, right: 20.0, top: 15.0),
            height: SizeConfig.height(47.0),
            decoration: BoxDecoration(
              image: DecorationImage(
                image: new NetworkImage(eventJson.picBig),
                fit: BoxFit.fill,
              ),
            ),
            child: Row(
              children: <Widget>[
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Container(
                      padding: EdgeInsets.only(left: 15.0, top: 180.0),
                      child: Row(
                        children: [
                          new Text(
                            eventJson.title,
                            style: TextStyle(
                                fontSize: SizeConfig.height(2.7),
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
                          new SizedBox(width: SizeConfig.width(2)),
                          Container(
                            padding: EdgeInsets.only(right: 15.0),
                            width: SizeConfig.width(80.0),
                            child: Text(
                              eventJson.place,
                              style: TextStyle(
                                  fontSize: SizeConfig.height(2.2),
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
                          new SizedBox(width: SizeConfig.width(2)),
                          new Text(
                            eventJson.date,
                            style: TextStyle(
                                fontSize: SizeConfig.height(2.2),
                                color: Colors.white),
                          ),
                        ],
                      ),
                    ),
                  ],
                )
              ],
            )));
  }
}
