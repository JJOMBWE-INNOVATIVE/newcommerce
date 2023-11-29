import 'package:flutter/material.dart';
import 'package:newcommerce/screens/welcomescreen.dart';


class SplashScreen extends StatefulWidget {
  const SplashScreen({Key? key}) : super(key: key);

  @override
  _SplashScreen createState() => _SplashScreen();
}

class _SplashScreen extends State<SplashScreen> {
  @override
  void initState() {
    super.initState();

    // Delay navigation to the Landing Page
    Future.delayed(Duration(seconds: 5), () {
      Navigator.of(context).pushReplacement(
      MaterialPageRoute(
        builder: (ctx) => const WelcomeScreen(),
      ),
    );
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Image.asset(
              "images/commerce.png",
              height: 200,
              width: 200,
            ),
            const SizedBox(
              height: 20, // Adjust the spacing as needed
            ),
            const Text(
              "Shopping App",
              style: TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 42,
              ),
            ),
             Text(
              "(Inspired by Integrin)",
              style: TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.bold,
                color: Color(0xff746bc9),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
