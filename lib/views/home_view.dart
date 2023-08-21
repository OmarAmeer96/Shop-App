import 'package:flutter/material.dart';
import 'package:shop_app/consts.dart';

import '../widgets/build_app_bar.dart';

class HomeView extends StatelessWidget {
  const HomeView({super.key});
  static String id = "HomeView";
  @override
  Widget build(BuildContext context) {
    final double screenHeight = MediaQuery.of(context).size.height;
    final double screenWidth = MediaQuery.of(context).size.width;
    return Scaffold(
      backgroundColor: backColor,
      appBar: buildAppBar(),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            Card(
              elevation: 2,
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 16),
                child: Column(
                  children: [
                    const Text("HandBag LV"),
                    SizedBox(
                      height: screenHeight * 0.02,
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
            )
          ],
        ),
      ),
    );
  }
}
