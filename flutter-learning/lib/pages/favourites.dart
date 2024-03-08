import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_application_0/core/store.dart';
import 'package:flutter_application_0/models/restaurantModel.dart';
import 'package:flutter_application_0/utils/routess.dart';
import 'package:flutter_application_0/widgets/FavouritesBar.dart';
import 'package:velocity_x/velocity_x.dart';

class favourites extends StatelessWidget {
  const favourites({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xffffcc00),
      body: ListView(
        children: [
          favouriteBarWedget(),
          Padding(
            padding: const EdgeInsets.all(30),
            child: Placeholder(
              fallbackHeight: 377,
              color: Colors.transparent,
              child: _favourites(),
            ),
          ),
          SizedBox(
            height: 150,
            width: double.infinity,
            child: Center(
              child: Padding(
                padding: const EdgeInsets.only(
                    left: 30, top: 30, bottom: 30, right: 30),
                child: Container(
                  child: Text(
                    "You can add your favourites here.",
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class _favourites extends StatefulWidget {
  const _favourites({super.key});

  @override
  State<_favourites> createState() => _favouritesState();
}

class _favouritesState extends State<_favourites> {
  final RestaurantModel _restaurant = (VxState.store as MyStore).restaurant;
  @override
  Widget build(BuildContext context) {
    return _restaurant.items!.isEmpty
        ? Padding(
            padding: const EdgeInsets.only(top: 250),
            child: const Text(
              "You have not added any restaurant to your favourie yet.....!",
              textAlign: TextAlign.center,
              style: TextStyle(
                  fontSize: 14,
                  fontWeight: FontWeight.w100,
                  color: Colors.black),
            ),
          )
        : ListView.builder(
            itemCount: _restaurant.items?.length,
            itemBuilder: (context, index) => Padding(
              padding: const EdgeInsets.all(2.5),
              child: Container(
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
                      Icon(
                        CupertinoIcons.heart_fill,
                        color: Colors.black,
                      ),
                      Padding(
                        padding: const EdgeInsets.only(left: 20),
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
                            Opacity(
                              opacity: 0.8,
                              child: Row(
                                crossAxisAlignment: CrossAxisAlignment.center,
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  Text(
                                    _restaurant.items![index].city,
                                    textAlign: TextAlign.center,
                                    style: TextStyle(
                                        fontSize: 12,
                                        fontWeight: FontWeight.w100,
                                        color: Colors.black),
                                  ),
                                  Text(
                                    ",",
                                    style: TextStyle(
                                      fontSize: 12,
                                      fontWeight: FontWeight.w100,
                                      color: Colors.black,
                                    ),
                                  ),
                                  Text(
                                    _restaurant.items![index].address,
                                    style: TextStyle(
                                      fontSize: 12,
                                      fontWeight: FontWeight.w100,
                                      color: Colors.black,
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ],
                        ),
                      ),
                      SizedBox(
                        width: 80,
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
            ),
          );
  }
}
