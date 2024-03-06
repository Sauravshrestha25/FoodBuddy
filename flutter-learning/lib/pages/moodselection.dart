import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'package:flutter_application_0/utils/routess.dart';
import 'package:flutter_application_0/widgets/CreateBarWidget.dart';

class mood extends StatefulWidget {
  const mood({super.key, required this.controller});

  final TextEditingController controller;

  @override
  State<mood> createState() => _account1State();
}

class _account1State extends State<mood> {
  var obsecureText = true;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xffffcb01),
      body: ListView(children: [
        Column(
          children: [
            Padding(
              padding: const EdgeInsets.only(left: 10, right: 10),
              child: CreateBarWedget(),
            ),
            Container(
              height: 700,
              child: ListView(
                  padding: EdgeInsets.symmetric(vertical: 0, horizontal: 50),
                  children: [
                    // Row(
                    //   children: [
                    //     Padding(padding: EdgeInsets.all(10)),
                    //     Padding(
                    //       padding: const EdgeInsets.only(top: 20),
                    //       child:
                    //           Text("Full Name", style: TextStyle(fontSize: 16)),
                    //     ),
                    //   ],
                    // ),
                    // ClipRRect(
                    //   borderRadius: BorderRadius.circular(50),
                    //   child: TextFormField(
                    //     decoration: InputDecoration(
                    //       contentPadding: EdgeInsets.symmetric(
                    //           horizontal: 15, vertical: 15),
                    //       filled: true,
                    //       fillColor: Colors.white,
                    //       border: InputBorder.none,
                    //     ),
                    //   ),
                    // ),
                    // SizedBox(height: 5),
                    // Row(
                    //   children: [
                    //     Padding(padding: EdgeInsets.all(10)),
                    //     Text("Email", style: TextStyle(fontSize: 16)),
                    //   ],
                    // ),
                    // ClipRRect(
                    //   borderRadius: BorderRadius.circular(50),
                    //   child: TextFormField(
                    //     decoration: InputDecoration(
                    //       hintText: ("Enter your email"),
                    //       contentPadding: EdgeInsets.symmetric(
                    //           horizontal: 15, vertical: 15),
                    //       filled: true,
                    //       fillColor: Colors.white,
                    //       border: InputBorder.none,
                    //     ),
                    //   ),
                    // ),
                    // SizedBox(height: 5),
                    // Row(
                    //   children: [
                    //     Padding(padding: EdgeInsets.all(10)),
                    //     Text("Password", style: TextStyle(fontSize: 16)),
                    //   ],
                    // ),
                    // ClipRRect(
                    //   borderRadius: BorderRadius.circular(50),
                    //   child: TextFormField(
                    //       controller: widget.controller,
                    //       obscureText: obsecureText,
                    //       decoration: InputDecoration(
                    //           suffixIcon: GestureDetector(
                    //             onTap: () {
                    //               setState(() {
                    //                 obsecureText = !obsecureText;
                    //               });
                    //             },
                    //             child: obsecureText
                    //                 ? const Icon(CupertinoIcons.eye_slash_fill)
                    //                 : const Icon(CupertinoIcons.eye_fill),
                    //           ),
                    //           hintText: ("Enter your password"),
                    //           contentPadding: EdgeInsets.symmetric(
                    //               horizontal: 15, vertical: 15),
                    //           filled: true,
                    //           fillColor: Colors.white,
                    //           border: InputBorder.none)),
                    // ),
                    // SizedBox(height: 5),
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
                            hintText: "Enter your age",
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
                    SizedBox(height: 35),
                    Row(
                      children: [
                        Padding(padding: EdgeInsets.all(10)),
                        Text("Select your mood",
                            style: TextStyle(fontSize: 16)),
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

                    // ElevatedButton(
                    //     onPressed: () {
                    //       Navigator.pushNamed(
                    //           context, MyRoutes.verificationRoute);
                    //     },
                    //     style: ElevatedButton.styleFrom(
                    //       fixedSize: Size(400, 45),
                    //       primary: Color(0xffff7f50),
                    //       onPrimary: Colors.white,
                    //     ),
                    //     child: Text("Sign Up")),
                    // SizedBox(height: 8),
                    // ElevatedButton(
                    //   onPressed: () {
                    //     // Navigator.push(
                    //     //     context,
                    //     //     MaterialPageRoute(
                    //     //       builder: (_) => homepage(),
                    //     //     ));
                    //   },
                    //   style: ElevatedButton.styleFrom(
                    //     // fixedSize: Size(100, 45),
                    //     onPrimary: Colors.black,
                    //   ),
                    //   child: Row(
                    //     mainAxisAlignment: MainAxisAlignment.center,
                    //     children: [
                    //       Text("Log in with"),
                    //       SizedBox(
                    //         width: 10,
                    //       ),
                    //       Image.asset("assets/images/gmail.png",
                    //           height: 20, width: 20),
                    //     ],
                    //   ),
                    // ),
                    // const Divider(
                    //   color: Colors.white,
                    //   height: 20,
                    //   thickness: 2,
                    // ),
                    // Row(
                    //   mainAxisAlignment: MainAxisAlignment.center,
                    //   children: [
                    //     Text("Have an account?",
                    //         style: TextStyle(fontSize: 13)),
                    //     SizedBox(width: 3),
                    //     TextButton(
                    //       onPressed: () {
                    //         Navigator.pushNamed(context, MyRoutes.homeRoute);
                    //       },
                    //       child: Text("Log in",
                    //           style: TextStyle(
                    //               fontSize: 13, color: Color(0xffff7f50))),
                    //     ),
                    //   ],
                    // ),
                  ]),
            ),
          ],
        ),
      ]),
    );
  }
}
