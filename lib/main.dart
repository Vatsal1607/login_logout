import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:learn_flutter/login_page.dart';
import 'package:learn_flutter/pages/home_page.dart';
import 'package:learn_flutter/pages/home_page_fb.dart';
import 'package:learn_flutter/pages/home_page_sb.dart';
import 'package:learn_flutter/pages/login_page.dart';
import 'package:learn_flutter/utils/constants.dart';
import 'package:shared_preferences/shared_preferences.dart';

Future main() async {

  WidgetsFlutterBinding.ensureInitialized();
  Constants.prefs = await SharedPreferences.getInstance();

  runApp(
    MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Awesome app',
      // home: Constants.prefs.getBool("loggedIn") == true
      //     ? HomePage()
      //     : LoginPage(),
      home: Constants.prefs.getBool('loggedIn') == true ? HomePageSB() : LoginPageX(),
      theme: ThemeData(primarySwatch: Colors.brown),
      routes: {
        LoginPageX.id: (context) => LoginPageX(),
        HomePage.id: (context) => HomePage(),
      },
      // routes: {
      //   "/login": (context) => LoginPage(),
      //   "/home": (context) => HomePage()
      // },
    ),
  );
}
