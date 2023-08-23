import 'package:flutter/material.dart';

import '../models/product_model.dart';
import '../views/product_detail_view.dart';
import 'custom_product_card.dart';

class ProductsGridView extends StatelessWidget {
  const ProductsGridView({
    super.key,
    required this.products,
    required this.screenWidth,
    required this.screenHeight,
  });

  final List<ProductModel> products;
  final double screenWidth;
  final double screenHeight;

  @override
  Widget build(BuildContext context) {
    return GridView.builder(
      physics: const BouncingScrollPhysics(),
      clipBehavior: Clip.none,
      gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 2,
        crossAxisSpacing: 10,
        mainAxisSpacing: 80,
        childAspectRatio: 1.4,
      ),
      itemCount: products.length,
      itemBuilder: (context, index) {
        return InkWell(
          onTap: () {
            Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) =>
                    ProductDetailView(product: products[index]),
              ),
            );
          },
          child: CustomProductCard(
            screenWidth: screenWidth,
            screenHeight: screenHeight,
            product: products[index],
          ),
        );
      },
    );
  }
}
