import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'dart:io';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:newcommerce/model/user_model.dart';
import 'package:newcommerce/provider/product_provider.dart';
import 'package:newcommerce/screens/homepage.dart';
import 'package:newcommerce/widgets/checkout_singleproduct.dart';
import 'package:newcommerce/widgets/mybutton.dart';
import 'package:newcommerce/widgets/mytextformField.dart';
import 'package:newcommerce/widgets/notification_button.dart';
import 'package:provider/provider.dart';

class ProfileScreen extends StatefulWidget {
  const ProfileScreen({super.key});

  @override
  _ProfileScreenState createState() => _ProfileScreenState();
}

class _ProfileScreenState extends State<ProfileScreen> {
  UserModel? userModel;
  TextEditingController email = TextEditingController();
 TextEditingController password = TextEditingController();
 TextEditingController userName = TextEditingController();
TextEditingController phoneNumber = TextEditingController();
TextEditingController userAddress = TextEditingController();
  final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();
  static String p =
      r'^(([^<>()[\]\\.,;:\s@\"]+(\.[^<>()[\]\\.,;:\s@\"]+)*)|(\".+\"))@((\[[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\])|(([a-zA-Z\-0-9]+\.)+[a-zA-Z]{2,}))$';
  RegExp regExp = RegExp(p);
  bool isMale = false;
  void vaildation() async {
    if (userName.text.isEmpty && phoneNumber.text.isEmpty) {
      ScaffoldMessenger.of(context).showSnackBar(
      const SnackBar(content: Text("All fields are Empty")));

    } else if (userName.text.isEmpty) {
      ScaffoldMessenger.of(context).showSnackBar(
      const SnackBar(content: Text("Usename is Empty")));

    } else if (userName.text.length < 6) {
       ScaffoldMessenger.of(context).showSnackBar(
      const SnackBar(content: Text("Usename must be 6 leters")));

    } else if (phoneNumber.text.length < 10 || phoneNumber.text.length > 10) {
       ScaffoldMessenger.of(context).showSnackBar(
      const SnackBar(content: Text("Phone number must be 10")));
    } else {
      userDetailUpdate();
    }
  }

  File? _pickedImage;

  Future<void> pickImage(ImageSource source) async {
        final returnImage = await ImagePicker().pickImage(source: source);
        if (returnImage == null) return;
        setState(() {
          _pickedImage = File(returnImage.path);
        });
      }


  String? userUid;
  Future<String> _uploadImage({File? image}) async {
    Reference storageReference =
        FirebaseStorage.instance.ref().child("UserImage/$userUid");
    UploadTask uploadTask = storageReference.putFile(image!);
   TaskSnapshot snapshot = await uploadTask;
    String imageUrl = await snapshot.ref.getDownloadURL();
    return imageUrl;
  }

  void getUserUid() {
    User? myUser = FirebaseAuth.instance.currentUser;
    userUid = myUser?.uid;
  }

  bool centerCircle = false;
  var imageMap;
  void userDetailUpdate() async {
    setState(() {
      centerCircle = true;
    });
    _pickedImage != null
        ? imageMap = await _uploadImage(image: _pickedImage)
        : Container();
    FirebaseFirestore.instance.collection("User").doc(userUid).update({
      "UserName": userName.text,
      "UserGender": isMale == true ? "Male" : "Female",
      "UserNumber": phoneNumber.text,
      "UserImage": imageMap,
      "UserAddress": userAddress.text
    });
    setState(() {
      centerCircle = false;
    });
    setState(() {
      edit = false;
    });
  }

   Widget _buildSingleContainer({String? startText, String? endText, Color? color}) {
          return Card(
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(30),
            ),
            child: Container(
              height: 55,
              width: double.infinity,
              padding: const EdgeInsets.symmetric(horizontal: 20),
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(30),
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    startText ?? "",
                    style: const TextStyle(fontSize: 17, color: Colors.black45),
                  ),
                  Text(
                    endText ?? "",
                    style: const TextStyle(fontSize: 17, fontWeight: FontWeight.bold),
                  ),
                ],
              ),
            ),
          );
        }

  String? userImage;
  bool edit = false;

  Widget _buildContainerPart() {
        List<UserModel> userModel = productProvider!.userModelList;
        return Column(
          children: userModel.map((e) {
            userImage = e.userImage;
            userName.text = e.userName;
            phoneNumber.text = e.userPhoneNumber;
            userAddress.text = e.userAddress;

            return SizedBox(
              height: 350,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  _buildSingleContainer(startText: "Name", endText: e.userName),
                  _buildSingleContainer(startText: "Email", endText: e.userEmail),
                  _buildSingleContainer(startText: "Gender", endText: e.userGender),
                 _buildSingleContainer(startText: "Phone Number", endText: e.userPhoneNumber),
                  _buildSingleContainer(startText: "Address", endText: e.userAddress),
                ],
              ),
            );
          }).toList(),
        );
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

  Widget _buildProfileTextFields() {
        UserModel userModel = productProvider!.userModelList[0];
        return SizedBox(
          height: 350,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              MyTextFormField(
                name: "UserName",
                controller: userName,
                onChanged: (newValue) {
                  setState(() {
                    userModel.userName = newValue!;
                   
                  });
                  return null;
                },
              ),
              _buildSingleContainer(
                color: Colors.grey[300],
                endText: userModel.userEmail,
                startText: "Email",
              ),
              GestureDetector(
                onTap: () {
                  setState(() {
                    isMale = userModel.userGender.toLowerCase() == 'male';
                  });
                },
                child: _buildSingleContainer(
                  color: Colors.white,
                  endText: userModel.userGender,
                  startText: "Gender",
                ),
              ),
              MyTextFormField(
                name: "Phone Number",
                controller: phoneNumber,
                
                onChanged: (newValue) {
                  setState(() {
                    userModel.userName = newValue!;
                    
                  });
                  return null;
                },
              ),
              MyTextFormField(
                name: "Address",
                controller: userAddress,
                onChanged: (newValue) {
                  setState(() {
                    userModel.userName = newValue!;
                    
                  });
                  return null;
                },
              ),
            ],
          ),
        );
      }


  @override
  Widget build(BuildContext context) {
    productProvider = Provider.of<ProductProvider>(context);
    getUserUid();
    return Scaffold(
      resizeToAvoidBottomInset: true,
      key: _scaffoldKey,
      backgroundColor: const Color(0xfff8f8f8),
      appBar: AppBar(
        leading: edit == true
            ? IconButton(
                icon: const Icon(
                  Icons.close,
                  color: Colors.redAccent,
                  size: 30,
                ),
                onPressed: () {
                  setState(() {
                    edit = false;
                  });
                },
              )
            : IconButton(
                icon: const Icon(
                  Icons.arrow_back,
                  color: Colors.black45,
                  size: 30,
                ),
                onPressed: () {
                  setState(() {
                    Navigator.of(context).pushReplacement(
                      MaterialPageRoute(
                        builder: (ctx) => const HomePage(),
                      ),
                    );
                  });
                },
              ),
        backgroundColor: Colors.white,
        actions: [
          edit == false
              ? const NotificationButton()
              : IconButton(
                  icon: const Icon(
                    Icons.check,
                    size: 30,
                    color: Color(0xff746bc9),
                  ),
                  onPressed: () {
                    vaildation();
                  },
                ),
        ],
      ),
      body: centerCircle == false
          ? ListView(
              children: [
                StreamBuilder(
                    stream: FirebaseFirestore.instance
                        .collection("User")
                        .snapshots(),
                    builder: (context, snapshot) {
                      if (snapshot.connectionState == ConnectionState.waiting) {
                        return const Center(
                          child: CircularProgressIndicator(),
                        );
                      }
                      var myDoc = snapshot.data?.docs;
                      myDoc?.forEach((checkDocs) {
                        if (checkDocs.data()["UserId"] == userUid) {
                          userModel = UserModel(
                            userEmail: checkDocs.data()["UserEmail"],
                            userImage: checkDocs.data()["UserImage"],
                            userAddress: checkDocs.data()["UserAddress"],
                            userGender: checkDocs.data()["UserGender"],
                            userName: checkDocs.data()["UserName"],
                            userPhoneNumber: checkDocs.data()["UserNumber"],
                          );
                        }
                      });
                      return Container(
                        height: 603,
                        width: double.infinity,
                        padding: const EdgeInsets.symmetric(horizontal: 20),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          children: [
                            Stack(
                              children: [
                                SizedBox(
                                  height: 200,
                                  width: double.infinity,
                                  child: Column(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: [
                                      CircleAvatar(
                                          maxRadius: 65,
                                          backgroundImage: _pickedImage != null
                                              ? FileImage(_pickedImage!)
                                              : userModel?.userImage != null
                                                  ? NetworkImage(userModel!.userImage)
                                                  : const AssetImage("images/userImage.png") as ImageProvider,
                                        ),
                                    ],
                                  ),
                                ),
                                edit == true
                                    ? Padding(
                                        padding: EdgeInsets.only(
                                            left: MediaQuery.of(context)
                                                    .viewPadding
                                                    .left +
                                                220,
                                            top: MediaQuery.of(context)
                                                    .viewPadding
                                                    .left +
                                                110),
                                        child: Card(
                                          shape: RoundedRectangleBorder(
                                            borderRadius:
                                                BorderRadius.circular(20),
                                          ),
                                          child: GestureDetector(
                                            onTap: () {
                                              myDialogBox(context);
                                            },
                                            child: const CircleAvatar(
                                              backgroundColor:
                                                  Colors.transparent,
                                              child: Icon(
                                                Icons.camera_alt,
                                                color: Color(0xff746bc9),
                                              ),
                                            ),
                                          ),
                                        ),
                                      )
                                    : Container(),
                              ],
                            ),
                            SizedBox(
                              height: 350,
                              width: double.infinity,
                              child: Column(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  Expanded(
                                    child: Container(
                                      child: edit == true
                                          ? _buildProfileTextFields()
                                          : _buildContainerPart(),
                                    ),
                                  ),
                                ],
                              ),
                            ),
                            Card(
                              shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(30)),
                              child: Container(
                                decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(20)),
                                child: edit == false
                                    ? MyButton(
                                        name: "Edit Profile",
                                        onPressed: () {
                                          setState(() {
                                            edit = true;
                                          });
                                        },
                                      )
                                    : Container(),
                              ),
                            ),
                          ],
                        ),
                      );
                    }),
              ],
            )
          : const Center(
              child: CircularProgressIndicator(),
            ),
    );
  }
}