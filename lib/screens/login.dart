
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
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
    r'^(([^<>()[\]\\.,;:\s@\"]+(\.[^<>()[\]\\.,;:\s@\"]+)*)|(\".+\"))@((\[[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\])|(([a-zA-Z\-0-9]+\.)+[a-zA-Z]{2,}))$';

RegExp regExp = RegExp(p);

bool obserText = true;

class _LoginState extends State<Login> {

String email = "";
String password = "";

Future<void> validation() async {
  final FormState? form = _formKey.currentState;
  

  if (!form!.validate()) {
    try {
      AuthCredential credential = EmailAuthProvider.credential(email: email, password: password);
      UserCredential userCredential = await FirebaseAuth.instance.signInWithCredential(credential);
      print(userCredential.user!.uid);
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text("Login successful")),
      );
    } on FirebaseAuthException catch (e) {
      String errorMessage = "Invalid credentials. Please check your email and password.";
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text(errorMessage)),
      );
      print(e.message);
    }
  } else {
    print("Form is valid");
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
                  child:  Column(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      const Text("Login",
                      style: TextStyle(
                        fontSize: 50,
                        fontWeight: FontWeight.bold
                      ),
                      ),
                      MyTextFormField(
                         name: "Email",
                         onChanged: (value){
                            setState(() {
                              email = value!;
                            });
                           },
                         validator: (value) {
                          if (value == null) {
                            return "Please enter a Email";
                          } else if (!regExp.hasMatch(value)) {
                            return "Email is Invalid";
                          }
                          return ""; 
                        },
                         ),
                         PasswordTextFormField(
                           onTap: (){
                                setState(() {
                                  obserText = !obserText;
                                });
                                FocusScope.of(context).unfocus();
                              },
                           name: "Password", 
                           onChanged: (value){
                            setState(() {
                              password = value!;
                            });
                           },
                           obserText: obserText,
                           validator:(value) {
                          if (value == null) {
                            return "Please enter Password";
                          } else if (value.length < 8) {
                            return "Password too short";
                          }
                          return ""; 
                        },
                           ),
                        MyButton(
                          name: "Login",
                         onPressed: (){
                            validation();
                         }),
                         ChangeScreen(
                          name:"SignUp",
                          whichAccount: "I Have No Account!",
                          onTap: (){
                            Navigator.of(context).pushReplacement
                            (MaterialPageRoute(builder: 
                            (ctx)=>const SignUp(),
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

