import 'package:flutter/material.dart';
import 'package:together_mobile/main/tapes/models/event_future_card.dart';
import 'package:together_mobile/main/tapes/models/event_null.dart';
import 'package:together_mobile/main/tapes/models/event_past_card.dart';
import 'package:together_mobile/util/globals.dart';
import 'package:together_mobile/util/refresh_globals_event.dart';

class AttendTape extends StatefulWidget {
  @override
  createState() => new AttendTapeState();
}

class AttendTapeState extends State<AttendTape> {
  @override
  Widget build(BuildContext context) {
    return RefreshIndicator(
      color: Color(0xFF707070),
      backgroundColor: Color(0xFF231F20),
      child: Globals.pastUserEvents == null ||
              Globals.pastUserEvents.isEmpty ||
              Globals.pastUserEvents.length == 0
          ? Scaffold(
              body: Container(
                  color: Color(0xFF231F20),
                  alignment: Alignment.topCenter,
                  child: ListView.builder(
                    itemCount: 1,
                    itemBuilder: (context, index) => EventNull(),
                  )),
            )
          : Scaffold(
              body: Container(
                  color: Color(0xFF231F20),
                  alignment: Alignment.topCenter,
                  child: ListView.builder(
                    itemCount: Globals.pastUserEvents.length,
                    itemBuilder: (context, index) =>
                        PastEvent(Globals.pastUserEvents[index]),
                  )),
            ),
      onRefresh: () => _refreshState(),
    );
  }

  Future<void> _refreshState() async {
    RefreshEvents.refresh();
    setState(() {
      this.reassemble();
    });
  }
}
