import 'package:flutter/material.dart';

import '../widgets/build_app_bar.dart';
import '../widgets/home_view_body.dart';

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
      body: HomeViewBody(screenWidth: screenWidth, screenHeight: screenHeight),
    );
  }
}
