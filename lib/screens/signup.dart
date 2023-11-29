import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:newcommerce/screens/login.dart';
import 'package:newcommerce/widgets/changescreen.dart';
import 'package:newcommerce/widgets/mybutton.dart';
import 'package:newcommerce/widgets/mytextformField.dart';
import 'package:newcommerce/widgets/passwordtextformfield.dart';

class SignUp extends StatefulWidget {
  const SignUp({super.key, Key});

  @override
  State<SignUp> createState() => _SignUpState();
}

final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();

String p =
r'^(([^<>()[\]\\.,;:\s@\"]+(\.[^<>()[\]\\.,;:\s@\"]+)*)|(\".+\"))@((\[[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\])|(([a-zA-Z\-0-9]+\.)+[a-zA-Z]{2,}))$';

RegExp regExp = RegExp(p);
bool obserText = true;


bool isMale = true;
 TextEditingController email = TextEditingController();
 TextEditingController password = TextEditingController();
 TextEditingController userName = TextEditingController();
TextEditingController phoneNumber = TextEditingController();
TextEditingController userAddress = TextEditingController();


class _SignUpState extends State<SignUp> {


Future<void> validation() async {
  final FormState? form = _formKey.currentState;

  if (!form!.validate()) {
   if (email.text.isEmpty && password.text.isEmpty
      && userName.text.isEmpty && userAddress.text.isEmpty
      && phoneNumber.text.isEmpty
   ) {
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
    } else if (userName.text.isEmpty) {
    ScaffoldMessenger.of(context).showSnackBar(
      const SnackBar(content: Text("Usename is Empty")));
    } else if (phoneNumber.text.isEmpty) {
    ScaffoldMessenger.of(context).showSnackBar(
      const SnackBar(content: Text("Phone number is Empty")));
    } else if (phoneNumber.text.length<10 || phoneNumber.text.length>10) {
    ScaffoldMessenger.of(context).showSnackBar(
      const SnackBar(content: Text("Phone Number should be 10 digits")));
    } else if (phoneNumber.text.isEmpty) {
    ScaffoldMessenger.of(context).showSnackBar(
      const SnackBar(content: Text("Phone number is Empty")));
     } else if (userAddress.text.isEmpty) {
    ScaffoldMessenger.of(context).showSnackBar(
      const SnackBar(content: Text("Address is Empty")));
     }}
    
    else {
    try {
      UserCredential userCredential = await FirebaseAuth.instance
          .createUserWithEmailAndPassword(email: email.text, password: password.text);
      await FirebaseFirestore.instance.collection("User").doc(userCredential.user!.uid).set({
        "UserName": userName.text,
        "userId": userCredential.user!.uid,
        "UserEmail": email.text,
        "UserAdresss" : userAddress.text,
        "UserGender": isMale == true ? "Male" : "Female",
        "PhoneNumber": phoneNumber.text,
      });
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(
          content: Text("Successful Registration"),
          duration: Duration(seconds: 1),
        ),
      );
      Future.delayed(Duration(seconds: 1), () {
        Navigator.of(context).pushReplacement(
          MaterialPageRoute(
            builder: (ctx) => const Login(),
          ),
        );
      });
    } on FirebaseAuthException catch (e) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Text(e.message ?? ''),
        ),
      );
      print(e.message);
    }
  }
}


  Widget _buildAllTextFormField() {
    return SizedBox(
      height: 430,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          MyTextFormField(
            name: "UserName",
            controller: userName,
          ),
          MyTextFormField(
            name: "Email",
           controller: email,
          ),
          PasswordTextFormField(
               onTap: (){
                setState(() {
                  obserText = !obserText;
                });
                FocusScope.of(context).unfocus();
              },
            name: "Password", 
            obserText: obserText,
            controller: password,
            ),
          GestureDetector(
            onTap: () {
              setState(() {
                isMale = !isMale;
              });
            },
            child: Container(
              height: 60,
              padding: const EdgeInsets.only(left: 10),
              width: double.infinity,
              decoration: BoxDecoration(
                border: Border.all(),
              ),
              child: Center(
                child: Row(
                  children: [
                    Text(
                      isMale == true ? "Male" : "Female",
                      style: const TextStyle(
                        color: Colors.black87,
                        fontSize: 18,
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
         // const SizedBox(height: 20,),
          MyTextFormField(
            name: "Phone Number",
            controller: phoneNumber,
          ),
          MyTextFormField(
            name: "Adress ",
            controller: userAddress,
          ),
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: _scaffoldKey,
      resizeToAvoidBottomInset: true,
      body: SingleChildScrollView(
        child: Form(
          key: _formKey,
          child: SafeArea(
            child: Column(
              children: [
                SizedBox(
                  height: 220,
                  width: MediaQuery.of(context).size.width,
                  child: const Column(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      Text(
                        "Register",
                        style: TextStyle(
                          fontSize: 50,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ],
                  ),
                ),
                const SizedBox(height: 20),
                Container(
                  margin: const EdgeInsets.symmetric(horizontal: 10),
                  height: 500,
                  width: MediaQuery.of(context).size.width,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      _buildAllTextFormField(),
                      MyButton(
                        name: "SignUp",
                        onPressed: () {
                          validation();
                        },
                      ),
                      ChangeScreen(
                        name: "Login",
                        onTap: () {
                          Navigator.of(context).pushReplacement(
                            MaterialPageRoute(
                              builder: (ctx) => const Login(),
                            ),
                          );
                        },
                        whichAccount: "I Already Have An Account!",
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
