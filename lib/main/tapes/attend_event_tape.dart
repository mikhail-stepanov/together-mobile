import 'package:flutter/material.dart';
import 'package:together_mobile/main/tapes/entities/event_null.dart';

class AttendEventTape extends StatefulWidget {
  @override
  createState() => new AttendEventTapeState();
}

class AttendEventTapeState extends State<AttendEventTape> {
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
