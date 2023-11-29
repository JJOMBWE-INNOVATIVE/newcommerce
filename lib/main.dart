import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:newcommerce/provider/category_provider.dart';
import 'package:newcommerce/provider/product_provider.dart';
import 'package:newcommerce/screens/Splash_screen.dart';
import 'package:newcommerce/screens/homepage.dart';
import 'package:newcommerce/screens/login.dart';
import 'package:newcommerce/screens/profilescreen.dart';
import 'package:newcommerce/screens/signup.dart';
import 'package:newcommerce/screens/welcomescreen.dart';
import 'package:provider/provider.dart';
import 'firebase_options.dart';

Future main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
      future: Firebase.initializeApp(),
      builder: (context, snapshot) {
        if (snapshot.connectionState == ConnectionState.done) {
          return
 
MultiProvider(
            providers: [
              ChangeNotifierProvider(create: (context) => ProductProvider()),
              ChangeNotifierProvider(create: (context) => CategoryProvider()),
            ],
            child: StreamBuilder(
                stream: FirebaseAuth.instance.authStateChanges(),
                builder: (ctx, snapShort) {
                  return MaterialApp(
                    debugShowCheckedModeBanner: false,
                    home: FutureBuilder(
                      future: Future.delayed(const
 
                      Duration(seconds: 3)),
                      builder: (context, snapshot) {
                        if (snapshot.connectionState == ConnectionState.done) {
                          if (snapShort.hasData) {
                            return const HomePage();
                          } else {
                            return const WelcomeScreen();
                          }
                        } else {
                          return const SplashScreen();
                        }
                      },
                    ),
                  );
                }),
          );
        } else {
          return const Center(child: CircularProgressIndicator());
        }
      },
    );
  }
}