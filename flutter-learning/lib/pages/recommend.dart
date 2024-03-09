import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_application_0/utils/routess.dart';

class recommend extends StatelessWidget {
  const recommend({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xffffcc00),
      body: ListView(children: [
        Padding(
          padding: const EdgeInsets.all(10),
          child: _recommendbar(),
        ),
        Placeholder(
          fallbackHeight: 650,
          color: Colors.transparent,
          child: _recommend(),
        )
      ]),
    );
  }
}

class _recommendbar extends StatelessWidget {
  const _recommendbar({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.all(10),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          InkWell(
            onTap: () {
              Navigator.pop(context);
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
            "Recommendation",
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

class _recommend extends StatelessWidget {
  const _recommend({super.key});

  @override
  Widget build(BuildContext context) {
    return ListView(
      children: [
        Placeholder(
          fallbackHeight: 0,
          color: Colors.transparent,
        ),
        Padding(
          padding: EdgeInsets.only(top: 50, bottom: 10, left: 60, right: 60),
          child: Text(
            "The recommended food items for your mood (Happy) are:",
            textAlign: TextAlign.center,
            style: TextStyle(
              fontSize: 16,
              fontWeight: FontWeight.w600,
              color: Colors.black,
            ),
          ),
        ),
        Placeholder(
          fallbackHeight: 150,
          color: Colors.transparent,
          child: _items(),
        ),
        Padding(
          padding: EdgeInsets.only(top: 0, bottom: 25, left: 60, right: 60),
          child: Text(
            "Some restaurants offering these dishes are:",
            textAlign: TextAlign.center,
            style: TextStyle(
              fontSize: 16,
              fontWeight: FontWeight.w600,
              color: Colors.black,
            ),
          ),
        ),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 40),
          child: Placeholder(
            fallbackHeight: 400,
            color: Colors.transparent,
            child: _restaurant(),
          ),
        )
      ],
    );
  }
}

class _items extends StatelessWidget {
  const _items({super.key});

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
        itemCount: 3,
        itemBuilder: (context, index) => Padding(
              padding: const EdgeInsets.all(10),
              child: Text(
                "Item Name",
                textAlign: TextAlign.center,
                style: TextStyle(
                  fontSize: 14,
                  fontWeight: FontWeight.normal,
                ),
              ),
            ));
  }
}

class _restaurant extends StatelessWidget {
  const _restaurant({super.key});

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: 3,
      itemBuilder: (context, index) => Padding(
        padding: const EdgeInsets.all(2.5),
        child: Column(
          children: [
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
                            "Restaurant Name",
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
                                  "City Name",
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
                                  "Street Name",
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
