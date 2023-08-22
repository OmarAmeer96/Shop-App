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
      child: Container(
        width: screenWidth * 0.5,
        height: screenHeight * 0.14,
        decoration: BoxDecoration(
          boxShadow: [
            BoxShadow(
              blurRadius: 9,
              color: Colors.grey.withOpacity(0.5),
              spreadRadius: 0,
              offset: const Offset(4, 6),
            ),
          ],
        ),
        child: CustomProductCard(
          screenWidth: screenWidth,
          screenHeight: screenHeight,
        ),
      ),
    );
  }
}
