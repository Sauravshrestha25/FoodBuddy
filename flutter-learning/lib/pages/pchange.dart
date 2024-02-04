import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_application_0/utils/routess.dart';
import 'package:flutter_application_0/widgets/SettingBarWidget.dart';

class pchange extends StatefulWidget {
  const pchange({
    super.key,
    required this.controller,
  });

  final TextEditingController controller;

  @override
  State<pchange> createState() => _newpasswordState();
}

class _newpasswordState extends State<pchange> {
  var obsecureText = true;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xffffcc00),
      body: ListView(
        padding: EdgeInsets.all(0),
        children: [
          Padding(
            padding: const EdgeInsets.only(top: 30),
            child: settingBarWidget(),
          ),
          SizedBox(height: 20),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 40),
            child: Row(
              children: [
                Padding(padding: EdgeInsets.all(10)),
                Text("Enter new password", style: TextStyle(fontSize: 16)),
              ],
            ),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 40),
            child: ClipRRect(
              borderRadius: BorderRadius.circular(50),
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
                      hintText: ("Enter new password"),
                      contentPadding:
                          EdgeInsets.symmetric(horizontal: 15, vertical: 15),
                      filled: true,
                      fillColor: Colors.white,
                      border: InputBorder.none)),
            ),
          ),
          SizedBox(height: 10),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 40),
            child: Row(
              children: [
                Padding(padding: EdgeInsets.all(10)),
                Text("Confirm password", style: TextStyle(fontSize: 16)),
              ],
            ),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 40),
            child: ClipRRect(
              borderRadius: BorderRadius.circular(50),
              child: _textform(
                controller: TextEditingController(),
              ),
            ),
          ),
          SizedBox(height: 35),
          Padding(
            padding: const EdgeInsets.all(40),
            child: ElevatedButton(
                onPressed: () {
                  Navigator.pushNamed(context, MyRoutes.pverificationRoute);
                },
                style: ElevatedButton.styleFrom(
                  fixedSize: Size(400, 45),
                  primary: Color(0xffff7f50),
                  onPrimary: Colors.white,
                ),
                child: Text("Update password")),
          ),
        ],
      ),
    );
  }
}

class _textform extends StatefulWidget {
  const _textform({
    super.key,
    required this.controller,
  });

  final TextEditingController controller;
  @override
  State<_textform> createState() => __textformState();
}

class __textformState extends State<_textform> {
  var hidedText = true;
  @override
  Widget build(BuildContext context) {
    return TextField(
        obscureText: hidedText,
        controller: widget.controller,
        decoration: InputDecoration(
            suffixIcon: GestureDetector(
              onTap: () {
                setState(() {
                  hidedText = !hidedText;
                });
              },
              child: hidedText
                  ? const Icon(CupertinoIcons.eye_slash_fill)
                  : const Icon(CupertinoIcons.eye_fill),
            ),
            hintText: ("Confirm password"),
            contentPadding: EdgeInsets.symmetric(horizontal: 15, vertical: 15),
            filled: true,
            fillColor: Colors.white,
            border: InputBorder.none));
  }
}
