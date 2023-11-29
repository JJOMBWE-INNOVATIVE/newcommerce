import 'dart:io';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:newcommerce/model/user_model.dart';
import 'package:newcommerce/screens/homepage.dart';
import 'package:provider/provider.dart';
import '../provider/product_provider.dart';
import '../widgets/notification_button.dart';

class ProfileScreen extends StatefulWidget {
  const ProfileScreen({Key? key});

  @override
  State<ProfileScreen> createState() => _ProfileScreenState();
}

class _ProfileScreenState extends State<ProfileScreen> {
  UserModel? userModel;
  final CollectionReference _userCollection =
  FirebaseFirestore.instance.collection("User");

    File? _pickedImage;

  Future<void> pickImage(ImageSource source) async {
        final returnImage = await ImagePicker().pickImage(source: source);
        if (returnImage == null) return;
        setState(() {
          _pickedImage = File(returnImage.path);
        });
      }


    Future<void> myDialogBox(context) {
    return showDialog<void>(
        context: context,
        barrierDismissible: false,
        builder: (BuildContext context) {
          return AlertDialog(
            content: SingleChildScrollView(
              child: ListBody(
                children: [
                  ListTile(
                    leading: const Icon(Icons.camera_alt),
                    title: const Text("Pick Form Camera"),
                    onTap: () {
                      pickImage(ImageSource.camera);
                      Navigator.of(context).pop();
                    },
                  ),
                  ListTile(
                    leading: const Icon(Icons.photo_library),
                    title: const Text("Pick Form Gallery"),
                    onTap: () {
                      pickImage( ImageSource.gallery);
                      Navigator.of(context).pop();
                    },
                  ),
                ],
              ),
            ),
          );
        });
  }


  @override
  Widget build(BuildContext context) {
    ProductProvider? productProvider =
        Provider.of<ProductProvider>(context, listen: false);
    getUserUid();
    User? user = FirebaseAuth.instance.currentUser;

    if (user == null) {
      return Scaffold(
        body: Center(
          child: Text("User not logged in."),
        ),
      );
    }

    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          icon: const Icon(
            Icons.arrow_back,
            color: Colors.redAccent,
            size: 30,
          ),
          onPressed: () {
            Navigator.of(context).pushReplacement(
              MaterialPageRoute(
                builder: (ctx) => const HomePage(),
              ),
            );
          },
        ),
        backgroundColor: Colors.white,
        actions: const [
          NotificationButton(),
        ],
      ),
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: StreamBuilder<DocumentSnapshot>(
            stream: _userCollection.doc(user!.uid).snapshots(),
            builder: (context, snapshot) {
              if (snapshot.connectionState == ConnectionState.waiting) {
                return Center(child: CircularProgressIndicator());
              }

              if (!snapshot.hasData || snapshot.data == null) {
                return Center(child: Text("No Data Found"));
              }

              var data = snapshot.data?.data() as Map<String, dynamic>?;

              userModel = UserModel(
                userEmail: data?["UserEmail"] ?? "",
                userImage: data?["UserImage"] ?? "",
                userAddress: data?["UserAddress"] ?? "",
                userGender: data?["UserGender"] ?? "",
                userName: data?["UserName"] ?? "",
                userPhoneNumber: data?["UserNumber"] ?? "",
              );

              productProvider?.setUserImage(userModel?.userImage);

              return Column(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  const SizedBox(height: 20),
                  Align(
                    alignment: Alignment.center,
                    child: Stack(
                      children: [
                        Container(
                          height: 130,
                          width: 130,
                          decoration: BoxDecoration(
                            shape: BoxShape.circle,
                            border: Border.all(
                              color: Colors.green,
                              width: 5,
                            ),
                          ),
                          child: ClipOval(
                            child: SizedBox(
                              width: 130,
                              height: 130,
                              child: userModel != null
                                  ? Image.network(
                                      userModel!.userImage ?? "",
                                      fit: BoxFit.cover,
                                      loadingBuilder:
                                          (context, child, loadingProgress) {
                                        return loadingProgress == null
                                            ? child
                                            : Center(
                                                child:
                                                    CircularProgressIndicator());
                                      },
                                      errorBuilder:
                                          (context, object, stackTrace) {
                                        return const Icon(Icons.error);
                                      },
                                    )
                                  : const SizedBox.shrink(),
                            ),
                          ),
                        ),
                        Positioned(
                          left: 70,
                          top: 70,
                          child: Container(
                            padding: const EdgeInsets.symmetric(horizontal: 10),
                            decoration: BoxDecoration(
                              shape: BoxShape.circle,
                              color: Colors.green,
                            ),
                            child: IconButton(
                              onPressed: () {
                                myDialogBox(context);
                              },
                              icon: const Icon(
                                Icons.camera_alt,
                                color: Colors.white,
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                  const SizedBox(height: 20),
                  ReusableRow(
                    title: "Name",
                    value: userModel?.userName ?? "",
                    iconData: Icons.person,
                  ),
                  ReusableRow(
                    title: "Email",
                    value: userModel?.userEmail ?? "",
                    iconData: Icons.email,
                  ),
                  ReusableRow(
                    title: "Gender",
                    value: userModel?.userGender ?? "",
                    iconData: Icons.person,
                  ),
                  ReusableRow(
                    title: "Phone Number",
                    value: userModel?.userPhoneNumber ?? "",
                    iconData: Icons.phone,
                  ),
                  ReusableRow(
                    title: "Address",
                    value: userModel?.userAddress ?? "",
                    iconData: Icons.location_on,
                  ),
                ],
              );
            },
          ),
        ),
      ),
    );
  }

  String? userUid;

  void getUserUid() {
    userUid = FirebaseAuth.instance.currentUser?.uid;
  }
}

class ReusableRow extends StatelessWidget {
  const ReusableRow({
    Key? key,
    required this.title,
    required this.value,
    required this.iconData,
  }) : super(key: key);

  final String title;
  final String value;
  final IconData iconData;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        ListTile(
          title: Text(title),
          leading: Icon(iconData),
          trailing: Text(value),
        ),
        Divider(
          thickness: 1,
          color: Colors.black,
        ),
      ],
    );
  }
}
