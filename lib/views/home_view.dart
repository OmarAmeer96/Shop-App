import 'package:flutter/material.dart';

import '../widgets/build_app_bar.dart';

class HomeView extends StatelessWidget {
  const HomeView({super.key});
  static String id = "HomeView";
  @override
  Widget build(BuildContext context) {
    final double screenHeight = MediaQuery.of(context).size.height;
    final double screenWidth = MediaQuery.of(context).size.width;
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: buildAppBar(),
      body: SizedBox(
        width: screenWidth * 0.5,
        height: screenHeight * 0.14,
        child: Card(
          color: Colors.white,
          elevation: 5,
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  "HandBag LV",
                  style: TextStyle(
                    color: Colors.black,
                    fontFamily: "Gilroy-Bold",
                    fontSize: screenWidth * 0.036,
                  ),
                ),
                SizedBox(
                  height: screenHeight * 0.01,
                ),
                const Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text("\$225"),
                    Icon(
                      Icons.favorite,
                      color: Colors.red,
                    ),
                  ],
                ),
              ],
            ),
          ),
          //       height: screenHeight * 0.13,
          // width: screenWidth * 0.45,
          // decoration: BoxDecoration(
          //   borderRadius: BorderRadius.circular(16),
          //   color: primaryColor,
        ),
      ),
    );
  }
}
