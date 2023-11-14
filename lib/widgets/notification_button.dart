import 'package:badges/badges.dart' as Badges;
import 'package:flutter/material.dart';
import 'package:newcommerce/provider/product_provider.dart';
import 'package:provider/provider.dart';

class NotificationButton extends StatelessWidget {
 const NotificationButton({super.key});

 

  @override
  Widget build(BuildContext context) {
   ProductProvider  productProvider = Provider.of<ProductProvider>(context);
    return Badges.Badge(
      position: Badges.BadgePosition.topEnd(top: 8, end: 25),
      badgeContent: Text(
        productProvider.getNotificationIndex.toString(),
      style: const TextStyle(
        color: Colors.white,
        fontWeight: FontWeight.bold
      ),),
      child: IconButton(
        onPressed: () {},
        icon: const Icon(
          Icons.notifications_none,
          color: Colors.black,
        ),
      ),
    );
  }
}
