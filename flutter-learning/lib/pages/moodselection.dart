import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_application_0/utils/routess.dart';
import 'package:flutter_application_0/widgets/AppBarWidget.dart';

class mood extends StatefulWidget {
  const mood({
    super.key,
  });

  @override
  State<mood> createState() => _moodState();
}

class _moodState extends State<mood> {
  String dropdownValue = 'Select your Mood';
  var items = [
    "Select your Mood",
    "Happy",
    "Sad",
    "Angry",
    "Excited",
    "Stressed",
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xffffcb01),
      body: ListView(children: [
        Column(
          children: [
            Padding(
              padding: const EdgeInsets.all(10),
              child: AppBarWidget(),
            ),
            Container(
              height: 700,
              child: ListView(
                  padding: EdgeInsets.symmetric(vertical: 0, horizontal: 50),
                  children: [
                    Text(
                      "Please fill up the given parameter below to get food recommended",
                      textAlign: TextAlign.center,
                      style: TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.w600,
                        color: Colors.black,
                      ),
                    ),
                    SizedBox(
                      height: 5,
                    ),
                    Row(
                      children: [
                        Padding(padding: EdgeInsets.all(10)),
                        Text("Age", style: TextStyle(fontSize: 16)),
                      ],
                    ),
                    ClipRRect(
                      borderRadius: BorderRadius.circular(50),
                      child: TextFormField(
                        decoration: InputDecoration(
                            hintText: "Enter your age here (min.age 20 )",
                            contentPadding: EdgeInsets.symmetric(
                                horizontal: 15, vertical: 15),
                            filled: true,
                            fillColor: Colors.white,
                            border: InputBorder.none),
                      ),
                    ),
                    SizedBox(
                      height: 5,
                    ),
                    Row(
                      children: [
                        Padding(padding: EdgeInsets.all(10)),
                        Text("Weight", style: TextStyle(fontSize: 16)),
                      ],
                    ),
                    ClipRRect(
                      borderRadius: BorderRadius.circular(50),
                      child: TextFormField(
                        decoration: InputDecoration(
                            hintText: "Enter your weight here",
                            contentPadding: EdgeInsets.symmetric(
                                horizontal: 15, vertical: 15),
                            filled: true,
                            fillColor: Colors.white,
                            border: InputBorder.none),
                      ),
                    ),
                    SizedBox(height: 5),
                    Row(
                      children: [
                        Padding(padding: EdgeInsets.all(10)),
                        Text("Gender", style: TextStyle(fontSize: 16)),
                      ],
                    ),
                    ClipRRect(
                      borderRadius: BorderRadius.circular(50),
                      child: TextFormField(
                        decoration: InputDecoration(
                            hintText: "Enter your Gender here",
                            contentPadding: EdgeInsets.symmetric(
                                horizontal: 15, vertical: 15),
                            filled: true,
                            fillColor: Colors.white,
                            border: InputBorder.none),
                      ),
                    ),
                    SizedBox(height: 10),
                    Row(
                      children: [
                        Padding(padding: EdgeInsets.all(10)),
                        Text("Select your mood",
                            style: TextStyle(fontSize: 16)),
                      ],
                    ),
                    Container(
                      height: 50,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(50),
                        color: Colors.white,
                      ),
                      child: Center(
                        child: DropdownButton(
                          items: items.map((String item) {
                            return DropdownMenuItem(
                                value: item, child: Text(item));
                          }).toList(),
                          onChanged: (String? newValue) {
                            setState(() {
                              dropdownValue = newValue!;
                            });
                          },
                          value: dropdownValue,
                          borderRadius: BorderRadius.circular(10),
                          icon: const Icon(Icons.keyboard_arrow_down),
                          iconSize: 30,
                          style: TextStyle(fontSize: 18, color: Colors.black),
                        ),
                      ),
                    ),
                    SizedBox(
                      height: 60,
                    ),
                    ElevatedButton(
                        onPressed: () {
                          Navigator.pushNamed(context, MyRoutes.recommendRoute);
                        },
                        style: ElevatedButton.styleFrom(
                          fixedSize: Size(400, 45),
                          primary: Color(0xffff7f50),
                          onPrimary: Colors.white,
                        ),
                        child: Text("Submit")),
                  ]),
            ),
          ],
        ),
      ]),
    );
  }
}
