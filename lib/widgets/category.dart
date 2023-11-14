

import 'package:flutter/material.dart';
import 'package:newcommerce/screens/homepage.dart';
import 'package:newcommerce/screens/listproduct.dart';

Widget _buildCategoryProduct({String? image, int? color}) {
  return Container(
    width: 80, // Adjust the width and height according to your design
    height: 90,
    decoration: BoxDecoration(
      shape: BoxShape.circle,
      color: Color(color!),
    ),
    child: Center(
      child: SizedBox(
        width: 60,
        height: 80,
        child: ClipOval(
          
          child: Image.network(image ?? '', fit: BoxFit.cover),
          // You can also use AssetImage for local images:
          // child: Image.asset("images/$image", fit: BoxFit.cover),
        ),
      ),
    ),
  );
}

Widget MyCategory(BuildContext context) {
  return Column(
    children: [
      const SizedBox(
        height: 70,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              "Categories",
              style: TextStyle(
                fontSize: 17,
                fontWeight: FontWeight.bold,
              ),
            ),
          ],
        ),
      ),
      SizedBox(
        height: 60,
        child: SingleChildScrollView(
          scrollDirection: Axis.horizontal,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              GestureDetector(
                onTap: () {
                  Navigator.of(context).pushReplacement(
                    MaterialPageRoute(
                      builder: (ctx) => ListProduct(
                        name: "Dresses",
                        snapshot: dress, 
                      ),
                    ),
                  );
                },
                child: _buildCategoryProduct(
                  image: dressIconData!.image,
                  color: 0xff33dcfd,
                ),
              ),
              GestureDetector(
                onTap: () {
                  Navigator.of(context).pushReplacement(
                    MaterialPageRoute(
                      builder: (ctx) => ListProduct(
                        name: "Ties",
                        snapshot: tie,
                      ),
                    ),
                  );
                },
                child: _buildCategoryProduct(
                  image: tieIconData!.image,
                  color: 0xfff338dd,
                ),
              ),
              GestureDetector(
                onTap: () {
                  Navigator.of(context).pushReplacement(
                    MaterialPageRoute(
                      builder: (ctx) => ListProduct(
                        name: "Shirts",
                        snapshot: shirt,
                      ),
                    ),
                  );
                },
                child: _buildCategoryProduct(
                  image: shirtsIconData!.image,
                  color: 0xff4ff2af,
                ),
              ),
              GestureDetector(
                onTap: () {
                  Navigator.of(context).pushReplacement(
                    MaterialPageRoute(
                      builder: (ctx) => ListProduct(
                        name: "Shoes",
                        snapshot: shoes,
                      ),
                    ),
                  );
                },
                child: _buildCategoryProduct(
                  image: shoesIconData!.image,
                  color: 0xff74acf7,
                ),
              ),
              GestureDetector(
                onTap: () {
                  Navigator.of(context).pushReplacement(
                    MaterialPageRoute(
                      builder: (ctx) => ListProduct(
                        name: "Pants",
                        snapshot: pant,
                      ),
                    ),
                  );
                },
                child: _buildCategoryProduct(
                  image: pantsIconData!.image,
                  color: 0xff33dcfd,
                ),
              ),
            ],
          ),
        ),
      ),
    ],
  );
}
