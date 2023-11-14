import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

import '../model/product.dart';

class CategoryProvider with ChangeNotifier {
  Product? shirtData;
  List<Product> shirt = [];

  Future<void> getShirtData() async {
    try {
      List<Product> newList = [];
      QuerySnapshot shirtSnapShot = await FirebaseFirestore.instance
          .collection("category")
          .doc("y3Fu43S2iYZsSE9N2L71")
          .collection("shirt")
          .get();

      newList = shirtSnapShot.docs.map((doc) {
        final image = doc["image"] as String;
        final name = doc["name"] as String;
        final price = (doc["price"] as num).toDouble();

        return Product(
          image: image,
          name: name,
          price: price,
        );
      }).toList();

      shirt = newList;
      notifyListeners();
    } catch (e) {
      print("Error fetching data: $e");
    }

  }

  List<Product> get getShirtList {
    return shirt;
  }

  List<Product>? searchList;
  void getsearchList({List <Product>? list}) {
    searchList = list;
  }

List<Product> searchCategoryList(String query) {
  List<Product> searchDress = [];

  if (dress.isNotEmpty) {
    for (var product in dress) {
      searchDress.add(Product(
        name: product.name,
        image: product.image,
        price: product.price,
      ));
    }

    searchDress = searchDress.where((element) =>
        element.name.toUpperCase().contains(query.toUpperCase()) ||
        element.name.toLowerCase().contains(query.toLowerCase())).toList();
  }

  return searchDress;
}






  Product? dressData;
  List<Product> dress = [];

  Future<void> getDressData() async {
    try {
      List<Product> newList = [];
      QuerySnapshot dressSnapShot = await FirebaseFirestore.instance
          .collection("category")
          .doc("y3Fu43S2iYZsSE9N2L71")
          .collection("dress")
          .get();

      newList = dressSnapShot.docs.map((doc) {
        final image = doc["image"] as String;
        final name = doc["name"] as String;
        final price = (doc["price"] as num).toDouble();

        return Product(
          image: image,
          name: name,
          price: price,
        );
      }).toList();

      dress = newList;
      notifyListeners();
    } catch (e) {
      print("Error fetching data: $e");
    }
  }

  List<Product> get getDressList {
    return dress;
  }

//  List<Product> searchDressList(String query) {
//     List<Product> searchDress = [];

//   if (dress.hasData) { 
//     QuerySnapshot snapshot = dress.data!; 

//     List<Product> productList = snapshot.docs.map((doc) {
//       Map<String, dynamic> data = doc.data() as Map<String, dynamic>;
//       return Product(
//         name: data['name'] as String,
//          image: data['image'] as String,
//         price: data['price'] as double, 
//       );
//     }).toList();

//     searchDress = productList.where((element) =>
//       element.name.toUpperCase().contains(query.toUpperCase()) ||
//       element.name.toLowerCase().contains(query.toLowerCase())).toList();
//   }

//   return searchDress;
// }

  Product? pantData;
  List<Product> pant = [];

  Future<void> getPantData() async {
    try {
      List<Product> newList = [];
      QuerySnapshot pantSnapShot = await FirebaseFirestore.instance
          .collection("category")
          .doc("y3Fu43S2iYZsSE9N2L71")
          .collection("pant")
          .get();

      newList = pantSnapShot.docs.map((doc) {
        final image = doc["image"] as String;
        final name = doc["name"] as String;
        final price = (doc["price"] as num).toDouble();

        return Product(
          image: image,
          name: name,
          price: price,
        );
      }).toList();

      pant = newList;
      notifyListeners();
    } catch (e) {
      print("Error fetching data: $e");
    }
  }

  List<Product> get getPantList {
    return pant;
  }

 List<Product> searchPantList(String query) {
    List<Product> searchPant = pant.where((element){
      return element.name.toUpperCase().contains(query)|| 
      element.name.toLowerCase().contains(query);
    }).toList();
    return searchPant;
  }

  Product? shoesData;
  List<Product> shoes = [];

  Future<void> getShoesData() async {
    try {
      List<Product> newList = [];
      QuerySnapshot shoesSnapShot = await FirebaseFirestore.instance
          .collection("category")
          .doc("y3Fu43S2iYZsSE9N2L71")
          .collection("shoes")
          .get();

      newList = shoesSnapShot.docs.map((doc) {
        final image = doc["image"] as String;
        final name = doc["name"] as String;
        final price = (doc["price"] as num).toDouble();

        return Product(
          image: image,
          name: name,
          price: price,
        );
      }).toList();

      shoes = newList;
      notifyListeners();
    } catch (e) {
      print("Error fetching data: $e");
    }
  }

  List<Product> get getShoesList {
    return shoes;
  }

 List<Product> searchShoesList(String query) {
    List<Product> searchShoes = shoes.where((element){
      return element.name.toUpperCase().contains(query)|| 
      element.name.toLowerCase().contains(query);
    }).toList();
    return searchShoes;
  }

  Product? tieData;
  List<Product> tie = [];

  Future<void> getTieData() async {
    try {
      List<Product> newList = [];
      QuerySnapshot tieSnapShot = await FirebaseFirestore.instance
          .collection("category")
          .doc("y3Fu43S2iYZsSE9N2L71")
          .collection("shoes")
          .get();

      newList = tieSnapShot.docs.map((doc) {
        final image = doc["image"] as String;
        final name = doc["name"] as String;
        final price = (doc["price"] as num).toDouble();

        return Product(
          image: image,
          name: name,
          price: price,
        );
      }).toList();

      tie = newList;
      notifyListeners();
    } catch (e) {
      print("Error fetching data: $e");
    }
  }

  List<Product> get getTieList {
    return tie;
  }

 List<Product> searchTieList(String query) {
    List<Product> searchTie = tie.where((element){
      return element.name.toUpperCase().contains(query)|| 
      element.name.toLowerCase().contains(query);
    }).toList();
    return searchTie;
  }


//   List<Product> searchCategoryList(String query) {
//   List<Product> searchDress = [];

//   if (dress.isNotEmpty) {
//     if (dress.hasData) {
//       QuerySnapshot snapshot = dress.data!;

//       List<Product> productList = snapshot.docs.map((doc) {
//         Map<String, dynamic> data = doc.data() as Map<String, dynamic>;
//         return Product(
//           name: data['name'] as String,
//           image: data['image'] as String,
//           price: data['price'] as double,
//         );
//       }).toList();

//       searchDress = productList.where((element) =>
//           element.name.toUpperCase().contains(query.toUpperCase()) ||
//           element.name.toLowerCase().contains(query.toLowerCase())).toList();
//     }
//   }

//   return searchDress;
// }


}


