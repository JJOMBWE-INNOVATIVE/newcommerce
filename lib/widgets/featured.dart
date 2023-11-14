



import 'package:flutter/material.dart';
import 'package:newcommerce/screens/detailscreen.dart';
import 'package:newcommerce/screens/homepage.dart';
import 'package:newcommerce/screens/listproduct.dart';
import 'package:newcommerce/widgets/singleproduct.dart';

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
                image: AssetImage("images/$image"), 
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

Widget MyFeatured(BuildContext context){
  return Column(
    children: [
      SizedBox(
    height: 60,
    child:  Column(
      mainAxisAlignment: MainAxisAlignment.end,
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            const Text("Featured",
            style: TextStyle(
              fontSize: 17,
              fontWeight: FontWeight.bold
            ),
            ),
            GestureDetector(
              onTap: (){
                  Navigator.of( context).pushReplacement
                  (MaterialPageRoute(builder: 
                  (ctx)=> ListProduct(
                    name: "Featured",
                    snapshot: mySnapShot,
                    isCategory: false,
                    ),
                  ),
                  );
                },
              child: const Text("View more",style: TextStyle(
                fontSize: 17,
                fontWeight: FontWeight.bold
              ),),
            ),
          ],
        ),
      ],
    ),
  ),
  Row(
  children: [
    Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          children: [
            GestureDetector(
              onTap: (){
            Navigator.of(context).pushReplacement
            (MaterialPageRoute(builder: 
            (ctx)=>  DetailScreen(
              name: menData!.name,
              image: menData!.image,
              price: menData!.price
            ),
            ),
            );
          },
              child:SingleProduct(
              name: menData!.name,
              image: menData!.image,
              price: menData!.price
              ),
            ),
            GestureDetector(
              onTap: (){
            Navigator.of(context).pushReplacement
            (MaterialPageRoute(builder: 
            (ctx)=> DetailScreen(
              name: womenWatchData!.name,
              image: womenWatchData!.image,
              price: womenWatchData!.price
            ),
            ),
            );
          },
              child: SingleProduct(
              name: womenWatchData!.name,
              image: womenWatchData!.image,
              price: womenWatchData!.price
              ),
            ),
          ],
        ),
      ],
    ),
  ],
),
],
  );
}

