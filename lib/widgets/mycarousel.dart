

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';

Widget myCarousel() {
  return FutureBuilder(
  future: FirebaseFirestore.instance
      .collection("products")
      .doc("rrfecs2IRdVrxokNP3Aa")
      .collection("featureproducts")
      .get(),
  builder: (context, snapshot) {
    if (snapshot.connectionState == ConnectionState.waiting) {
      return const Center(child: CircularProgressIndicator());
    } else {
      List<Widget> imageSliders = snapshot.data!.docs.map<Widget>((item) => Container(
        child: Container(
          margin: EdgeInsets.all(5.0),
          child: ClipRRect(
            borderRadius: BorderRadius.all(Radius.circular(5.0)),
            child: Image.network(item.data()['image'], 
            fit: BoxFit.cover,
            ),
          ),
        ),
      )).toList();

      return CarouselSlider(
        items: imageSliders,
        options: CarouselOptions(
          autoPlay: true,
          aspectRatio: 1.0,
          enlargeCenterPage: true,
        ),
      );
    }
  },
);

}
