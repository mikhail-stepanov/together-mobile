import 'dart:convert';

import 'package:together_mobile/main/tapes/entities/event_json.dart';
import 'package:together_mobile/util/globals.dart';
import 'package:http/http.dart' as http;

class RefreshEvents {
  static Future<void> refresh() async {
    //future events
    var urlFutureEvent =
        'http://' + Globals.host + ':8080/v1/event/list/future';
    var responseFutureEvent = await http.get(urlFutureEvent, headers: {
      'Content-Type': 'application/json; charset=utf-8',
      'Accept': 'application/json; charset=utf-8'
    });
    var futureEvents = List<EventJson>();
    if (responseFutureEvent.statusCode == 200) {
      var notesJson = json.decode(responseFutureEvent.body);
      for (var noteJson in notesJson) {
        futureEvents.add(EventJson.map(noteJson));
      }
    }
    Globals.futureEvents = futureEvents;

    //past events
    var urlPastEvent = 'http://' + Globals.host + ':8080/v1/event/list/past';
    var responsePastEvent = await http.get(urlPastEvent, headers: {
      'Content-Type': 'application/json; charset=utf-8',
      'Accept': 'application/json; charset=utf-8'
    });
    var pastEvents = List<EventJson>();
    if (responsePastEvent.statusCode == 200) {
      var notesJson = json.decode(responsePastEvent.body);
      for (var noteJson in notesJson) {
        pastEvents.add(EventJson.map(noteJson));
      }
    }
    Globals.pastEvents = pastEvents;

    //user future events
    var urlUserFutureEvent =
        'http://' + Globals.host + ':8080/v1/event/list/future/user';
    var responseUserFutureEvent = await http.post(urlUserFutureEvent,
        headers: {
          'Content-Type': 'application/json; charset=utf-8',
          'Accept': 'application/json; charset=utf-8'
        },
        body: jsonEncode({'userId': Globals.id}));
    var futureUserEvents = List<EventJson>();
    if (responseUserFutureEvent.statusCode == 200) {
      var notesJson = json.decode(responseUserFutureEvent.body);
      for (var noteJson in notesJson) {
        futureUserEvents.add(EventJson.map(noteJson));
      }
    }
    Globals.futureUserEvents = futureUserEvents;

    //user past events
    var urlUserPastEvent =
        'http://' + Globals.host + ':8080/v1/event/list/past/user';
    var responseUserPastEvent = await http.post(urlUserPastEvent,
        headers: {
          'Content-Type': 'application/json; charset=utf-8',
          'Accept': 'application/json; charset=utf-8'
        },
        body: jsonEncode({'userId': Globals.id}));
    var pastUserEvents = List<EventJson>();
    if (responseUserPastEvent.statusCode == 200) {
      var notesJson = json.decode(responseUserPastEvent.body);
      for (var noteJson in notesJson) {
        pastUserEvents.add(EventJson.map(noteJson));
      }
    }
    Globals.pastUserEvents = pastUserEvents;
  }
}
