import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_application_0/core/store.dart';

import 'package:flutter_application_0/models/restaurantModel.dart';

import 'package:flutter_application_0/utils/routess.dart';
import 'package:velocity_x/velocity_x.dart';

class restaurants extends StatelessWidget {
  const restaurants({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xffffcc00),
      body: ListView(
        children: [
          _restaurantbar(),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 40),
            child: Placeholder(
              fallbackHeight: 600,
              color: Colors.transparent,
              child: _restaurants(),
            ),
          )
        ],
      ),
    );
  }
}

class _restaurantbar extends StatelessWidget {
  const _restaurantbar({super.key});

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
          SizedBox(
            width: 60,
          )
        ],
      ),
    );
  }
}

class _restaurants extends StatefulWidget {
  const _restaurants({super.key});

  @override
  State<_restaurants> createState() => __restaurantsState();
}

class __restaurantsState extends State<_restaurants> {
  @override
  Widget build(BuildContext context) {
    final RestaurantModel _restaurant = (VxState.store as MyStore).restaurant;
    return ListView.builder(
      itemCount: _restaurant.items?.length,
      itemBuilder: (context, index) => Padding(
        padding: const EdgeInsets.all(2.5),
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.only(top: 20, bottom: 10),
              child: Text(
                _restaurant.items![index].name,
                textAlign: TextAlign.center,
                style: TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                  color: Colors.black,
                ),
              ),
            ),
            Container(
              height: 70,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(20),
                color: Colors.white,
              ),
              child: Padding(
                padding: const EdgeInsets.all(10),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Row(
                      children: [
                        Padding(
                          padding: const EdgeInsets.all(5),
                          child: Icon(
                            CupertinoIcons.star,
                            size: 20,
                            color: Color(0xfffdb600),
                          ),
                        ),
                        Text(
                          "4.0",
                          style: TextStyle(
                              fontSize: 16,
                              color: Colors.black,
                              fontWeight: FontWeight.w500),
                        )
                      ],
                    ),
                    Padding(
                      padding: const EdgeInsets.only(right: 30),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            _restaurant.items![index].restaurant,
                            style: TextStyle(
                              fontSize: 16,
                              fontWeight: FontWeight.w600,
                              color: Colors.black,
                            ),
                          ),
                          Row(
                            children: [
                              Opacity(
                                opacity: 0.5,
                                child: Text(
                                  _restaurant.items![index].city,
                                  style: TextStyle(
                                    fontSize: 12,
                                    color: Colors.black,
                                  ),
                                ),
                              ),
                              Opacity(
                                opacity: 0.5,
                                child: Text(
                                  ",",
                                  style: TextStyle(
                                    fontSize: 12,
                                    color: Colors.black,
                                  ),
                                ),
                              ),
                              Opacity(
                                opacity: 0.5,
                                child: Text(
                                  _restaurant.items![index].address,
                                  style: TextStyle(
                                    fontSize: 12,
                                    color: Colors.black,
                                  ),
                                ),
                              ),
                            ],
                          )
                        ],
                      ),
                    ),
                    InkWell(
                      onTap: () {
                        Navigator.pushNamed(context, MyRoutes.itemsRoute);
                      },
                      child: Icon(CupertinoIcons.forward),
                    )
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
