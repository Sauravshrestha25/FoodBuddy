import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_application_0/core/store.dart';
import 'package:flutter_application_0/utils/routess.dart';

import 'package:flutter_application_0/widgets/head.dart';
import 'package:velocity_x/velocity_x.dart';
import 'package:flutter_application_0/models/food.dart';
import '../models/CartModel.dart';

class items extends StatelessWidget {
  const items({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xffffcc00),
      body: ListView(
        children: [
          _itemsbar(),
          Padding(
            padding: const EdgeInsets.only(left: 30, right: 30, top: 20),
            child: Placeholder(
              color: Colors.transparent,
              fallbackHeight: 110,
              child: head(),
            ),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 30, vertical: 0),
            child: Placeholder(
              color: Colors.transparent,
              fallbackHeight: 660,
              child: _items(),
            ),
          ),
        ],
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.endFloat,
      floatingActionButton: Padding(
        padding: const EdgeInsets.only(bottom: 0),
        child: Container(
          height: 80,
          width: 80,
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(80),
            boxShadow: [
              BoxShadow(
                color: Colors.grey.withOpacity(0.5),
                spreadRadius: 2,
                blurRadius: 10,
                offset: Offset(0, 3),
              )
            ],
          ),
          child: FloatingActionButton(
            shape: CircleBorder(),
            backgroundColor: Color(0xff2a2828),
            onPressed: () => Navigator.pushNamed(context, MyRoutes.cartRoute),
            child: Icon(
              CupertinoIcons.bag_fill,
              color: Colors.white,
              size: 30,
            ),
          ),
        ),
      ),
    );
  }
}

class _itemsbar extends StatelessWidget {
  const _itemsbar({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.all(10),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          InkWell(
            onTap: () {
              Navigator.pop(
                context,
              );
            },
            child: Container(
              height: 60,
              width: 60,
              padding: EdgeInsets.all(8),
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(60),
                boxShadow: [
                  BoxShadow(
                    color: Colors.grey.withOpacity(0.5),
                    spreadRadius: 2,
                    blurRadius: 10,
                    offset: Offset(0, 3),
                  )
                ],
              ),
              child: Icon(CupertinoIcons.arrow_left),
            ),
          ),
          Text(
            "Restaurants",
            style: TextStyle(
              fontSize: 22,
              fontWeight: FontWeight.bold,
            ),
          ),
          InkWell(
            onTap: () {
              Navigator.pushNamed(context, MyRoutes.favouritesRoute);
            },
            child: Container(
              height: 60,
              width: 60,
              padding: EdgeInsets.all(8),
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(60),
                boxShadow: [
                  BoxShadow(
                    color: Colors.grey.withOpacity(0.5),
                    spreadRadius: 2,
                    blurRadius: 10,
                    offset: Offset(0, 3),
                  )
                ],
              ),
              child: Icon(
                CupertinoIcons.heart_fill,
                color: Colors.black,
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class _items extends StatelessWidget {
  const _items({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
        itemCount: FoodModel.items.length,
        itemBuilder: (context, index) => Column(
              children: [
                Padding(
                  padding: const EdgeInsets.only(top: 10),
                  child: Container(
                    height: 40,
                    width: 200,
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(20),
                        color: Color(0xff181516)),
                    child: Padding(
                      padding: const EdgeInsets.only(top: 5),
                      child: Text(
                        "Food Name",
                        textAlign: TextAlign.center,
                        style: TextStyle(
                          fontSize: 20,
                          fontWeight: FontWeight.w500,
                          color: Colors.white,
                        ),
                      ),
                    ),
                  ),
                ),
                Placeholder(
                  color: Colors.transparent,
                  fallbackHeight: 220,
                  child: _itemsname(item: FoodModel.items[index]),
                )
              ],
            ));
  }
}

class _itemsname extends StatelessWidget {
  final Foods item;
  const _itemsname({super.key, required this.item});

  @override
  Widget build(BuildContext context) {
    VxState.watch(context, on: [AddMutation, RemoveMutation]);
    final CartModel _cart = (VxState.store as MyStore).cart;
    bool isinCart = _cart.items?.contains(item) ?? false;
    return ListView.builder(
        itemCount: 1,
        itemBuilder: (context, index) => Padding(
              padding: const EdgeInsets.only(top: 5),
              child: Container(
                height: 67,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(20),
                  color: Colors.white,
                ),
                child: Padding(
                  padding:
                      const EdgeInsets.symmetric(horizontal: 20, vertical: 5),
                  child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              item.name,
                              style: TextStyle(
                                fontSize: 16,
                                fontWeight: FontWeight.w600,
                                color: Colors.black,
                              ),
                            ),
                            Row(
                              children: [
                                Text(
                                  "Rs.",
                                  style: TextStyle(
                                    color: Colors.black,
                                    fontSize: 16,
                                    fontWeight: FontWeight.w500,
                                  ),
                                ),
                                Text(
                                  item.price.toString(),
                                  style: TextStyle(
                                    color: Colors.black,
                                    fontSize: 16,
                                    fontWeight: FontWeight.w500,
                                  ),
                                ),
                              ],
                            ),
                          ],
                        ),
                        TextButton(
                            onPressed: () {},
                            child: Text(
                              "macros",
                              style: TextStyle(
                                  fontSize: 12,
                                  fontWeight: FontWeight.w500,
                                  color: Colors.green),
                            )),
                        // InkWell(
                        //   onTap: () {
                        //     ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                        //         content: Text(
                        //       "Add to cart is not supporting yet.",
                        //       textAlign: TextAlign.center,
                        //     )));
                        //   },
                        //   child: Container(
                        //     height: 40,
                        //     width: 40,
                        //     decoration: BoxDecoration(
                        //         shape: BoxShape.circle,
                        //         border:
                        //             Border.all(width: 2, color: Colors.black)),
                        //     child: Icon(
                        //       CupertinoIcons.bag_fill,
                        //       color: Colors.black,
                        //     ),
                        //   ),
                        // ),
                        InkWell(
                          onTap: () {
                            if (!isinCart) {
                              AddMutation(item);
                            }
                          },
                          child: isinCart
                              ? Container(
                                  height: 40,
                                  width: 40,
                                  decoration: BoxDecoration(
                                      shape: BoxShape.circle,
                                      border: Border.all(
                                          width: 2, color: Colors.black)),
                                  child: Icon(
                                    Icons.done,
                                    color: Colors.black,
                                  ),
                                )
                              : Container(
                                  height: 40,
                                  width: 40,
                                  decoration: BoxDecoration(
                                      shape: BoxShape.circle,
                                      border: Border.all(
                                          width: 2, color: Colors.black)),
                                  child: Icon(
                                    CupertinoIcons.bag_fill,
                                    color: Colors.black,
                                  ),
                                ),
                        ),
                      ]),
                ),
              ),
            ));
  }
}
