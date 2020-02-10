import 'package:flutter/material.dart';
import 'package:together_mobile/login/password_screen.dart';
import 'package:together_mobile/login/set_password_screen.dart';
import 'package:together_mobile/main/attend_tabs.dart';
import 'package:together_mobile/main/event_future_open.dart';
import 'package:together_mobile/main/home_tabs.dart';

import 'login/login_screen.dart';
import 'login/signup_screen.dart';

void main() => runApp(new MaterialApp(
        theme: ThemeData(fontFamily: 'Futura'),
        debugShowCheckedModeBanner: false,
        initialRoute: '/login',
        routes: {
          '/home': (BuildContext context) => HomeTabs(),
          '/attend': (BuildContext context) => AttendTabs(),
          '/event': (BuildContext context) => EventFutureOpen(),
          '/signup': (BuildContext context) => SignupScreen(),
          '/login': (BuildContext context) => LoginScreen(),
          '/setpass': (BuildContext context) => SetPasswordScreen(),
          '/password': (BuildContext context) => PasswordScreen(),
        }));
