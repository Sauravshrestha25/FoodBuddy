import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_application_0/core/store.dart';
import 'package:flutter_application_0/models/CartModel.dart';
import 'package:flutter_application_0/models/food.dart';
import 'package:velocity_x/velocity_x.dart';

class popularitemWidget extends StatelessWidget {
  final Foods item;

  const popularitemWidget({super.key, required this.item});

  @override
  Widget build(BuildContext context) {
    VxState.watch(context, on: [AddMutation, RemoveMutation]);
    final CartModel _cart = (VxState.store as MyStore).cart;
    bool isInCart = _cart.items?.contains(item) ?? false;
    return Padding(
      padding: const EdgeInsets.all(10),
      child: Container(
        height: 150,
        width: 150,
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(30), color: Color(0xffa9411d)),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            InkWell(
              onTap: () {},
              child: CircleAvatar(
                radius: 45,
                backgroundColor: Colors.white,
                backgroundImage: AssetImage(
                  item.image,
                  // "assets/images/Yakisoba Noodles.jpg",
                ),
              ),
            ),
            Text(
              item.name,
              // "Yakisoba Noodles",
              style: TextStyle(
                fontSize: 12,
                fontWeight: FontWeight.bold,
                color: Colors.white,
              ),
            ),
            Text(
              item.restaurant,
              // "Noodles with pork",
              style: TextStyle(
                fontSize: 8,
                fontWeight: FontWeight.bold,
                color: Color(0xfff8bf40),
              ),
            ),
            Row(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  "Rs.",
                  // "Rs.1Text(
                  style: TextStyle(
                    fontSize: 12,
                    fontWeight: FontWeight.bold,
                    color: Colors.white,
                  ),
                ),
                Text(
                  item.price.toString(),
                  // "Rs.1Text(
                  style: TextStyle(
                    fontSize: 12,
                    fontWeight: FontWeight.bold,
                    color: Colors.white,
                  ),
                ),
              ],
            ),
            InkWell(
              onTap: () {
                if (!isInCart) {
                  AddMutation(item);
                }
              },
              child: isInCart
                  ? Container(
                      height: 40,
                      width: 40,
                      decoration: BoxDecoration(
                          shape: BoxShape.circle,
                          border: Border.all(width: 2, color: Colors.white)),
                      child: Icon(
                        Icons.done,
                        color: Colors.white,
                      ),
                    )
                  : Container(
                      height: 40,
                      width: 40,
                      decoration: BoxDecoration(
                          shape: BoxShape.circle,
                          border: Border.all(width: 2, color: Colors.white)),
                      child: Icon(
                        CupertinoIcons.bag_fill,
                        color: Colors.white,
                      ),
                    ),
            ),
          ],
        ),
      ),
    );
  }
}
