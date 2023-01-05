import 'package:example/Reusable _widgets/reusable_widget.dart';
import 'package:example/Screens/home_screen.dart';
import 'package:example/Screens/signup_screen.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
class SignInScreen extends StatefulWidget {
  const SignInScreen({Key? key}) : super(key: key);

  @override
  State<SignInScreen> createState() => _SignInScreenState();
}

class _SignInScreenState extends State<SignInScreen> {
  TextEditingController _passwordTextController = TextEditingController();
  TextEditingController _emailTextController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      //backgroundColor: Colors.purple,
      body: Center(
        child: Container(
          padding: EdgeInsets.fromLTRB(0, 260, 0, 0),
          height: double.infinity,
          width: double.infinity,
          decoration: BoxDecoration(
              gradient: LinearGradient(
                  begin: Alignment.topCenter,
                  end: Alignment.bottomCenter,
                  colors: [Color(0xDD000000), Color(0xFF616161)]
              )
          ),
          child: SingleChildScrollView(
            child: Padding(
              padding: EdgeInsets.all(10),
              child: Column(
                children: <Widget>[
                  reusableTextField('Enter Email', Icons.person_outline, false, _emailTextController),
                  const SizedBox(height: 20,),
                  reusableTextField('Enter Password', Icons.lock_outline, true, _passwordTextController),
                  const SizedBox(height: 20,),

                  signInSignUpButton(context, true, (){
                    FirebaseAuth.instance.signInWithEmailAndPassword(email: _emailTextController.text, password: _passwordTextController.text).then((value) {
                      Navigator.push(context,
                          MaterialPageRoute(builder: (context)=> HomeScreen()));
                    }).onError((error, stackTrace) {
                      print("Error ${error.toString()}");
                    });

                  }),
                  signUpOption()
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }

Row signUpOption(){
  return Row(
    mainAxisAlignment: MainAxisAlignment.center,
    children: [
      Text("Don't have account?",
      style: TextStyle(color: Colors.white)),
      GestureDetector(
          onTap: () {
            Navigator.push(context,
            MaterialPageRoute(builder: (context)=> SignUpScreen()));
          },
        child:  Text(
          "Sign Up",
          style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold),
        ),
      )

    ],
  );
}
}