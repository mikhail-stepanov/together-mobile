import 'package:flutter/material.dart';
import 'package:together_mobile/main/event_future_open.dart';
import 'package:together_mobile/util/size_config.dart';

class EventOther extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return new GestureDetector(
        onTap: () {
          Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => EventFutureOpen(),
            ),
          );
        },
        child: Container(
            margin: EdgeInsets.only(left: 5.0, right: 5.0, top: 5.0),
            height: SizeConfig.height(60.0),
            width: SizeConfig.width(40.0),
            decoration: BoxDecoration(
              image: DecorationImage(
                image: new NetworkImage(
                    "https://raw.githubusercontent.com/mikhail-stepanov/together/master/assets/images/together_preview_2.png"),
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
                      padding: EdgeInsets.only(left: 10.0, top: 70.0),
                      child: Row(
                        children: [
                          new Text(
                            'TOGETHER NY',
                            style: TextStyle(
                                fontSize: SizeConfig.height(1.8),
                                color: Colors.white),
                          ),
                        ],
                      ),
                    ),
                    new SizedBox(height: SizeConfig.height(2.0)),
                    Container(
                      padding: EdgeInsets.only(left: 10.0),
                      child: Row(
                        children: [
                          new Image.asset('assets/images/icon_location.png'),
                          new SizedBox(width: SizeConfig.width(1.5)),
                          new Container(
                            padding: EdgeInsets.only(right: 15.0),
                            width: SizeConfig.width(30.0),
                            child: Text(
                              'Ресторан Центрального Дома Литераторов',
                              style: TextStyle(
                                  fontSize: SizeConfig.height(1.5),
                                  color: Colors.white),
                            ),
                          ),
                        ],
                      ),
                    ),
                    new SizedBox(height: SizeConfig.height(1.0)),
                    Container(
                      padding: EdgeInsets.only(left: 10.0),
                      child: Row(
                        children: [
                          new Image.asset('assets/images/icon_time.png'),
                          new SizedBox(width: SizeConfig.width(1.5)),
                          new Text(
                            '01.01.20 01:00-10:00',
                            style: TextStyle(
                                fontSize: SizeConfig.height(1.5),
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
