import 'package:flutter/material.dart';

import 'custom_product_card.dart';

class HomeViewBody extends StatelessWidget {
  const HomeViewBody({
    super.key,
    required this.screenWidth,
    required this.screenHeight,
  });

  final double screenWidth;
  final double screenHeight;

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Stack(
        clipBehavior: Clip.none,
        children: [
          CustomProductCard(
              screenWidth: screenWidth, screenHeight: screenHeight),
          Positioned(
            right: screenWidth * 0.06,
            top: screenHeight * -0.073,
            child: Image.network(
              "https://fakestoreapi.com/img/81fPKd-2AYL._AC_SL1500_.jpg",
              height: 105,
            ),
          ),
        ],
      ),
    );
  }
}
