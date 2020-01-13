import 'package:flutter/material.dart';
import 'package:together_mobile/main/tapes/entities/event.dart';

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
            itemBuilder: (context, index) => Event(),
          )),
    );
  }
}
