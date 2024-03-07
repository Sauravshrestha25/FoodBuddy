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
          padding: EdgeInsets.all(60),
          child: Text(
            "According to your parameter, The best foods we would like to recommend you are given below.",
            textAlign: TextAlign.center,
            style: TextStyle(
              fontSize: 14,
              fontWeight: FontWeight.w600,
              color: Colors.black,
            ),
          ),
        ),
        Text(
          "Food Name",
          textAlign: TextAlign.center,
          style: TextStyle(
            fontSize: 24,
            fontWeight: FontWeight.bold,
            color: Colors.black,
          ),
        ),
        SizedBox(
          height: 60,
        ),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 30),
          child: ElevatedButton(
              onPressed: () {
                Navigator.pushNamed(context, MyRoutes.restaurantsRoute);
              },
              style: ElevatedButton.styleFrom(
                fixedSize: Size(400, 45),
                primary: Color(0xff302e2d),
                onPrimary: Colors.white,
              ),
              child: Text("Get Food")),
        ),
      ],
    );
  }
}
