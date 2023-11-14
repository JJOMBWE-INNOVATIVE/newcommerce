

import 'package:flutter/material.dart';
import 'package:newcommerce/screens/login.dart';
import 'package:newcommerce/screens/signup.dart';


class WelcomeScreen extends StatelessWidget {
  const WelcomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Container(
          padding: const EdgeInsets.symmetric(horizontal: 50),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              SizedBox(
                height: 600,
                width: double.infinity,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    Container(
                      height: 350,
                      width: double.infinity,
                      decoration: const BoxDecoration(
                        image: DecorationImage(
                          fit: BoxFit.cover,
                          image:AssetImage("images/shopping.png"),
                        ),
                      ),
                    ),
                     const Text("Welcome",style:TextStyle(
                fontSize: 40,
                fontWeight: FontWeight.bold,
                color: Colors.black
              ),),
              const SizedBox(
                height: 60,
                width: double.infinity,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    Text("Ready to start shopping? Sign Up",
                    style:TextStyle(
                  fontSize: 18,
                ),),
                Text("To get started",
                    style:TextStyle(
                  fontSize: 18,
                ),),
                  ],
                ),
              ),
               SizedBox(
                height: 45,
                width: double.infinity,
                child: ElevatedButton(
                  onPressed: (){
                    Navigator.of(context).pushReplacement
                    (MaterialPageRoute(builder: 
                    (ctx)=>const SignUp(),
                    ),
                    );
                  },
                  style: ButtonStyle(
                  backgroundColor:
                    MaterialStateProperty.all<Color>(const Color(0xff746bc9)),
                    shape:MaterialStateProperty.all<RoundedRectangleBorder>(
                    RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(10)
                    ),
                    ),
                   ),
                  child:const Text("Start",style: TextStyle(
                    fontSize: 18,
                    color: Colors.white
                  ),) ,
                  ),
                  ),
                  Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const Text("Already have an account? ",style: TextStyle(
                          fontSize: 18,
                        ),),
                      GestureDetector(
                        onTap: (){
                          Navigator.of(context).pushReplacement
                            (MaterialPageRoute(builder: 
                            (ctx)=>const Login(),
                            ),
                            );
                        },
                        child: const Text("Login",style: TextStyle(
                          fontSize: 20,
                          color: Color(0xff746bc9),
                        ),
                        ),
                      ),
                    ],
                )
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