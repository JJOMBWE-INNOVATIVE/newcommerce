import 'package:flutter/material.dart';
import 'package:newcommerce/screens/homepage.dart';

class ListProduct extends StatelessWidget {
  ListProduct({super.key, this.isCategory,  this.name});

  final String? name;
  bool? isCategory = true;

  Widget SingleProduct({String? name, double? price, String? image}) {
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

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0.0,
        leading: IconButton(
          icon: const Icon(
            Icons.arrow_back,
            color: Colors.black,
          ),
          onPressed: () {
            Navigator.of(context).pushReplacement(
              MaterialPageRoute(
                builder: (ctx) => HomePage(),
              ),
            );
          },
        ),
        actions: [
          IconButton(
            onPressed: () {},
            icon: const Icon(Icons.search, color: Colors.black),
          ),
          IconButton(
            onPressed: () {},
            icon: const Icon(Icons.notifications_none, color: Colors.black),
          ),
        ],
      ),
      body: Container(
        margin: const EdgeInsets.symmetric(horizontal: 20),
        child: ListView(
          children: [
            Column(
              children: [
                 SizedBox(
                  height: 50,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            name ?? '',
                            style: TextStyle(
                              fontSize: 17,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
                SizedBox(height: 10,),
                SizedBox(
                  height: 700,
                  child: GridView.count(
                    mainAxisSpacing: 20,
                    childAspectRatio: 0.65,
                    crossAxisCount: 2,
                    children: [
                  SingleProduct(name: "Men Shirt",image: "man.jpg", price: 50.0,),
                  SingleProduct(name: "Camera",image: "camera.jpg",price: 200.0,),
                   SingleProduct(name: "Men Shirt",image: "man.jpg", price: 50.0,),
                  SingleProduct(name: "Camera",image: "camera.jpg",price: 200.0,),
                   SingleProduct(name: "Men Shirt",image: "man.jpg", price: 50.0,),
                  SingleProduct(name: "Camera",image: "camera.jpg",price: 200.0,),
                   SingleProduct(name: "Men Shirt",image: "man.jpg", price: 50.0,),
                  SingleProduct(name: "Camera",image: "camera.jpg",price: 200.0,),
                  SingleProduct(name: "Men Shirt",image: "man.jpg", price: 50.0,),
                  SingleProduct(name: "Camera",image: "camera.jpg",price: 200.0,),
                   SingleProduct(name: "Men Shirt",image: "man.jpg", price: 50.0,),
                  SingleProduct(name: "Camera",image: "camera.jpg",price: 200.0,),
                   SingleProduct(name: "Men Shirt",image: "man.jpg", price: 50.0,),
                  SingleProduct(name: "Camera",image: "camera.jpg",price: 200.0,),
                   SingleProduct(name: "Men Shirt",image: "man.jpg", price: 50.0,),
                  SingleProduct(name: "Camera",image: "camera.jpg",price: 200.0,),
                  ],
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
