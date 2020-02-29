import 'dart:typed_data';

import 'package:together_mobile/main/tapes/entities/event_json.dart';

class Globals {
  static String firstName;
  static String lastName;
  static int id;
  static String pincode;
  static String password;
  static int user_pic;
  static String facebook;
  static String instagram;
  static String phone;
  static Uint8List user_image;

  static List<EventJson> futureEvents;
  static List<EventJson> pastEvents;
  static List<EventJson> pastUserEvents;
  static List<EventJson> futureUserEvents;

  static String host = '84.201.185.226';
  static String version = "1.0.11";
}
