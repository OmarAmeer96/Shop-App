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
        child: Container(
          height: screenHeight * 0.13,
          width: screenWidth * 0.45,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(16),
            color: primaryColor,
          ),
        ),
      ),
    );
  }
}
