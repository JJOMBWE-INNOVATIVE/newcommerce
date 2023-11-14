import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:newcommerce/model/CategoryIcons.dart';
import 'package:newcommerce/provider/product_provider.dart';
import 'package:newcommerce/screens/search_category.dart';
import 'package:newcommerce/widgets/category.dart';
import 'package:newcommerce/widgets/drawer.dart';
import 'package:newcommerce/widgets/featured.dart';
import 'package:newcommerce/widgets/mycarousel.dart';
import 'package:newcommerce/widgets/newachives.dart';
import 'package:newcommerce/widgets/notification_button.dart';
import 'package:provider/provider.dart';
import '../model/product.dart';
import '../provider/category_provider.dart';

class HomePage extends StatefulWidget {
  const HomePage({
    super.key,
  });

  @override
  State<HomePage> createState() => _HomePageState();
}

Product? menData;
Product? womenWatchData;
Product? pcData;
Product? systemUnitData;
CategoryIcon? dressIconData;
CategoryIcon? tieIconData;
CategoryIcon? shoesIconData;
CategoryIcon? pantsIconData;
CategoryIcon? shirtsIconData;
var shirtsIcon;
var pantsIcon;
var shoesIcon;
var tieIcons;
var dressIcons;
var mySnapShot;
var newAchiveSnapShot;
var shirt;
var dress;
var pant;
var tie;
var shoes;
CategoryProvider? provider;



class _HomePageState extends State<HomePage> {
  final GlobalKey<ScaffoldState> _key = GlobalKey<ScaffoldState>();

  @override
  Widget build(BuildContext context) {
   ProductProvider productProvider = Provider.of<ProductProvider>(context);
    productProvider.getUserData();
    print(productProvider);
    return Scaffold(
      key: _key,
      drawer: const MyDrawer(),
      appBar: AppBar(
        title: const Text(
          "HomePage",
          style: TextStyle(
            color: Colors.black,
          ),
        ),
        centerTitle: true,
        elevation: 0.0,
        leading: IconButton(
          onPressed: () {
            _key.currentState!.openDrawer();
          },
          icon: const Icon(Icons.menu),
          color: Colors.black,
        ),
        backgroundColor: Colors.grey[100],
        actions: [
          IconButton(
            onPressed: () {
              showSearch(context: context,
               delegate: SearchCategory());
            },
            icon: const Icon(Icons.search, color: Colors.black),
           
          ),
           const NotificationButton(),
        
        ],
      ),

 /////////////////// featured
      body: FutureBuilder(
        future: FirebaseFirestore.instance
            .collection("products")
            .doc("rrfecs2IRdVrxokNP3Aa")
            .collection("featureproducts")
            .get(),
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return const Center(child: CircularProgressIndicator());
          }

          mySnapShot = snapshot;
          menData = Product(
            image: snapshot.data?.docs[0]["image"],
            name: snapshot.data?.docs[0]["name"],
            price: snapshot.data?.docs[0]["price"],
          );

          womenWatchData = Product(
            image: snapshot.data?.docs[1]["image"],
            name: snapshot.data?.docs[1]["name"],
            price: snapshot.data?.docs[1]["price"],
          );

/////////////////////////////////////////////// category shirt

          return FutureBuilder(
            future: FirebaseFirestore.instance
                .collection("category")
                .doc("y3Fu43S2iYZsSE9N2L71")
                .collection("shirt")
                .get(),
            builder: (context, shirtsnapshot) {
              if (shirtsnapshot.connectionState == ConnectionState.waiting) {
                return const Center(child: CircularProgressIndicator());
              }

              shirt = shirtsnapshot;


///////////////////////////// category dress

          return FutureBuilder(
            future: FirebaseFirestore.instance
                .collection("category")
                .doc("y3Fu43S2iYZsSE9N2L71")
                .collection("dress")
                .get(),
            builder: (context, dresssnapshot) {
              if (dresssnapshot.connectionState == ConnectionState.waiting) {
                return const Center(child: CircularProgressIndicator());
              }

              dress = dresssnapshot;

/////////////////////////// category ties

          return FutureBuilder(
            future: FirebaseFirestore.instance
                .collection("category")
                .doc("y3Fu43S2iYZsSE9N2L71")
                .collection("tie")
                .get(),
            builder: (context, tiesnapshot) {
              if (tiesnapshot.connectionState == ConnectionState.waiting) {
                return const Center(child: CircularProgressIndicator());
              }

              tie = tiesnapshot;

/////////////////////////// category pants

          return FutureBuilder(
            future: FirebaseFirestore.instance
                .collection("category")
                .doc("y3Fu43S2iYZsSE9N2L71")
                .collection("pant")
                .get(),
            builder: (context, pantsnapshot) {
              if (pantsnapshot.connectionState == ConnectionState.waiting) {
                return const Center(child: CircularProgressIndicator());
              }

              pant = pantsnapshot;


/////////////////////////// category Shoes

          return FutureBuilder(
            future: FirebaseFirestore.instance
                .collection("category")
                .doc("y3Fu43S2iYZsSE9N2L71")
                .collection("shoes")
                .get(),
            builder: (context, shoesnapshot) {
              if (shoesnapshot.connectionState == ConnectionState.waiting) {
                return const Center(child: CircularProgressIndicator());
              }

              shoes = shoesnapshot;


/////////////////////////// category dress icon

          return FutureBuilder(
            future: FirebaseFirestore.instance
                .collection("categoryIcons")
                .doc("vBhYOKOTVmPqy7H8WE7Y")
                .collection("dressicon")
                .get(),
            builder: (context, snapshot) {
              if (snapshot.connectionState == ConnectionState.waiting) {
                return const Center(child: CircularProgressIndicator());
              }
              dressIcons = snapshot;
              dressIconData = CategoryIcon(
                image: snapshot.data?.docs[2]["image"],
                  );
              
             
/////////////////////////// category tie icon

          return FutureBuilder(
            future: FirebaseFirestore.instance
                .collection("categoryIcons")
                .doc("vBhYOKOTVmPqy7H8WE7Y")
                .collection("dressicon")
                .get(),
            builder: (context, snapshot) {
              if (snapshot.connectionState == ConnectionState.waiting) {
                return const Center(child: CircularProgressIndicator());
              }
              tieIcons = snapshot;
              tieIconData = CategoryIcon(
                image: snapshot.data?.docs[4]["image"],
                  );

/////////////////////////// category shoes icon

          return FutureBuilder(
            future: FirebaseFirestore.instance
                .collection("categoryIcons")
                .doc("vBhYOKOTVmPqy7H8WE7Y")
                .collection("dressicon")
                .get(),
            builder: (context, snapshot) {
              if (snapshot.connectionState == ConnectionState.waiting) {
                return const Center(child: CircularProgressIndicator());
              }
              shoesIcon = snapshot;
              shoesIconData = CategoryIcon(
                image: snapshot.data?.docs[1]["image"],
                  );

////////////////////////// category pants icon

          return FutureBuilder(
            future: FirebaseFirestore.instance
                .collection("categoryIcons")
                .doc("vBhYOKOTVmPqy7H8WE7Y")
                .collection("dressicon")
                .get(),
            builder: (context, snapshot) {
              if (snapshot.connectionState == ConnectionState.waiting) {
                return const Center(child: CircularProgressIndicator());
              }
              pantsIcon = snapshot;
              pantsIconData = CategoryIcon(
                image: snapshot.data?.docs[0]["image"],
                  );

////////////////////////// category shirts icon

          return FutureBuilder(
            future: FirebaseFirestore.instance
                .collection("categoryIcons")
                .doc("vBhYOKOTVmPqy7H8WE7Y")
                .collection("dressicon")
                .get(),
            builder: (context, snapshot) {
              if (snapshot.connectionState == ConnectionState.waiting) {
                return const Center(child: CircularProgressIndicator());
              }
              shirtsIcon = snapshot;
              shirtsIconData = CategoryIcon(
                image: snapshot.data?.docs[3]["image"],
                  );

            
////////////////////// new achives
              return FutureBuilder(
                future: FirebaseFirestore.instance
                    .collection("products")
                    .doc("rrfecs2IRdVrxokNP3Aa")
                    .collection("newachives")
                    .get(),
                builder: (context, snapshot) {
                  if (snapshot.connectionState == ConnectionState.waiting) {
                    return const Center(child: CircularProgressIndicator());
                  }
                  newAchiveSnapShot = snapshot;
                  pcData = Product(
                    image: snapshot.data?.docs[0]["image"],
                    name: snapshot.data?.docs[0]["name"],
                    price: snapshot.data?.docs[0]["price"],
                  );
                  systemUnitData = Product(
                    image: snapshot.data?.docs[1]["image"],
                    name: snapshot.data?.docs[1]["name"],
                    price: snapshot.data?.docs[1]["price"],
                  );

///////////// resst of the body
                  return Container(
                    height: double.infinity,
                    width: double.infinity,
                    margin: const EdgeInsets.symmetric(horizontal: 20),
                    child: ListView(
                      children: [
                        Column(
                          children: [
                             SizedBox(
                              height: 250,
                              child:myCarousel() ,
                            ),
                            MyCategory(context),
                            SizedBox(
                              width: double.infinity,
                              child: Column(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  MyFeatured(context),
                                  MyNewAchives(context),
                                ],
                              ),
                            ),
                          ],
                        ),
                      ],
                    ),
                  );
                },
              );
            },
          );
        },
        );
  }
  );
  }
  );
   } 
   );
  }
  );
  });
   }
    );
  });
  });
   } )
    );
  }
}

