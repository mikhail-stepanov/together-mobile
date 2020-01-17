import 'package:flutter/material.dart';
import 'package:together_mobile/main/event_future_open.dart';
import 'package:together_mobile/util/size_config.dart';

class Event extends StatelessWidget {
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
            margin: EdgeInsets.only(left: 20.0, right: 20.0, top: 15.0),
            height: SizeConfig.height(47.0),
            decoration: BoxDecoration(
              image: DecorationImage(
                image: new NetworkImage(
                    "https://raw.githubusercontent.com/mikhail-stepanov/together-mobile/master/assets/images/together_preview.png"),
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
                            'TOGETHER NEW YEAR (21+)',
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
                          new Image.asset('assets/images/icon_location.png'),
                          new SizedBox(width: SizeConfig.width(2)),
                          Container(
                            padding: EdgeInsets.only(right: 15.0),
                            width: SizeConfig.width(80.0),
                            child: Text(
                              'Ресторан Центрального Дома Литераторов. Москва ул. Поварская 50/53 стр. 1',
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
                          new Image.asset('assets/images/icon_time.png'),
                          new SizedBox(width: SizeConfig.width(2)),
                          new Text(
                            '01.01.20 01:00-10:00',
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
