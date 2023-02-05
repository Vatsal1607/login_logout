import 'package:flutter/material.dart';
import 'package:learn_flutter/widgets/BgImage.dart';
import 'package:learn_flutter/pages/home_page.dart';
import 'package:learn_flutter/utils/constants.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({Key? key}) : super(key: key);

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {

  final userNameController = TextEditingController();
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
                                  decoration: const InputDecoration(
                                      hintText: "Enter Username",
                                      labelText: "Username"
                                  ),
                                ),

                                SizedBox(height: 20,),

                                TextFormField(
                                  obscureText: true,
                                  decoration: const InputDecoration(
                                      hintText: "Enter Password",
                                      labelText: "Password"
                                  ),
                                )
                              ],
                            ),
                          )
                      ),

                      const SizedBox(height: 20,),

                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: ElevatedButton(
                            onPressed: (){
                              // Navigator.push(
                              //     context, MaterialPageRoute(
                              //       builder: (context) => HomePage()
                              //   )
                              // );

                              Constants.prefs.setBool("loggedIn", true);
                              Navigator.pushReplacementNamed(context, "/home");
                            },
                            child: const Text('Sign In')),
                      )
                    ],
                  ),
                ),
              ),
            ),
          ),
        ],
      )
    );
  }
}
