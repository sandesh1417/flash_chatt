import 'package:flutter/material.dart';
import 'package:flash_chat/components/rounded_button.dart';
import 'package:flash_chat/constants.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'chat_screen.dart';
 
class LoginScreen extends StatefulWidget {
  static String id = 'login_screen';
  String email;
  String password;
  @override
  _LoginScreenState createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final _auth= FirebaseAuth.instance;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: 24.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: <Widget>[
            Container(
              height: 200.0,
              child: Image.asset('images/logo.png'),
            ),
            SizedBox(
              height: 48.0,
            ),
            TextField(
              onChanged: (value) {
                email=value;
                //Do something with the user input.
              },
              decoration:kTextFieldDecoration.copyWith(hintText: '0enterrrr eamil'),
            ),
            SizedBox(
              height: 8.0,
            ),
            TextField(
              obscureText: true,
              onChanged: (value) {
                password = value;
                final user =_auth.signInWithEmailAndPassword(email: email, password: password);
                  if(user !=null){
                    Navigator.pushNamed(context, ChatScreen.id)
                  }
                //Do something with the user input.
              },
              catch(e){
                print(e);
              }
              decoration: kTextFieldDecoration.copyWith(hintText: 'enterrrr passs
              '),
            ),
            SizedBox(
              height: 24.0,
            ),
            RoundedButton(onPressed:(){},title: 'login', colour: Colors.blueAccent, ),
          ],
        ),
      ),
    );
  }
}
