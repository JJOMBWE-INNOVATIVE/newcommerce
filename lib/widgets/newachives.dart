
import 'package:flutter/material.dart';
import 'package:newcommerce/screens/homepage.dart';
import 'package:newcommerce/screens/listproduct.dart';

import '../screens/detailscreen.dart';
import 'singleproduct.dart';

Widget _buildFeaturedProduct({String? name, double? price, String? image}) {
  return Card(
    child: SizedBox(
      height: 280,
      width: 170,
      child: Column(
        children: [
          Container(
            height: 220,
            width: 160,
            decoration: BoxDecoration(
              image: DecorationImage(
                image: NetworkImage(image??""), 
                fit: BoxFit.cover, 
              ),
            ),
          ),
          Text(
            "\$$price",
            style: const TextStyle(
              fontSize: 18,
              color: Color(0xff9b96d6),
              fontWeight: FontWeight.bold,
            ),
          ),
          Text(
            name!,
            style: const TextStyle(fontSize: 17),
          ),
        ],
      ),
    ),
  );
}

Widget MyNewAchives(BuildContext context){
  return Column(
    children: [
      SizedBox(
    height: 40,
    child:  Column(
      mainAxisAlignment: MainAxisAlignment.end,
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            const Text("New Achives",
            style: TextStyle(
              fontSize: 17,
              fontWeight: FontWeight.bold
            ),
            ),
            GestureDetector(
              onTap: (){
                Navigator.of(context).pushReplacement
                (MaterialPageRoute(builder: 
                (ctx)=> ListProduct(
                  name: "New Achives",
                  snapshot: newAchiveSnapShot,
                  isCategory: false,
                  ),
                ),
                );
              },
              child: const Text("View more",style: TextStyle(
                fontSize: 17,
                fontWeight: FontWeight.bold
              ),
              ),
            ),
          ],
        ),
      ],
    ),
  ),
  Row(
    children: [
       

       GestureDetector(
              onTap: (){
            Navigator.of(context).pushReplacement
            (MaterialPageRoute(builder: 
            (ctx)=> DetailScreen(
              name: pcData!.name,
              image: pcData!.image,
              price: pcData!.price
            ),
            ),
            );
          },
              child: SingleProduct(
              name: pcData!.name,
             image: pcData!.image,
              price: pcData!.price
              ),
            ),


        GestureDetector(
              onTap: (){
            Navigator.of(context).pushReplacement
            (MaterialPageRoute(builder: 
            (ctx)=> DetailScreen(
             name: systemUnitData!.name,
             image:systemUnitData!.image,
             price: systemUnitData!.price,
            ),
            ),
            );
          },
              child: SingleProduct(
              name: systemUnitData!.name,
               image:systemUnitData!.image,
              price: systemUnitData!.price,
              ),
            ),


    ],
  ),
    ],
  );
}