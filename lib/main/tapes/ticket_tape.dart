import 'package:flutter/material.dart';
import 'package:together_mobile/main/tapes/models/event_future_card.dart';
import 'package:together_mobile/util/globals.dart';
import 'package:together_mobile/util/refresh_globals_event.dart';

import 'models/event_null.dart';

class TicketTape extends StatefulWidget {
  @override
  createState() => new TicketTapeState();
}

class TicketTapeState extends State<TicketTape> {
  @override
  Widget build(BuildContext context) {
    return RefreshIndicator(
      color: Color(0xFF707070),
      backgroundColor: Color(0xFF231F20),
      child: Globals.futureUserEvents == null ||
              Globals.futureUserEvents.isEmpty ||
              Globals.futureUserEvents.length == 0
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
                    itemCount: Globals.futureUserEvents.length,
                    itemBuilder: (context, index) =>
                        FutureEvent(Globals.futureUserEvents[index]),
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
