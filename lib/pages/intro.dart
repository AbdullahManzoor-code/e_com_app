import 'package:e_com_app/pages/bottom_navigation.dart';

import 'package:flutter/material.dart';

class Intropage extends StatelessWidget {
  static String id = "/intropage";

  const Intropage({super.key});

  @override
  Widget build(BuildContext context) {
    var screenSize = MediaQuery.of(context).size;
    return Scaffold(
      backgroundColor: Colors.white,
      body: Padding(
        padding: const EdgeInsets.only(top: 50),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            Center(
                child: Image(
              image: const AssetImage("assets/logo.png"),
              height: screenSize.height * 0.6,
            )),
            const Text(
              "JUST DO IT",
              style: TextStyle(fontSize: 30),
            ),
            const Padding(
              padding: EdgeInsets.only(top: 10),
              child: Text("Explore The Best Shoes and Order Now"),
            ),
            Padding(
              padding: const EdgeInsets.only(top: 50),
              child: Container(
                  decoration: BoxDecoration(
                      color: Colors.black,
                      borderRadius: BorderRadius.circular(8)),
                  height: screenSize.height * 0.067,
                  width: screenSize.height * 0.4,
                  child: TextButton(
                      onPressed: () {
                        print("its work");
                        Navigator.pushNamed(context, BottomNavigation.id);
                      },
                      child: const Text(
                        "START NOW",
                        style: TextStyle(color: Colors.white),
                      ))),
            )
          ],
        ),
      ),
    );
  }
}
