import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Group 11 log In page for Abbey Foods',
      theme: ThemeData(
        primarySwatch: Colors.orange,
      ),
      home: const MyHomePage(title: 'Abbey Foods Log In Page'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({Key? key, required this.title}) : super(key: key);

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.orange, //failsafe in case the background image is broken

      body: Stack(
        children: [
          Container(
            decoration: const BoxDecoration(
              image: DecorationImage(
                  image: AssetImage("assets/bg.jpg"), fit: BoxFit.cover), //background image
            ),
          ),
          Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                Image.asset('assets/logo.png'), //logo
                const LoginDetails(), //the widget that contains the whole login in or sign up details
              ],
            ),
          )
        ],
      ), 
    );
  }
}

class LoginDetails extends StatelessWidget {
  const LoginDetails({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(20),
      margin: const EdgeInsets.all(10),
      height: 500,
      width: 330,
      decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: const BorderRadius.all(Radius.circular(20)),
          boxShadow: [
            BoxShadow(
              color: Colors.grey.withOpacity(0.5),
              spreadRadius: 5,
              blurRadius: 7,
              offset: const Offset(0, 3),
            )
          ]),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: const [
          SignUpBar(), //login and sign up buttons
          EmailBar(), //the text fields for email and password
          LogInButton(), //the big login button 
          ContinueDivider(), //the divider that contains 'or continue with'
          SocialIcons(), //the social media icons

          SizedBox(
           height: 40,
         )

          //textfields
        ],
      ),
    );
  }
}

class SocialIcons extends StatelessWidget {
  const SocialIcons({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        IconButton(
          padding: const EdgeInsets.all(15),
            color: Colors.blueAccent,
            icon: const FaIcon(FontAwesomeIcons.facebook), //facebook icon
            iconSize: 30,
            onPressed: () {}),
        IconButton(
          padding: const EdgeInsets.all(15),
            color: Colors.blueAccent,
            icon: const FaIcon(FontAwesomeIcons.twitter), //twitter icon
            iconSize: 30,
            onPressed: () {}),
        IconButton(
          padding: const EdgeInsets.all(15),
            color: Colors.orange,
            icon: const FaIcon(FontAwesomeIcons.google), //google icon
            iconSize: 30,
            onPressed: () {}),
      ],
    );
  }
}

class ContinueDivider extends StatelessWidget {
  const ContinueDivider({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
        margin: const EdgeInsets.only(left: 10.0, right: 15.0),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: const [
            Expanded(
                child: Divider(
              color: Colors.grey,
              thickness: 1,
            )),
            Text('or continue with'),
            Expanded(
                child: Divider(
              color: Colors.grey,
              thickness: 1,
            ))
          ],
        ));
  }
}

class LogInButton extends StatelessWidget {
  const LogInButton({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return TextButton(
      style: ButtonStyle(
        padding:
            MaterialStateProperty.all(const EdgeInsets.fromLTRB(80, 2, 80, 2)),
        shape: MaterialStateProperty.all<RoundedRectangleBorder>(
            RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(25.0),
                side: const BorderSide(color: Colors.orange))),
        backgroundColor: MaterialStateProperty.all(Colors.orange),
        foregroundColor: MaterialStateProperty.all<Color>(Colors.white),
      ),
      onPressed: () {},
      child: const Text('Log In', style: TextStyle(fontSize: 18),),
    );
  }
}

class EmailBar extends StatelessWidget {
  const EmailBar({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.end,
      children: const [
        TextField(
          decoration: InputDecoration(hintText: 'Enter email or username'),
        ),
        TextField(
          decoration: InputDecoration(hintText: 'Password'),
          obscureText: true,
          enableSuggestions: false,
          autocorrect: false,
        ),
        Text(
          'Forgot Password?',
          style: TextStyle(color: Colors.orange),
        )
      ],
    );
  }
}

class SignUpBar extends StatelessWidget {
  const SignUpBar({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.all(10),
      decoration: BoxDecoration(
          border: Border.all(color: Colors.grey),
          borderRadius: BorderRadius.circular(25)),
      height: 40,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          TextButton(
            style: ButtonStyle(
              padding: MaterialStateProperty.all(
                  const EdgeInsets.fromLTRB(40, 1, 40, 1)),
              shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                  RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(25.0),
                      side: const BorderSide(color: Colors.orange))),
              backgroundColor: MaterialStateProperty.all(Colors.orange),
              foregroundColor: MaterialStateProperty.all<Color>(Colors.white),
            ),
            onPressed: () {},
            child: const Text('Log In'),
          ),
          TextButton(
            style: ButtonStyle(
              padding: MaterialStateProperty.all(
                  const EdgeInsets.fromLTRB(40, 1, 40, 1)),
              foregroundColor: MaterialStateProperty.all<Color>(Colors.orange),
            ),
            onPressed: () {},
            child: const Text('Sign Up'),
          )
        ],
      ),
    );
  }
}
