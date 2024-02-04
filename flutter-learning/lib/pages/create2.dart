import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_application_0/utils/routess.dart';
import 'package:flutter_application_0/widgets/CreateBarWidget.dart';

class create2 extends StatefulWidget {
  const create2({super.key, required this.controller});

  final TextEditingController controller;

  @override
  State<create2> createState() => _create2State();
}

class _create2State extends State<create2> {
  var obsecureText = true;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xffffcc00),
      body: ListView(
        children: [
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 10),
            child: CreateBarWedget(),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 50),
            child: Column(
              children: [
                Row(
                  children: [
                    Padding(padding: EdgeInsets.only(left: 10, right: 10)),
                    Padding(
                      padding: const EdgeInsets.only(top: 20),
                      child: Text("Name of Restaurant",
                          style: TextStyle(fontSize: 16)),
                    ),
                  ],
                ),
                ClipRRect(
                  borderRadius: BorderRadius.circular(50),
                  child: TextFormField(
                    decoration: InputDecoration(
                      hintText: ("Enter restaurant name"),
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
                      child: Text("Email", style: TextStyle(fontSize: 16)),
                    ),
                  ],
                ),
                ClipRRect(
                  borderRadius: BorderRadius.circular(50),
                  child: TextFormField(
                    decoration: InputDecoration(
                      hintText: ("Enter your email"),
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
                      child: Text("Password", style: TextStyle(fontSize: 16)),
                    ),
                  ],
                ),
                ClipRRect(
                  borderRadius: BorderRadius.circular(50),
                  child: Padding(
                    padding: const EdgeInsets.only(left: 0),
                    child: TextFormField(
                        controller: widget.controller,
                        obscureText: obsecureText,
                        decoration: InputDecoration(
                            suffixIcon: GestureDetector(
                              onTap: () {
                                setState(() {
                                  obsecureText = !obsecureText;
                                });
                              },
                              child: obsecureText
                                  ? const Icon(CupertinoIcons.eye_slash_fill)
                                  : const Icon(CupertinoIcons.eye_fill),
                            ),
                            hintText: ("Enter your password"),
                            contentPadding: EdgeInsets.symmetric(
                                horizontal: 15, vertical: 15),
                            filled: true,
                            fillColor: Colors.white,
                            border: InputBorder.none)),
                  ),
                ),
                Row(
                  children: [
                    Padding(padding: EdgeInsets.all(10)),
                    Padding(
                      padding: const EdgeInsets.only(top: 20),
                      child: Text("Pan Number", style: TextStyle(fontSize: 16)),
                    ),
                  ],
                ),
                ClipRRect(
                  borderRadius: BorderRadius.circular(50),
                  child: TextFormField(
                    decoration: InputDecoration(
                      hintText: ("Enter pan number"),
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
                      child: Text("Location", style: TextStyle(fontSize: 16)),
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
                        Navigator.pushNamed(context, MyRoutes.create3Route);
                      },
                      style: ElevatedButton.styleFrom(
                        fixedSize: Size(400, 45),
                        primary: Color(0xffff7f50),
                        onPrimary: Colors.white,
                      ),
                      child: Text("Next")),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
