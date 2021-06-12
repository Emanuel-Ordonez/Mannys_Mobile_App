import 'dart:ui';

import 'package:flutter/foundation.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:mannys_app/login/common/commonComponents.dart';
import 'package:mannys_app/login/forgotIDPassword.dart';

import '../navigation/navigation.dart';
import 'signUp.dart';

class LoginPage extends StatefulWidget {
  LoginPage({Key? key, required this.title}) : super(key: key);

  // This widget is the home page of your application. It is stateful, meaning
  // that it has a State object (defined below) that contains fields that affect
  // how it looks.

  // This class is the configuration for the state. It holds the values (in this
  // case the title) provided by the parent (in this case the App widget) and
  // used by the build method of the State. Fields in a Widget subclass are
  // always marked "final".

  final String title;

  @override
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  @override
  Widget build(BuildContext context) {
    // This method is rerun every time setState is called, for instance as done
    // by the _incrementCounter method above.
    //
    // The Flutter framework has been optimized to make rerunning build methods
    // fast, so that you can just rebuild anything that needs updating rather
    // than having to individually change instances of widgets.
    return Scaffold(
      body: Center(
          child: Stack(
        children: [
          Align(
            alignment: Alignment(0, 0),
            child: background(),
          ),
          Align(
            alignment: Alignment(0, 0),
            child: loginContainer(),
          ),
        ],
      )),
    );
  }

  Widget background() {
    return Container(
      width: MediaQuery.of(context).size.width * 1,
      color: Color.fromARGB(125, 100, 150, 100),
    );
  }

  Widget loginContainer() {
    return Container(
      width: MediaQuery.of(context).size.width * .8,
      decoration: BoxDecoration(
        border: Border.all(
          color: Colors.black,
        ),
        color: Color.fromARGB(170, 250, 250, 250),
        borderRadius: BorderRadius.circular(10),
      ),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          label(),
          usernameInput(),
          passwordInput(),
          loginButton(),
          bottomLinks(),
        ],
      ),
    );
  }

  Widget label() {
    return topLabel("Manny's App");
  }

  Widget usernameInput() {
    return textField('Username');
  }

  Widget passwordInput() {
    return textField('Password');
  }

  Widget loginButton() {
    return Padding(
        padding: const EdgeInsets.all(10.0),
        child: Container(
          padding: const EdgeInsets.fromLTRB(8, 0, 8, 0),
          height: 40,
          decoration: BoxDecoration(
            border: Border.all(
              color: Colors.black,
            ),
            color: Colors.blueAccent,
            borderRadius: BorderRadius.circular(25),
          ),
          child: TextButton(
            onPressed: () => login(),
            child: Text(
              'Login',
              style: TextStyle(color: Colors.white),
            ),
          ),
        ));
  }

  Widget bottomLinks() {
    return Padding(
      padding: const EdgeInsets.all(10.0),
      child: Center(
        child: Row(children: [
          Expanded(
            flex: 3,
            child: Center(
              child: RichText(
                text: TextSpan(
                    text: 'Forgot ID/Password?',
                    style: TextStyle(color: Colors.blueAccent),
                    recognizer: TapGestureRecognizer()
                      ..onTap = () {
                        goToForgotIDPassword();
                      }),
              ),
            ),
          ),
          Expanded(
            flex: 2,
            child: Center(
              child: RichText(
                text: TextSpan(
                    text: 'Sign up',
                    style: TextStyle(color: Colors.blueAccent),
                    recognizer: TapGestureRecognizer()
                      ..onTap = () {
                        goToSignUp();
                      }),
              ),
            ),
          ),
        ]),
      ),
    );
  }

  void login() {
    Navigator.push(
        context,
        MaterialPageRoute(
            builder: (context) => NavigationPage(title: 'Navigation Page')));
  }

  void goToSignUp() {
    Navigator.push(
        context,
        MaterialPageRoute(
            builder: (context) => SignUpPage(title: 'Sign Up Page')));
  }

  void goToForgotIDPassword() {
    Navigator.push(
        context,
        MaterialPageRoute(
            builder: (context) =>
                ForgotIDPasswordPage(title: 'Forgot ID/Password Page')));
  }
}
