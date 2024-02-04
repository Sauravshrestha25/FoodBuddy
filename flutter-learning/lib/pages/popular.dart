import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class popular extends StatelessWidget {
  const popular({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xffffcc00),
      body: ListView(
        children: [
          _popularbar(),
          Padding(
            padding: const EdgeInsets.only(top: 20),
            child: Placeholder(
              fallbackHeight: 630,
              color: Colors.transparent,
              child: _popularitems(),
            ),
          ),
        ],
      ),
    );
  }
}

class _popularbar extends StatelessWidget {
  const _popularbar({super.key});

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
            "Popular Items",
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

class _popularitems extends StatefulWidget {
  const _popularitems({super.key});

  @override
  State<_popularitems> createState() => __popularitemsState();
}

class __popularitemsState extends State<_popularitems> {
  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: 10,
      itemBuilder: (context, index) => Padding(
        padding: const EdgeInsets.only(bottom: 40, left: 50, right: 50),
        child: Container(
          height: 275,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(20),
            color: Color(0xff1b1b1b),
          ),
          child: Column(
            children: [
              Container(
                  height: 160,
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(20),
                    image: DecorationImage(
                        image: AssetImage("assets/images/m1.jpeg"),
                        fit: BoxFit.cover),
                  )),
              Padding(
                padding: const EdgeInsets.only(left: 10, right: 10, top: 5),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      "Chicken Steam Momo",
                      style: TextStyle(
                          fontSize: 20,
                          fontWeight: FontWeight.bold,
                          color: Colors.white),
                    ),
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
                              color: Colors.white,
                              fontWeight: FontWeight.w500),
                        )
                      ],
                    )
                  ],
                ),
              ),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 10),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          "Upper Ground Khaja Ghar",
                          style: TextStyle(
                              fontSize: 16,
                              fontWeight: FontWeight.w100,
                              color: Colors.white),
                        ),
                        Opacity(
                          opacity: 0.8,
                          child: Text(
                            "Kathmandu,Balkumari",
                            style: TextStyle(
                                fontSize: 12,
                                fontWeight: FontWeight.w100,
                                color: Colors.white),
                          ),
                        )
                      ],
                    ),
                    Text(
                      "Rs.130",
                      style: TextStyle(
                          fontSize: 18,
                          fontWeight: FontWeight.w600,
                          color: Color(0xfffdb600)),
                    )
                  ],
                ),
              ),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 10),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Opacity(
                      opacity: 0.8,
                      child: Text(
                        "9:30 AM to 10:30 PM",
                        style: TextStyle(
                            fontSize: 16,
                            fontWeight: FontWeight.w100,
                            color: Colors.white),
                      ),
                    ),
                    InkWell(
                      onTap: () {
                        ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                            content: Text(
                          "Add to cart is not supporting yet.",
                          textAlign: TextAlign.center,
                        )));
                      },
                      child: Container(
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
              )
            ],
          ),
        ),
      ),
    );
  }
}
