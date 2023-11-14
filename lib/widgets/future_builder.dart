// import 'package:flutter/material.dart';
// import 'package:cloud_firestore/cloud_firestore.dart';
// import 'package:newcommerce/model/CategoryIcons.dart';
// import '../model/product.dart';
// import '../provider/category_provider.dart';

// Product? menData;
// Product? womenWatchData;
// Product? pcData;
// Product? systemUnitData;
// CategoryIcon? dressIconData;
// CategoryIcon? tieIconData;
// CategoryIcon? shoesIconData;
// CategoryIcon? pantsIconData;
// CategoryIcon? shirtsIconData;
// var shirtsIcon;
// var pantsIcon;
// var shoesIcon;
// var tieIcons;
// var dressIcons;
// var mySnapShot;
// var newAchiveSnapShot;
// var shirt;
// var dress;
// var pant;
// var tie;
// var shoes;
// CategoryProvider? provider;

// class Builders extends StatefulWidget {
//   const Builders({super.key, 
    
//   });

//   @override
//   State<Builders> createState() => _BuildersState();
// }

// class _BuildersState extends State<Builders> {
//   final GlobalKey<ScaffoldState> _key = GlobalKey<ScaffoldState>();

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       key: _key,
//       body: futureBuilder(),
//     );
//   }

//   Widget futureBuilder() {
//     return Column(
//       children: [
//         Expanded(
//           child: 
//              FutureBuilder(
//               future: FirebaseFirestore.instance
//                   .collection("category")
//                   .doc("y3Fu43S2iYZsSE9N2L71")
//                   .collection("shirt")
//                   .get(),
//               builder: (context, shirtSnapshot) {
//                 if (shirtSnapshot.connectionState == ConnectionState.waiting) {
//                   return const Center(child: CircularProgressIndicator());
//                 }

//                 shirt = shirtSnapshot;

//                 return FutureBuilder(
//                   future: FirebaseFirestore.instance
//                       .collection("category")
//                       .doc("y3Fu43S2iYZsSE9N2L71")
//                       .collection("dress")
//                       .get(),
//                   builder: (context, dressSnapshot) {
//                     if (dressSnapshot.connectionState == ConnectionState.waiting) {
//                       return const Center(child: CircularProgressIndicator());
//                     }

//                     dress = dressSnapshot;

//                     return FutureBuilder(
//                       future: FirebaseFirestore.instance
//                           .collection("category")
//                           .doc("y3Fu43S2iYZsSE9N2L71")
//                           .collection("tie")
//                           .get(),
//                       builder: (context, tieSnapshot) {
//                         if (tieSnapshot.connectionState == ConnectionState.waiting) {
//                           return const Center(child: CircularProgressIndicator());
//                         }

//                         tie = tieSnapshot;

//                         return FutureBuilder(
//                           future: FirebaseFirestore.instance
//                               .collection("category")
//                               .doc("y3Fu43S2iYZsSE9N2L71")
//                               .collection("pant")
//                               .get(),
//                           builder: (context, pantSnapshot) {
//                             if (pantSnapshot.connectionState == ConnectionState.waiting) {
//                               return const Center(child: CircularProgressIndicator());
//                             }

//                             pant = pantSnapshot;

//                             return FutureBuilder(
//                               future: FirebaseFirestore.instance
//                                   .collection("category")
//                                   .doc("y3Fu43S2iYZsSE9N2L71")
//                                   .collection("shoes")
//                                   .get(),
//                               builder: (context, shoesSnapshot) {
//                                 if (shoesSnapshot.connectionState == ConnectionState.waiting) {
//                                   return const Center(child: CircularProgressIndicator());
//                                 }

//                                 shoes = shoesSnapshot;

//                                 return FutureBuilder(
//                                   future: FirebaseFirestore.instance
//                                       .collection("categoryIcons")
//                                       .doc("vBhYOKOTVmPqy7H8WE7Y")
//                                       .collection("dressicon")
//                                       .get(),
//                                   builder: (context, snapshot) {
//                                     if (snapshot.connectionState == ConnectionState.waiting) {
//                                       return const Center(child: CircularProgressIndicator());
//                                     }

//                                     dressIcons = snapshot;
//                                     dressIconData = CategoryIcon(
//                                       image: snapshot.data?.docs[2]["image"],
//                                     );

//                                     return FutureBuilder(
//                                       future: FirebaseFirestore.instance
//                                           .collection("categoryIcons")
//                                           .doc("vBhYOKOTVmPqy7H8WE7Y")
//                                           .collection("dressicon")
//                                           .get(),
//                                       builder: (context, snapshot) {
//                                         if (snapshot.connectionState == ConnectionState.waiting) {
//                                           return const Center(child: CircularProgressIndicator());
//                                         }

//                                         tieIcons = snapshot;
//                                         tieIconData = CategoryIcon(
//                                           image: snapshot.data?.docs[4]["image"],
//                                         );

//                                         return FutureBuilder(
//                                           future: FirebaseFirestore.instance
//                                               .collection("categoryIcons")
//                                               .doc("vBhYOKOTVmPqy7H8WE7Y")
//                                               .collection("dressicon")
//                                               .get(),
//                                           builder: (context, snapshot) {
//                                             if (snapshot.connectionState == ConnectionState.waiting) {
//                                               return const Center(child: CircularProgressIndicator());
//                                             }

//                                             shoesIcon = snapshot;
//                                             shoesIconData = CategoryIcon(
//                                               image: snapshot.data?.docs[1]["image"],
//                                             );

//                                             return FutureBuilder(
//                                               future: FirebaseFirestore.instance
//                                                   .collection("categoryIcons")
//                                                   .doc("vBhYOKOTVmPqy7H8WE7Y")
//                                                   .collection("dressicon")
//                                                   .get(),
//                                               builder: (context, snapshot) {
//                                                 if (snapshot.connectionState == ConnectionState.waiting) {
//                                                   return const Center(child: CircularProgressIndicator());
//                                                 }

//                                                 pantsIcon = snapshot;
//                                                 pantsIconData = CategoryIcon(
//                                                   image: snapshot.data?.docs[0]["image"],
//                                                 );

//                                                 return FutureBuilder(
//                                                   future: FirebaseFirestore.instance
//                                                       .collection("categoryIcons")
//                                                       .doc("vBhYOKOTVmPqy7H8WE7Y")
//                                                       .collection("dressicon")
//                                                       .get(),
//                                                   builder: (context, snapshot) {
//                                                     if (snapshot.connectionState == ConnectionState.waiting) {
//                                                       return const Center(child: CircularProgressIndicator());
//                                                     }

//                                                     shirtsIcon = snapshot;
//                                                     shirtsIconData = CategoryIcon(
//                                                       image: snapshot.data?.docs[3]["image"],
//                                                     );
//                                                     return Container();
//                                                   },
//                                                 );
//                                               },
//                                             );
//                                           },
//                                         );
//                                       },
//                                     );
//                                   },
//                                 );
//                               },
//                             );
//                           },
//                         );
//                       },
//                     );
//                   },
//                 );
//               },
//         ),
//     ),
//     ],
//     );
//   }
        
//   }

