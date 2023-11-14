
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:newcommerce/model/user_model.dart';
import 'package:newcommerce/provider/product_provider.dart';
import 'package:newcommerce/screens/about.dart';
import 'package:newcommerce/screens/checkout.dart';
import 'package:newcommerce/screens/contactus.dart';
import 'package:newcommerce/screens/profilescreen.dart';
import 'package:provider/provider.dart';


class MyDrawer extends StatefulWidget {
  const MyDrawer({super.key});

  @override
  State<MyDrawer> createState() => _MyDrawerState();
}

class _MyDrawerState extends State<MyDrawer> {
  bool aboutColor = false;
  bool cartColor = false;
  bool contactColor = false;
  bool homeColor = false;
  bool logoutColor = false;
  bool checkoutColor = false;
  bool profileColor = false;

  Widget _buildUserAccountsDrawerHeader() {
    List<UserModel> userModel = Provider.of<ProductProvider>(context).userModelList;
    return Column(
      children: userModel.map((e) {
        return UserAccountsDrawerHeader(
          accountName: Text(
            e.userName,
            style: const TextStyle(color: Colors.black),
          ),
          currentAccountPicture: CircleAvatar(
            backgroundColor: Colors.white,
            backgroundImage: e.userImage == null
                ? NetworkImage(e.userImage)
                : const AssetImage("images/tie.png") as ImageProvider
          ),
          decoration: const BoxDecoration(color: Color(0xfff2f2f2)),
          accountEmail: Text(e.userEmail, style: const TextStyle(color: Colors.black)),
        );
      }).toList(),
    );
  }

  @override
  Widget build(BuildContext context) {
    return  Drawer(
      child: ListView(
        children: <Widget>[
          _buildUserAccountsDrawerHeader(),
          ListTile(
            selected: homeColor,
            onTap: () {
              setState(() {
                homeColor = true;
                contactColor = false;
                checkoutColor = false;
                aboutColor = false;
                profileColor = false;
              });
            },
            leading: const Icon(Icons.home),
            title: const Text("Home"),
          ),
          ListTile(
            selected: checkoutColor,
            onTap: () {
              setState(() {
                checkoutColor = true;
                contactColor = false;
                homeColor = false;
                profileColor = false;
                aboutColor = false;
              });
              Navigator.of(context).pushReplacement(MaterialPageRoute(builder: (ctx) => const CheckOut()));
            },
            leading: const Icon(Icons.shopping_cart),
            title: const Text("Checkout"),
          ),
          ListTile(
            selected: aboutColor,
            onTap: () {
              setState(() {
                aboutColor = true;
                contactColor = false;
                homeColor = false;
                profileColor = false;
                checkoutColor = false;
              });
              Navigator.of(context).pushReplacement(MaterialPageRoute(builder: (ctx) => const About()));
            },
            leading: const Icon(Icons.info),
            title: const Text("About"),
          ),
          ListTile(
            selected: profileColor,
            onTap: () {
              setState(() {
                aboutColor = false;
                contactColor = false;
                homeColor = false;
                profileColor = true;
                checkoutColor = false;
              });
              Navigator.of(context).pushReplacement(MaterialPageRoute(builder: (ctx) => const ProfileScreen()));
            },
            leading: const Icon(Icons.info),
            title: const Text("Profile"),
          ),
          ListTile(
            selected: contactColor,
            onTap: () {
              setState(() {
                contactColor = true;
                checkoutColor = false;
                profileColor = false;
                homeColor = false;
                aboutColor = false;
              });
              Navigator.of(context).pushReplacement(MaterialPageRoute(builder: (ctx) => const ContactUs()));
            },
            leading: const Icon(Icons.phone),
            title: const Text("Contant Us"),
          ),
          ListTile(
            onTap: () {
              FirebaseAuth.instance.signOut();
            },
            leading: const Icon(Icons.exit_to_app),
            title: const Text("Logout"),
          ),
        ],
      ),
    );
  }
}
