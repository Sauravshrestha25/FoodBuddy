import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_application_0/utils/routess.dart';
import 'package:flutter_application_0/widgets/CreateBarWidget.dart';

class create3 extends StatelessWidget {
  const create3({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xffffcc00),
      body: ListView(
        children: [
          CreateBarWedget(),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 50),
            child: Column(
              children: [
                Row(
                  children: [
                    Padding(padding: EdgeInsets.only(left: 10, right: 10)),
                    Padding(
                      padding: const EdgeInsets.only(top: 20),
                      child:
                          Text("Phone Number", style: TextStyle(fontSize: 16)),
                    ),
                  ],
                ),
                ClipRRect(
                  borderRadius: BorderRadius.circular(50),
                  child: TextFormField(
                    decoration: InputDecoration(
                      hintText: ("Enter your phone number"),
                      contentPadding:
                          EdgeInsets.symmetric(horizontal: 15, vertical: 15),
                      filled: true,
                      fillColor: Colors.white,
                      border: InputBorder.none,
                    ),
                  ),
                ),
                Row(
                  children: [
                    Padding(padding: EdgeInsets.all(10)),
                    Padding(
                      padding: const EdgeInsets.only(top: 20),
                      child: Text("Closeing / Opeing Time",
                          style: TextStyle(fontSize: 16)),
                    ),
                  ],
                ),
                ClipRRect(
                  borderRadius: BorderRadius.circular(50),
                  child: TextFormField(
                    decoration: InputDecoration(
                      suffixIcon: GestureDetector(
                        onTap: () {},
                        child: Icon(CupertinoIcons.chevron_down),
                      ),
                      contentPadding:
                          EdgeInsets.symmetric(horizontal: 15, vertical: 15),
                      filled: true,
                      fillColor: Colors.white,
                      border: InputBorder.none,
                    ),
                  ),
                ),
                Row(
                  children: [
                    Padding(padding: EdgeInsets.only(left: 10, right: 10)),
                    Padding(
                      padding: const EdgeInsets.only(top: 20),
                      child: Text("Delivery Radius",
                          style: TextStyle(fontSize: 16)),
                    ),
                  ],
                ),
                ClipRRect(
                  borderRadius: BorderRadius.circular(50),
                  child: TextFormField(
                    decoration: InputDecoration(
                      // hintText: ("Enter restaurant name"),
                      contentPadding:
                          EdgeInsets.symmetric(horizontal: 15, vertical: 15),
                      filled: true,
                      fillColor: Colors.white,
                      border: InputBorder.none,
                    ),
                  ),
                ),
                Row(
                  children: [
                    Padding(padding: EdgeInsets.only(left: 10, right: 10)),
                    Padding(
                      padding: const EdgeInsets.only(top: 20),
                      child: Text("Logo", style: TextStyle(fontSize: 16)),
                    ),
                  ],
                ),
                ClipRRect(
                  borderRadius: BorderRadius.circular(50),
                  child: TextFormField(
                    decoration: InputDecoration(
                      hintText: ("Insert image here"),
                      contentPadding:
                          EdgeInsets.symmetric(horizontal: 15, vertical: 15),
                      filled: true,
                      fillColor: Colors.white,
                      border: InputBorder.none,
                    ),
                  ),
                ),
                Row(
                  children: [
                    Padding(padding: EdgeInsets.all(10)),
                    Padding(
                      padding: const EdgeInsets.only(top: 20),
                      child: Text("Payment Method",
                          style: TextStyle(fontSize: 16)),
                    ),
                  ],
                ),
                ClipRRect(
                  borderRadius: BorderRadius.circular(50),
                  child: TextFormField(
                    decoration: InputDecoration(
                      suffixIcon: GestureDetector(
                        onTap: () {},
                        child: Icon(CupertinoIcons.chevron_down),
                      ),
                      contentPadding:
                          EdgeInsets.symmetric(horizontal: 15, vertical: 15),
                      filled: true,
                      fillColor: Colors.white,
                      border: InputBorder.none,
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(vertical: 50),
                  child: ElevatedButton(
                      onPressed: () {
                        Navigator.pushNamed(
                            context, MyRoutes.confirmation2Route);
                      },
                      style: ElevatedButton.styleFrom(
                        fixedSize: Size(400, 45),
                        primary: Color(0xffff7f50),
                        onPrimary: Colors.white,
                      ),
                      child: Text("Sign Up")),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
