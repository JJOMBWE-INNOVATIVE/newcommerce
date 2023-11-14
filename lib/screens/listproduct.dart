

import 'package:flutter/material.dart';
import 'package:newcommerce/model/product.dart';
import 'package:newcommerce/provider/category_provider.dart';
import 'package:newcommerce/provider/product_provider.dart';
import 'package:newcommerce/screens/detailscreen.dart';
import 'package:newcommerce/screens/homepage.dart';
import 'package:newcommerce/screens/search_category.dart';
import 'package:newcommerce/screens/search_product.dart';
import 'package:newcommerce/widgets/notification_button.dart';
import 'package:newcommerce/widgets/singleproduct.dart';
import 'package:provider/provider.dart';

class ListProduct extends StatelessWidget {
  final String? name;
  final bool? isCategory;
  final List<Product>? snapShot;
  final snapshot;
  CategoryProvider categoryProvider = CategoryProvider(); 
  ProductProvider productProvider = ProductProvider();

  ListProduct({
    super.key,
    this.snapshot,
    this.name,
    this.isCategory,
    this.snapShot,
  });


  Widget _buildTopName() {
    return Column(
      children: <Widget>[
        SizedBox(
          height: 50,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.end,
            children: <Widget>[
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: <Widget>[
                  Text(
                    name??"",
                    style: const TextStyle(fontSize: 17, fontWeight: FontWeight.bold),
                  ),
                ],
              ),
            ],
          ),
        )
      ],
    );
  }

  Widget _buildMyGridView(context) {
    final Orientation orientation = MediaQuery.of(context).orientation;

    return SizedBox(
      height: 700,
      child: GridView.builder(
                    scrollDirection: Axis.vertical,
                    itemCount: snapshot.data.docs.length,
                    itemBuilder: (context, index) => 
                    GestureDetector(
                      onTap: (){
                        Navigator.of(context).pushReplacement(
                        MaterialPageRoute(
                        builder: (ctx) => DetailScreen(
                          image: snapshot.data.docs[index]["image"],
                          name: snapshot.data.docs[index]["name"],
                           price: snapshot.data.docs[index]["price"],
                        )));
                      },
                      child: SingleProduct(
                        name: snapshot.data.docs[index]["name"],
                        price: snapshot.data.docs[index]["price"],
                        image: snapshot.data.docs[index]["image"],
                      ),
                    ),
                    gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                      crossAxisCount: 2,
                      childAspectRatio: 0.65,
                      crossAxisSpacing: 10,
                      mainAxisSpacing: 10
                      ),
                  ),
  );
  }

  //CategoryProvider categoryProvider;
  //ProductProvider productProvider;
  Widget _buildSearchBar(context) {
    return isCategory == true
        ? IconButton(
            icon: const Icon(
              Icons.search,
              color: Colors.black,
            ),
            onPressed: () {
              categoryProvider.getsearchList(list: snapShot);
              showSearch(context: context, delegate: SearchCategory());
            },
          )
        : IconButton(
            icon: const Icon(
              Icons.search,
              color: Colors.black,
            ),
            onPressed: () {
              productProvider.getsearchList(list: snapShot);
              showSearch(context: context, delegate: SearchProduct());
            },
          );
  }

  @override
  Widget build(BuildContext context) {
    categoryProvider = Provider.of<CategoryProvider>(context);
    productProvider = Provider.of<ProductProvider>(context);
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
                  builder: (ctx) => const HomePage(),
                ),
              );
            }),
        actions: <Widget>[
          _buildSearchBar(context),
          const NotificationButton(),
        ],
      ),
      body: Container(
        margin: const EdgeInsets.symmetric(horizontal: 20),
        child: ListView(
          children: <Widget>[
            _buildTopName(),
            const SizedBox(
              height: 10,
            ),
            _buildMyGridView(context),
          ],
        ),
      ),
    );
  }
}