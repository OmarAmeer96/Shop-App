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
    return CustomProductCard(
      screenWidth: screenWidth,
      screenHeight: screenHeight,
    );
  }
}
