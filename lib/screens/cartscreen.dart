

// import 'package:flutter/material.dart';
// import 'package:newcommerce/provider/product_provider.dart';
// import 'package:newcommerce/screens/homepage.dart';
// import 'package:newcommerce/widgets/notification_button.dart';
// import 'package:newcommerce/widgets/singlecart.dart';
// import 'package:provider/provider.dart';

// import 'checkout.dart';



// class CartScreen extends StatefulWidget {
//    CartScreen({
//     super.key,
//      this.image,
//      this.name,
//      this.price,
//      this.quantity
//     });

//   final String? image;
//   final String? name;
//   final double? price;
//     int? quantity;

//   @override
//   State<CartScreen> createState() => _CartScreenState();
// }

// class _CartScreenState extends State<CartScreen> {
//   int count = 1;
//   final TextStyle myStyle = const TextStyle(
//     fontSize: 18
//   );
//  ProductProvider? productProvider;

//   @override
//   Widget build(BuildContext context) {
//  final productProvider = Provider.of<ProductProvider>(context);
// print(productProvider);
//     return Scaffold(
//       bottomNavigationBar: Container(
//         height: 60,
//         width: 100,
//         margin: const EdgeInsets.symmetric(horizontal: 10),
//         padding: const EdgeInsets.only(bottom: 10),
//         child: ElevatedButton(
//           onPressed: () {
//             productProvider.addNotification("Notification");
//             Navigator.of(context).pushReplacement
//             (MaterialPageRoute(builder: 
//             (ctx)=>  CheckOut(),
//             ),
//             );
//           },
//           style: ButtonStyle(
//           backgroundColor:
//             MaterialStateProperty.all<Color>(const Color(0xff746bc9)),
//             shape:MaterialStateProperty.all<RoundedRectangleBorder>(
//             RoundedRectangleBorder(
//                 borderRadius: BorderRadius.circular(20)
//             ),
//             ),
//             ),
//           child: const Text("Continue",style:TextStyle(fontSize: 18),),
//         ),
//       ),
//       appBar: AppBar(
//         centerTitle: true,
//         title: const Text("Cart Page",style:TextStyle(
//           color: Colors.black
//         ),
        
//         ),
//         backgroundColor: Colors.transparent,
//         elevation: 0.0,
//         leading: IconButton(
//           onPressed: (){
//             Navigator.of(context).pushReplacement
//             (MaterialPageRoute(builder: 
//             (ctx)=> const HomePage(),
//             ),
//             );

//           }, 
//           icon: const Icon(Icons.arrow_back,color: Colors.black,),
//           ),
//           actions: const [
//            NotificationButton(),
//           ],
//       ),
//       body:
//        ListView.builder(
//          itemCount: productProvider.getCartModelListLength,
//         itemBuilder: (context, index) {
//          final cartModel = productProvider.getCartModelList[index];
//          return CartSingleProduct(
//           index: index,
//           isCount: false,
//               image: cartModel.image ?? "",
//               name: cartModel.name ?? "",
//               price: cartModel.price ?? 0.0,
//              quantity: cartModel.quantity ?? 0,
//             );
                  
//         },
         
//        ),
//       );
//     }
//   }