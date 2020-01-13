import 'package:flutter/material.dart';
import 'package:together_mobile/util/size_config.dart';

class EventNull extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
       return Center(
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            SizedBox(height: SizeConfig.height(20)),
            new Text(
              'Мероприятий нет',
              textAlign: TextAlign.center,
              style: TextStyle(
                  fontSize: SizeConfig.height(3), color: Color(0xFF707070)),
            ),
          ],
        ),
      );
  }
}
