import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:together_mobile/login/password_screen.dart';
import 'package:together_mobile/login/set_password_screen.dart';
import 'package:together_mobile/main/attend_tabs.dart';
import 'file:///C:/Users/heirl/Documents/Projects/MobileProjects/Together/together_mobile/lib/main/open/event_future_open.dart';
import 'package:together_mobile/main/home_tabs.dart';
import 'package:together_mobile/profile/settings_page.dart';

import 'login/login_screen.dart';
import 'login/signup_screen.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    SystemChrome.setPreferredOrientations([
      DeviceOrientation.portraitUp,
    ]);

    return MaterialApp(
        theme: ThemeData(fontFamily: 'Futura'),
        debugShowCheckedModeBanner: false,
        initialRoute: '/login',
        routes: {
          '/home': (BuildContext context) => HomeTabs(),
          '/settings': (BuildContext context) => SettingsPage(),
          '/attend': (BuildContext context) => AttendTabs(),
          '/event': (BuildContext context) => EventFutureOpen(),
          '/signup': (BuildContext context) => SignupScreen(),
          '/login': (BuildContext context) => LoginScreen(),
          '/setpass': (BuildContext context) => SetPasswordScreen(),
          '/password': (BuildContext context) => PasswordScreen(),
        });
  }
}
