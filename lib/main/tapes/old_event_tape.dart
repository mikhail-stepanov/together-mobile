import 'package:flutter/material.dart';
import 'package:together_mobile/main/tapes/entities/event.dart';
import 'package:together_mobile/main/tapes/entities/event_null.dart';

class OldEventTape extends StatefulWidget {
  @override
  createState() => new OldEventTapeState();
}

class OldEventTapeState extends State<OldEventTape> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
          color: Color(0xFF231F20),
          alignment: Alignment.topCenter,
          child: ListView.builder(
            itemCount: 1,
            itemBuilder: (context, index) => EventNull(),
          )),
    );
  }
}
