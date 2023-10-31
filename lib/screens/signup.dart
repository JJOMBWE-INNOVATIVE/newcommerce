

import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:newcommerce/screens/login.dart';
import 'package:newcommerce/widgets/changescreen.dart';
import 'package:newcommerce/widgets/mybutton.dart';
import 'package:newcommerce/widgets/mytextformField.dart';
import 'package:newcommerce/widgets/passwordtextformfield.dart';



class SignUp extends StatefulWidget {
  const SignUp({super.key});

  @override
  State<SignUp> createState() => _SignUpState();
}
final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();

String p =
    r'^(([^<>()[\]\\.,;:\s@\"]+(\.[^<>()[\]\\.,;:\s@\"]+)*)|(\".+\"))@((\[[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\])|(([a-zA-Z\-0-9]+\.)+[a-zA-Z]{2,}))$';

RegExp regExp = RegExp(p);
bool observeText = true;

String email = "";
String password = "";

class _SignUpState extends State<SignUp> {
  


Future<void> validation() async {
  final FormState? form = _formKey.currentState;
  if (!form!.validate()) {
    try {
      UserCredential userCredential = await FirebaseAuth.instance
          .createUserWithEmailAndPassword(email: email, password: password);
      print(userCredential.user!.uid);
    } on FirebaseAuthException catch (e) {
      ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text(e.message?? ''),),);
      print(e.message);
    }
  } else {
    print("Form is valid"); // Display a success message here
  }
}



Widget _buildAllTextFormField(){
  return SizedBox(
    height: 330,
    child: Column(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            MyTextFormField(
                        name: "UserName", 
                        validator: (value) {
                        if (value == null) {
                          return "Please enter a username";
                        } else if (value.length < 6) {
                          return "Username is too short";
                        }
                        return ""; 
                      },
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
                             MyTextFormField(
                              name: "Phone Number",
                               validator:(value) {
                        if (value == null) {
                          return "Please enter Phone Number";
                        } else if (value.length < 10) {
                          return "Phone number must be 10 digits";
                        }
                        return ""; 
                      },
                      ),
          ],
    ),
  );
}
// Bottom parts
  @override
  Widget build(BuildContext context) {
    return  Scaffold(
      key: _scaffoldKey,
      resizeToAvoidBottomInset: false,
      body: Form(
        key: _formKey,
        child: SafeArea(
          child: Column(
            children: [
              SizedBox(
                height: 220,
                width: MediaQuery.sizeOf(context).width,
                child: const Column(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    Text("Register",style: TextStyle(
                      fontSize: 50,
                      fontWeight: FontWeight.bold,
                    ),
                    ),
                  ],
                ),
              ),
             const SizedBox(height: 20,),
              Container(
                margin: const EdgeInsets.symmetric(horizontal: 10),
                height: 400,
                width: MediaQuery.sizeOf(context).width,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                   _buildAllTextFormField(),
                    MyButton(
                          name: "SignUp",
                         onPressed: (){
                            validation();
                         }),
                         ChangeScreen(
                          name: "Login",
                           onTap: (){
                            Navigator.of(context).pushReplacement
                            (MaterialPageRoute(builder: 
                            (ctx)=>const Login(),
                            ),
                            );
                           }, 
                           whichAccount: "I Have Already An Account!"
                           ),
                ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}