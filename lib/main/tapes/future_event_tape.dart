import 'package:flutter/material.dart';

import 'entities/event_null.dart';

class FutureEventTape extends StatefulWidget {
  @override
  createState() => new FutureEventTapeState();
}

class FutureEventTapeState extends State<FutureEventTape> {
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
