import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_application_0/pages/first.dart';
import 'package:flutter_application_0/utils/routess.dart';
// import 'package:flutter_application_0/widgets/BackBar.dart';

class homepage extends StatefulWidget {
  const homepage({super.key, required this.controller});

  final TextEditingController controller;

  @override
  State<homepage> createState() => _homepageState();
}

class _homepageState extends State<homepage> {
  TextEditingController passwordController = TextEditingController();
  var obsecureText = true;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Color(0xffffcc00),
        body: ListView(
            padding: EdgeInsets.only(left: 10, top: 40, right: 10),
            children: [
              // BackBarWidget(),
              SizedBox(
                height: 60,
              ),
              Padding(
                  padding: EdgeInsets.symmetric(horizontal: 50, vertical: 5)),
              Padding(
                padding: const EdgeInsets.only(left: 20),
                child: Image.asset(
                  "assets/images/log.png",
                  height: 200,
                  width: 200,
                ),
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Padding(
                    padding: const EdgeInsets.symmetric(vertical: 10),
                    child: Text(
                      "Welcome",
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 30,
                      ),
                    ),
                  ),
                ],
              ),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 40),
                child: Column(
                  children: [
                    Row(
                      children: [
                        Padding(padding: EdgeInsets.all(10)),
                        Text("Email", style: TextStyle(fontSize: 15)),
                      ],
                    ),
                    ClipRRect(
                      borderRadius: BorderRadius.circular(50),
                      child: TextFormField(
                        decoration: InputDecoration(
                            // prefixIcon: Icon(Icons.email_outlined),
                            hintText: ("Enter your username"),
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
                        Text("Password", style: TextStyle(fontSize: 15)),
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
                                      ? const Icon(
                                          CupertinoIcons.eye_slash_fill)
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
                        Padding(padding: EdgeInsets.all(0)),
                        TextButton(
                          onPressed: () {
                            Navigator.pushNamed(
                                context, MyRoutes.RecoveryRoute);
                          },
                          child: Text("Forgot Password?",
                              style: TextStyle(
                                fontSize: 13,
                                color: Color(0xffff7f50),
                              )),
                        ),
                      ],
                    ),
                    SizedBox(height: 10),
                    ElevatedButton(
                        onPressed: () {
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (_) => firstapp(),
                              ));
                        },
                        style: ElevatedButton.styleFrom(
                          fixedSize: Size(400, 45),
                          primary: Color(0xffff7f50),
                          onPrimary: Colors.white,
                        ),
                        child: Text("Log In")),
                    SizedBox(height: 8),
                    ElevatedButton(
                      onPressed: () {
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (_) => firstapp(),
                            ));
                      },
                      style: ElevatedButton.styleFrom(
                        onPrimary: Colors.black,
                      ),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text("Log in with"),
                          SizedBox(
                            width: 10,
                          ),
                          Image.asset("assets/images/gmail.png",
                              height: 20, width: 20),
                        ],
                      ),
                    ),
                    const Divider(
                      color: Colors.white,
                      height: 20,
                      thickness: 2,
                    ),
                  ],
                ),
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text("No account?", style: TextStyle(fontSize: 13)),
                  SizedBox(width: 3),
                  TextButton(
                    onPressed: () {
                      Navigator.pushNamed(context, MyRoutes.accountRoute);
                    },
                    child: Text("Sign up",
                        style:
                            TextStyle(fontSize: 13, color: Color(0xffff7f50))),
                  ),
                ],
              ),
            ]));
  }
}
