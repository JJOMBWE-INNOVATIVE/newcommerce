import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:newcommerce/model/user_model.dart';
import 'package:newcommerce/screens/homepage.dart';
import 'package:newcommerce/widgets/mybutton.dart';
import 'package:provider/provider.dart';

import '../provider/product_provider.dart';

class ContactUs extends StatefulWidget {
  const ContactUs({super.key});

  @override
  _ContactUsState createState() => _ContactUsState();
}

class _ContactUsState extends State<ContactUs> {
  final TextEditingController message = TextEditingController();

  late String name, email;

  final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();

  void validation() async {
    if (message.text.isEmpty) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text("Please fill message")),
      );
    } else {
      User? user = FirebaseAuth.instance.currentUser;
      FirebaseFirestore.instance.collection("Message").doc(user?.uid).set({
        "Name": name,
        "Email": email,
        "Message": message.text,
      }).then((value) {
        message.clear();
      }).catchError((error) {
        Text("Message sending failed: $error");
      });
    }
  }

  Widget _buildSingleField({required String name}) {
    return Container(
      height: 60,
      width: double.infinity,
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(5),
        border: Border.all(color: Colors.grey),
      ),
      padding: const EdgeInsets.only(left: 10),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(
            name,
            style: const TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
          ),
        ],
      ),
    );
  }

  @override
  void initState() {
    ProductProvider provider;
    provider = Provider.of<ProductProvider>(context, listen: false);
    List<UserModel> user = provider.userModelList;

    // Check if the user list is not empty before trying to access its elements
    if (user.isNotEmpty) {
      name = user.first.userName;
      email = user.first.userEmail;
    } else {
      // Provide default values or handle this case as needed
      name = "Default Name";
      email = "Default Email";
    }

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    print(name);
    return GestureDetector(
      onTap: () {
        Navigator.of(context).pushReplacement(
          MaterialPageRoute(builder: (ctx) => const HomePage()),
        );
      },
      child: Scaffold(
        key: _scaffoldKey,
        appBar: AppBar(
          elevation: 0.0,
          backgroundColor: const Color(0xfff8f8f8),
          title: IconButton(
            icon: const Icon(
              Icons.arrow_back,
              color: Color(0xff746bc9),
              size: 35,
            ),
            onPressed: () {
              Navigator.of(context).pushReplacement(
                  MaterialPageRoute(builder: (ctx) => const HomePage()));
            },
          ),
        ),
        body: Container(
          padding: const EdgeInsets.symmetric(horizontal: 27),
          height: 600,
          width: double.infinity,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              const Text(
                "Send Us Your Message",
                style: TextStyle(
                  color: Color(0xff746bc9),
                  fontSize: 28,
                ),
              ),
              _buildSingleField(name: name),
              _buildSingleField(name: email),
              SizedBox(
                height: 200,
                child: TextFormField(
                  controller: message,
                  expands: true,
                  maxLines: null,
                  textAlignVertical: TextAlignVertical.top,
                  decoration: const InputDecoration(
                    border: OutlineInputBorder(),
                    hintText: " Message",
                  ),
                ),
              ),
              MyButton(
                name: "Submit",
                onPressed: () {
                  validation();
                },
              )
            ],
          ),
        ),
      ),
    );
  }
}
