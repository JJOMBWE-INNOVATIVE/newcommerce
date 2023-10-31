
import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:newcommerce/screens/detailscreen.dart';
import 'package:newcommerce/screens/listproduct.dart';
import 'package:newcommerce/widgets/mycarousel.dart';
import 'package:newcommerce/widgets/singleproduct.dart';





class HomePage extends StatefulWidget {
   HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
Widget _buildFeaturedProduct({String? name, double? price, String? image}) {
  return Card(
    child: Container(
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

Widget _buildCategoryProduct({String? image,int? color}){
return CircleAvatar(
      maxRadius: 38,
      backgroundColor: Color(color!),
      child: Container(
        height: 40,
        child: Image(
           color: Colors.white,
          image: AssetImage("images/$image"),
       ),
      ),
  );
}

 bool homeColor = true;

 bool cartColor = true;

 bool aboutColor = true;

 bool contactColor = true;

 bool logoutColor = true;

final GlobalKey<ScaffoldState> _key = GlobalKey<ScaffoldState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: _key,
      drawer:  Drawer(
        child: ListView(
          children: [
            const UserAccountsDrawerHeader(
              accountName: Text("Jjombwe Nathan",style: TextStyle(
                color: Colors.black
              ),), 
              accountEmail: Text("mpindi@gmail.com",style: TextStyle(
                color: Colors.black
              ),),
              decoration:  BoxDecoration(
                color: Color(0xfff2f2f2)
              ),
              currentAccountPicture: CircleAvatar(
                radius: 25,
                backgroundImage:AssetImage("images/userImage.png"),
              ),
              ),
              ListTile(
                selected: homeColor,
                onTap: () { 
                  setState(() {
                    homeColor = true;
                    cartColor = false;
                    aboutColor = false;
                    contactColor = false;
                    logoutColor = false;
                  });
                },
                leading: Icon(Icons.home),
                title: Text("Home"),
              ),
              ListTile(
                selected: cartColor,
                onTap: () { 
                   setState(() {
                    cartColor = true;
                    homeColor = false;
                    aboutColor = false;
                    contactColor = false;
                    logoutColor = false;
                  });
                },
                leading: Icon(Icons.shopping_cart),
                title: Text("Cart"),
              ),
              ListTile(
                selected: aboutColor,
                onTap: () { 
                  setState(() {
                    aboutColor = true;
                    homeColor = false;
                    cartColor = false;
                    contactColor = false;
                    logoutColor = false;
                  });
                },
                leading: Icon(Icons.info),
                title: Text("About us"),
              ),
              ListTile(
                selected: contactColor,
                onTap: () { 
                  setState(() {
                    contactColor = true;
                    homeColor = false;
                    cartColor = false;
                    aboutColor = false;
                    logoutColor = false;
                  });
                },
                leading: Icon(Icons.phone),
                title: Text("Contact Us"),
              ),
              ListTile(
                selected: logoutColor,
                onTap: () { 
                  setState(() {
                    logoutColor = true;
                    homeColor = false;
                    cartColor = false;
                    aboutColor = false;
                    contactColor = false;
                  });
                },
                leading: Icon(Icons.exit_to_app),
                title: Text("Logout"),
              ),
          ],
        ),
      ),
      appBar: AppBar(
        title: const Text("HomePage",style: TextStyle(
          color: Colors.black
        ),),
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
            onPressed: (){}, 
            icon: const Icon(Icons.search,
            color: Colors.black,
            )),
          IconButton(
            onPressed: (){}, 
            icon: const Icon(Icons.notifications_none,
            color: Colors.black,
            ),),
        ],
      ),
      body: Container(
        height: double.infinity,
        width: double.infinity,
        margin: const EdgeInsets.symmetric(horizontal: 20),
        child: ListView(
          children: [
            Column(
              children: [

                Container(
                  height: 250,
                  child: MyCarousel() ,
                ),

                 Container(
                  height: 50,
                child: const
                  Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text("Categories",
                    style: TextStyle(
                      fontSize: 17,
                      fontWeight: FontWeight.bold,
                    ),
                    ),
                  ],
                ),
              ),
                      Container( 
                height: 50,
                child: SingleChildScrollView(
                  scrollDirection: Axis.horizontal,
                  child: Row(
                    children: [
              _buildCategoryProduct(image: "womenss.jpeg",color: 0xff33dcfd),
                    _buildCategoryProduct(image: "kids.jpeg",color: 0xfff338dd),
                    _buildCategoryProduct(image: "grooming.jpeg",color: 0xff4ff2af),
                      _buildCategoryProduct(image: "about.png",color: 0xff74acf7),
                      _buildCategoryProduct(image: "shopping.png",color: 0xff33dcfd),
          _buildCategoryProduct(image: "mans.jpeg",color: 0xfffc6c8d)
                    ],
                  ),
                ),
              ),
                 SizedBox(
                  height: 120,
                  width: double.infinity,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                     
                      Container(
                        height: 50,
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
                                      Navigator.of(context).pushReplacement
                                      (MaterialPageRoute(builder: 
                                      (ctx)=> ListProduct(name: "Featured"),
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
                            (ctx)=> DetailScreen(
                              name: "Shirt for men",
                              price: "500",
                              image: "images/man.jpg",
                            ),
                            ),
                            );
                          },
                              child: SingleProduct(
                              name: "Men Shirt",
                              image: "man.jpg",
                              price: 50.0
                              ),
                            ),
                            GestureDetector(
                              onTap: (){
                            Navigator.of(context).pushReplacement
                            (MaterialPageRoute(builder: 
                            (ctx)=> DetailScreen(
                              name: "Shoes for men",
                              price: "700",
                              image: "images/shoes.jpeg",
                            ),
                            ),
                            );
                          },
                              child: SingleProduct(name: "Camera",
                              image: "camera.jpg",
                              price: 200.0
                              ),
                            ),
                          ],
                        ),
                      ],
                    ),
                  ],
                ),
              Container(
                height: 50,
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
                            (ctx)=> ListProduct(name: "New Achives"),
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
                  _buildFeaturedProduct(name: "Men Shirt",
                  image: "man.jpg",
                  price: 50.0
                  ),
                  _buildFeaturedProduct(name: "Camera",
              image: "camera.jpg",
              price: 200.0
              ),
                ],
              ),
              
              ],
            ),
          ],
        ),
      ),
    );
  }
}