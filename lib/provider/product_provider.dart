


import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:newcommerce/model/cart_model.dart';
import 'package:newcommerce/model/product.dart';
import 'package:newcommerce/model/user_model.dart';
import 'package:newcommerce/screens/homepage.dart';

class ProductProvider with ChangeNotifier{

  List<CartModel> cartModelList = [];
  late CartModel cartModel;
  List<CartModel> checkOutModelList = [];
  late CartModel chechOutModel;

List<UserModel> userModelList = [];
 UserModel? userModel;
  Future<void> getUserData() async {
    try {
      User? currentUser = FirebaseAuth.instance.currentUser;
      QuerySnapshot userSnapShot = await FirebaseFirestore.instance.collection("User").get();
      for (var element in userSnapShot.docs) {
        final data = element.data() as Map<String, dynamic>?;
        if (currentUser?.uid == data?["userId"]) {
            UserModel userModel = UserModel(
            userAddress: data?["UserAddress"] as String? ?? "",
            userImage: data?["userImage"] as String? ?? "",
            userName: data?["UserName"] as String? ?? "",
            userEmail: data?["UserEmail"] as String? ?? "",
            userGender: data?["UserGender"] as String? ?? "",
            userPhoneNumber: data?["PhoneNumber"] as String? ?? "",
          );
          userModelList.add(userModel);
        }
      }
    } catch (e) {
      print("Error fetching user data: $e");
    }
  }

  List<UserModel> get getUserModelList {
    return userModelList;
  }


void getCartData({
final String? name,
final String? image,
final double? price,
final int? quantity, 
  }){
 cartModel = CartModel(
  name:name ,
  image: image,
  price: price,
  quantity: quantity,
 );
 cartModelList.add(cartModel);
  }
  List<CartModel> get getCartModelList{
    return List.from(cartModelList);
  }

  int get getCartModelListLength{
    return cartModelList.length;
  }
  List<String>notificationList = [];

  void addNotification(String notification){
    notificationList.add(notification);
  }

  int get getNotificationIndex{
    return notificationList.length;
  }


 void getCheckOutData({
final String? name,
final String? image,
final double? price,
final int? quantity, 
final String? color, 
final String? size, 
  }){
 chechOutModel = CartModel(
  name:name ,
  image: image,
  price: price,
  quantity: quantity,
 );
 checkOutModelList.add(chechOutModel);
  }
  List<CartModel> get getCheckOutModelList{
    return List.from(checkOutModelList);
  }

  int get getCheckOutModelListLength{
    return checkOutModelList.length;
  }

  void deleteCartProduct(int index){
    cartModelList.remove(index);
    notifyListeners();
  }

void deleteCheckOutProduct(int index){
    checkOutModelList.remove(index);
    notifyListeners();
  }

  void clearCheckOutProduct(){
    checkOutModelList.clear();
    notifyListeners();
  }


   List<Product>? searchList;
  void getsearchList({List <Product>? list}) {
    searchList = list;
  }


List<Product> searchProductList(String query) {
  List<Product> searchShirt = [];

  if (shirt.hasData) { 
    QuerySnapshot snapshot = shirt.data!; 

    List<Product> productList = snapshot.docs.map((doc) {
      Map<String, dynamic> data = doc.data() as Map<String, dynamic>;
      return Product(
        name: data['name'] as String,
         image: data['image'] as String,
        price: data['price'] as double, 
      );
    }).toList();

    searchShirt = productList.where((element) =>
      element.name.toUpperCase().contains(query.toUpperCase()) ||
      element.name.toLowerCase().contains(query.toLowerCase())).toList();
  }

  return searchShirt;
  
}


   Product? newAchivesData;
  List<Product> newAchives = [];
Future<void> getNewAchiveData() async {
  List<Product> newList = [];
  QuerySnapshot achivesSnapShot = await FirebaseFirestore.instance
    .collection("products")
    .doc("rrfecs2IRdVrxokNP3Aa")
    .collection("newachives")
    .get();

  newList = achivesSnapShot.docs.map((doc) {
    var data = doc.data() as Map<String, dynamic>; 
    return Product(
      image: data["image"] as String, 
      name: data["name"] as String, 
      price: (data["price"] as num).toDouble(), 
    );
  }).toList();

  newAchives = newList;
  notifyListeners();
}

List<Product> get getNewAchiesList {
  return newAchives;
}

get getNotificationList {
  return notificationList;
}



   Product?  featureData;
  List<Product>  features = [];
Future<void> getFeatureData() async {
  List<Product> newList = [];
  QuerySnapshot featuresSnapShot = await FirebaseFirestore.instance
    .collection("products")
    .doc("rrfecs2IRdVrxokNP3Aa")
    .collection("featureproducts")
    .get();

  newList = featuresSnapShot.docs.map((doc) {
    var data = doc.data() as Map<String, dynamic>; 
    return Product(
      image: data["image"] as String, 
      name: data["name"] as String, 
      price: (data["price"] as num).toDouble(), 
    );
  }).toList();

  features = newList;
  notifyListeners();
}

List<Product> get getFeaturesList {
  return newAchives;
}


String? userImage;

  void setUserImage(String? image) {
    userImage = image;
    notifyListeners();
  }

  String? getUserImage() {
    return userImage;
  }




}