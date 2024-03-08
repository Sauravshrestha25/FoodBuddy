import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_application_0/core/store.dart';
import 'package:flutter_application_0/models/CartModel.dart';
import 'package:flutter_application_0/utils/routess.dart';
import 'package:flutter_application_0/widgets/CartBarWidget.dart';
import 'package:velocity_x/velocity_x.dart';

class CartPage extends StatelessWidget {
  const CartPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xffffcc00),
      body: ListView(
        children: [
          CartBarWidget(),
          SizedBox(
            height: 30,
          ),
          Placeholder(
            color: Colors.transparent,
            fallbackHeight: 300,
            child: _cartlist(),
          ),
          SizedBox(
            height: 60,
          ),
          _cartTotal(),
          Padding(
            padding: const EdgeInsets.all(10),
            child: ElevatedButton(
                onPressed: () {
                  Navigator.pushNamed(context, MyRoutes.paymentRoute);
                },
                style: ElevatedButton.styleFrom(
                  fixedSize: Size(200, 60),
                  primary: Color(0xffff7f50),
                  onPrimary: Colors.white,
                ),
                child: Text("Checkout")),
          ),
        ],
      ),
    );
  }
}

class _cartTotal extends StatelessWidget {
  const _cartTotal({super.key});

  @override
  Widget build(BuildContext context) {
    final CartModel _cart = (VxState.store as MyStore).cart;
    return Padding(
      padding: const EdgeInsets.all(10),
      child: Container(
        height: 200,
        decoration: BoxDecoration(
            color: Colors.white, borderRadius: BorderRadius.circular(20)),
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.all(10),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Text(
                    "Sub total",
                    style: TextStyle(
                      fontSize: 14,
                      fontWeight: FontWeight.w500,
                      color: Colors.black,
                    ),
                  ),
                  Row(
                    children: [
                      Text(
                        "Rs ",
                        style: TextStyle(
                          fontSize: 14,
                          fontWeight: FontWeight.w500,
                          color: Colors.black,
                        ),
                      ),
                      VxBuilder(
                        mutations: {RemoveMutation},
                        builder: (context, store, status) {
                          return Text(
                            _cart.totalPrice.toString(),
                            style: TextStyle(
                              fontSize: 14,
                              fontWeight: FontWeight.w500,
                              color: Colors.black,
                            ),
                          );
                        },
                      ),
                    ],
                  )
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(10),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Text(
                    "Taxes & fees",
                    style: TextStyle(
                      fontSize: 14,
                      fontWeight: FontWeight.w500,
                      color: Colors.black,
                    ),
                  ),
                  Text(
                    "Rs 0",
                    style: TextStyle(
                      fontSize: 14,
                      fontWeight: FontWeight.w500,
                      color: Colors.black,
                    ),
                  )
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(10),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Text(
                    "Delivery fee",
                    style: TextStyle(
                      fontSize: 14,
                      fontWeight: FontWeight.w500,
                      color: Colors.black,
                    ),
                  ),
                  Text(
                    "Rs 0",
                    style: TextStyle(
                      fontSize: 14,
                      fontWeight: FontWeight.w500,
                      color: Colors.black,
                    ),
                  )
                ],
              ),
            ),
            Divider(),
            Padding(
              padding: const EdgeInsets.all(10),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Text(
                    "Total Price",
                    style: TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.w600,
                      color: Colors.black,
                    ),
                  ),
                  Row(
                    children: [
                      Text(
                        "Rs ",
                        style: TextStyle(
                          fontSize: 16,
                          fontWeight: FontWeight.w600,
                          color: Colors.black,
                        ),
                      ),
                      VxBuilder(
                        mutations: {RemoveMutation},
                        builder: (context, store, status) {
                          return Text(
                            _cart.totalPrice.toString(),
                            style: TextStyle(
                              fontSize: 16,
                              fontWeight: FontWeight.w600,
                              color: Colors.black,
                            ),
                          );
                        },
                      ),
                    ],
                  )
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class _cartlist extends StatefulWidget {
  const _cartlist({super.key});

  @override
  State<_cartlist> createState() => __cartlistState();
}

class __cartlistState extends State<_cartlist> {
  @override
  Widget build(BuildContext context) {
    VxState.watch(context, on: [RemoveMutation]);
    final CartModel _cart = (VxState.store as MyStore).cart;
    return _cart.items!.isEmpty
        ? "Cart's empty,keep feasting!...".text.xl2.makeCentered()
        : ListView.builder(
            itemCount: _cart.items?.length,
            itemBuilder: (context, index) => Padding(
                  padding:
                      const EdgeInsets.only(left: 10, right: 10, bottom: 10),
                  child: Container(
                    height: 90,
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(20),
                    ),
                    child: Padding(
                      padding: const EdgeInsets.all(10),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          Column(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                _cart.items![index].name,
                                style: TextStyle(
                                  fontSize: 16,
                                  fontWeight: FontWeight.w600,
                                  color: Colors.black,
                                ),
                              ),
                              Row(
                                children: [
                                  Text(
                                    "Rs ",
                                    style: TextStyle(
                                      color: Colors.black,
                                      fontSize: 14,
                                      fontWeight: FontWeight.w500,
                                    ),
                                  ),
                                  Text(
                                    _cart.items![index].price.toString(),
                                    style: TextStyle(
                                      color: Colors.black,
                                      fontSize: 14,
                                      fontWeight: FontWeight.w500,
                                    ),
                                  ),
                                ],
                              ),
                              SizedBox(
                                width: 80,
                                child: Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  crossAxisAlignment: CrossAxisAlignment.center,
                                  children: [
                                    InkWell(
                                      onTap: () {},
                                      child: Icon(
                                        CupertinoIcons.minus_circled,
                                        size: 25,
                                      ),
                                    ),
                                    Text(
                                      "1",
                                      style: TextStyle(
                                        color: Colors.black,
                                        fontSize: 14,
                                        fontWeight: FontWeight.w500,
                                      ),
                                    ),
                                    InkWell(
                                      onTap: () {},
                                      child: Icon(
                                        CupertinoIcons.add_circled,
                                        size: 25,
                                      ),
                                    ),
                                  ],
                                ),
                              )
                            ],
                          ),
                          InkWell(
                            onTap: () => RemoveMutation(_cart.items![index]),
                            child: Icon(
                              CupertinoIcons.delete,
                              size: 30,
                              color: Colors.redAccent,
                            ),
                          )
                        ],
                      ),
                    ),
                  ),
                ));
  }
}
