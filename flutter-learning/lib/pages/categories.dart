import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_application_0/core/store.dart';
import 'package:flutter_application_0/models/food.dart';
import 'package:flutter_application_0/models/restaurantModel.dart';
import 'package:flutter_application_0/utils/routess.dart';
import 'package:velocity_x/velocity_x.dart';

class categories extends StatelessWidget {
  const categories({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xffffcc00),
      body: ListView(
        children: [
          _categoriesbar(),
          Padding(
            padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 25),
            child: Container(
              height: 665,
              decoration: BoxDecoration(
                border: Border.all(color: Colors.black, width: 1.5),
                borderRadius: BorderRadius.circular(20),
                gradient: LinearGradient(
                    begin: Alignment.topCenter,
                    end: Alignment.bottomCenter,
                    colors: [Colors.black87, Color(0xffffcc00)]),
              ),
              child: _categories(),
            ),
          ),
        ],
      ),
    );
  }
}

class _categoriesbar extends StatelessWidget {
  const _categoriesbar({super.key});

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
            "Categories",
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

class _categories extends StatefulWidget {
  const _categories({super.key});

  @override
  State<_categories> createState() => __categoriesState();
}

class __categoriesState extends State<_categories> {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 22),
      child: GridView.builder(
          gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 2, crossAxisSpacing: 25, mainAxisSpacing: 23),
          // itemCount: 20,
          itemCount: FoodModel.items.length,
          // itemBuilder: (context, index) =>
          itemBuilder: (context, index) =>
              _catagoriesWidget(item: FoodModel.items[index])
          // Container(
          //   height: 140,
          //   decoration: BoxDecoration(
          //     color: Colors.transparent,
          //     borderRadius: BorderRadius.circular(20),
          //   ),
          //   child: Column(
          //     children: [
          //       InkWell(
          //         onTap: () {
          //           Navigator.pushNamed(context, MyRoutes.restaurantsRoute);
          //         },
          //         child: Container(
          //           height: 100,
          //           decoration: BoxDecoration(
          //               color: Colors.white,
          //               borderRadius: BorderRadius.circular(20),
          //               image: DecorationImage(
          //                   image: AssetImage("assets/images/biryani.jpeg"),
          //                   fit: BoxFit.cover)),
          //         ),
          //       ),
          //       Text(
          //         "Biryani",
          //         textAlign: TextAlign.center,
          //         style: TextStyle(
          //           fontSize: 20,
          //           fontWeight: FontWeight.bold,
          //           color: Colors.black,
          //         ),
          //       )
          //     ],
          //   ),
          // ),
          // itemCount: 20,
          ),
    );
  }
}

class _catagoriesWidget extends StatefulWidget {
  final Foods item;

  const _catagoriesWidget({super.key, required this.item});

  @override
  State<_catagoriesWidget> createState() => _catagoriesWidgetState();
}

class _catagoriesWidgetState extends State<_catagoriesWidget> {
  @override
  Widget build(BuildContext context) {
    final RestaurantModel _restaurant = (VxState.store as MyStore).restaurant;
    VxState.watch(context, on: [AddMutation, RemoveMutation]);
    bool isInRestaurant = _restaurant.items?.contains(widget.item) ?? false;
    return Container(
      height: 140,
      decoration: BoxDecoration(
        color: Colors.transparent,
        borderRadius: BorderRadius.circular(20),
      ),
      child: Column(
        children: [
          InkWell(
            onTap: () {
              Navigator.pushNamed(context, MyRoutes.restaurantsRoute);
              if (!isInRestaurant) {
                AddMutation(widget.item);
              }
              setState(() {});
            },
            child: Container(
              height: 100,
              decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(20),
                  image: DecorationImage(
                      image: AssetImage(widget.item.image), fit: BoxFit.cover)),
            ),
          ),
          Text(
            widget.item.name,
            textAlign: TextAlign.center,
            style: TextStyle(
              fontSize: 20,
              fontWeight: FontWeight.bold,
              color: Colors.black,
            ),
          )
        ],
      ),
    );
  }
}
