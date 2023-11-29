import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:newcommerce/screens/homepage.dart';
import 'package:newcommerce/screens/signup.dart';
import 'package:newcommerce/widgets/changescreen.dart';
import 'package:newcommerce/widgets/mybutton.dart';
import 'package:newcommerce/widgets/mytextformField.dart';
import 'package:newcommerce/widgets/passwordtextformfield.dart';

class Login extends StatefulWidget {
  const Login({super.key});

  @override
  State<Login> createState() => _LoginState();
}

final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();
String p =
    r'^(([^<>()[\]\\.,;:\s@\"]+(\.[^<>()[\]\\.,;:\s@\"]+)*)|(\".+\"))@((\[[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\])|(([a-zA-Z\-0-9]+\.)+[a-zAZ]{2,}))$';

RegExp regExp = RegExp(p);

bool obserText = true;

class _LoginState extends State<Login> {
  TextEditingController email = TextEditingController();
  TextEditingController password = TextEditingController();

Future<void> validation() async {
  final FormState? form = _formKey.currentState;

  if (!form!.validate()) {
  } else if (email.text.isEmpty || password.text.isEmpty) {
    ScaffoldMessenger.of(context).showSnackBar(
      const SnackBar(content: Text("All fields are empty")),
    );
  } else if (email.text.isEmpty) {
    ScaffoldMessenger.of(context).showSnackBar(
      const SnackBar(content: Text("Email is Empty")),
    );
  } else if (password.text.isEmpty) {
    ScaffoldMessenger.of(context).showSnackBar(
      const SnackBar(content: Text("Password is Empty")));
    } else if (password.text.length < 8) {
    ScaffoldMessenger.of(context).showSnackBar(
      const SnackBar(content: Text("Invalid password")));
    } else if (!regExp.hasMatch(email.text)) {
    ScaffoldMessenger.of(context).showSnackBar(
      const SnackBar(content: Text("Invalid Email")));
    } else {
    try {
      AuthCredential credential = EmailAuthProvider.credential(email: email.text, password: password.text);
      UserCredential userCredential = await FirebaseAuth.instance.signInWithCredential(credential);
      print(userCredential.user!.uid);
      Navigator.pushReplacement(
        context,
        MaterialPageRoute(builder: (context) => HomePage()));
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text("Login successful")),
      );
    } on FirebaseAuthException catch (e) {
      String errorMessage = "";

      if (e.code == 'wrong-password') {
        errorMessage = "Invalid password. Please check your password.";
      } else if (e.code == 'user-not-found') {
        errorMessage = "Invalid email. User not found.";
      } else {
        errorMessage = "An unexpected error occurred. Please try again later.";
      }

      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text(errorMessage)),
      );
      print(e.toString());
    }
  }
}



  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: _scaffoldKey,
      resizeToAvoidBottomInset: false,
      body: Container(
        margin: const EdgeInsets.symmetric(horizontal: 10),
        child: Form(
          key: _formKey,
          child: SafeArea(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                SizedBox(
                  height: 400,
                  width: double.infinity,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      const Text(
                        "Login",
                        style: TextStyle(
                          fontSize: 50,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      MyTextFormField(
                        name: "Email",
                        controller: email,
                      ),
                      PasswordTextFormField(
                        onTap: () {
                          setState(() {
                            obserText = !obserText;
                          });
                          FocusScope.of(context).unfocus();
                        },
                        name: "Password",
                        obserText: obserText,
                        controller: password,
                      ),
                      MyButton(
                        name: "Login",
                        onPressed: () {
                          validation();
                        },
                      ),
                      ChangeScreen(
                        name: "SignUp",
                        whichAccount: "I Have No Account!",
                        onTap: () {
                          Navigator.of(context).pushReplacement(
                            MaterialPageRoute(
                              builder: (ctx) => const SignUp(),
                            ),
                          );
                        },
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
