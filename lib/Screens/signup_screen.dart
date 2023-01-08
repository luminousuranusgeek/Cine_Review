import 'package:example/Screens/home_screen.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import '../Reusable _widgets/reusable_widget.dart';
class SignUpScreen extends StatefulWidget {
  const SignUpScreen({Key? key}) : super(key: key);

  @override
  State<SignUpScreen> createState() => _SignUpScreenState();
}

class _SignUpScreenState extends State<SignUpScreen> {
  final TextEditingController _passwordTextController = TextEditingController();
  final TextEditingController _emailTextController = TextEditingController();
  final TextEditingController _userNameTextController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Sign Up'),
        backgroundColor: Colors.transparent,
        elevation: 0,
      ),
      backgroundColor: Colors.blue[500],
      body: Center(
        child: Container(
          padding: EdgeInsets.fromLTRB(0, 260, 0, 0),
          height: double.infinity,
          width: double.infinity,
          decoration: BoxDecoration(
              gradient: LinearGradient(
                begin: Alignment.topCenter,
                  end: Alignment.bottomCenter,
                  colors: [Color(0xFF2196F3), Color(0xFFBBDEFB)],
              )
          ),
          child: SingleChildScrollView(
            child: Padding(
              padding: EdgeInsets.all(10),
              child: Column(
                children: <Widget>[
                  reusableTextField('Enter UserName', Icons.person_outline, false, _userNameTextController),
                  const SizedBox(height: 20,),
                  reusableTextField('Enter Email Id', Icons.person_outline, false, _emailTextController),
                  const SizedBox(height: 20,),
                  reusableTextField('Enter Password', Icons.lock_outline, true, _passwordTextController),
                  const SizedBox(height: 20,),
                  signInSignUpButton(context, false, () {
    FirebaseAuth.instance
        .createUserWithEmailAndPassword(email: _emailTextController.text, password: _passwordTextController.text).then((value) {
          print('Created New Account');
    Navigator.push(context,
    MaterialPageRoute(builder: (context)=> SignUpScreen()));
    }).onError((error, stackTrace) {
    print("Error ${error.toString()}");
    });
                  })
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
