import 'package:flutter/material.dart';
import 'package:learn_flutter/widgets/BgImage.dart';
import 'package:learn_flutter/pages/home_page.dart';
import 'package:learn_flutter/utils/constants.dart';

class LoginPageX extends StatefulWidget {

  static const String id = '/loginx';
  @override
  State<LoginPageX> createState() => _LoginPageXState();
}
class _LoginPageXState extends State<LoginPageX> {

  final usernameController = TextEditingController();
  final passwordController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text('Login Page'),
          centerTitle: true,
        ),
        body: Stack(
          fit: StackFit.expand,
          children: [
            BgImage(),
            Center(
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: SingleChildScrollView(
                  child: Card(
                    child: Column(
                      children: [
                        Form(
                          child: Padding(
                            padding: const EdgeInsets.all(16.0),
                            child: Column(
                              children: [
                                TextFormField(
                                  decoration: InputDecoration(
                                    hintText: 'Enter Username',
                                    labelText: 'Username',
                                  ),
                                ),
                                SizedBox(
                                  height: 10,
                                ),
                                TextFormField(
                                  obscureText: true,
                                  decoration: InputDecoration(
                                    hintText: 'Enter Password',
                                    labelText: 'Password',
                                  ),
                                ),
                                SizedBox(
                                  height: 15.0,
                                ),
                                ElevatedButton(
                                  onPressed: () {
                                    Constants.prefs.setBool('loggedIn', true);
                                    Navigator.pushReplacementNamed(context, HomePage.id);
                                  },
                                  child: Text('Sign In'),
                                ),
                              ],
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            ),
          ],
        ));
  }
}
