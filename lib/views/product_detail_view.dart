import 'package:flutter/material.dart';
import 'package:shop_app/widgets/custom_main_button.dart';

import '../models/product_model.dart';

class ProductDetailView extends StatelessWidget {
  const ProductDetailView({super.key, required this.product});

  final ProductModel product;
  static String id = "ProductDetailView";

  @override
  Widget build(BuildContext context) {
    final double screenHeight = MediaQuery.of(context).size.height;
    final double screenWidth = MediaQuery.of(context).size.width;
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: buildProductDetailAppBar(context),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16),
          child: Center(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                SizedBox(
                  width: screenWidth * 0.6,
                  height: screenHeight * 0.6,
                  child: Image.network(
                    product.image,
                  ),
                ),
                SizedBox(
                  height: screenHeight * 0.0,
                ),
                Text(
                  product.title,
                  textAlign: TextAlign.center,
                  style: const TextStyle(
                    color: Colors.black,
                    fontSize: 18,
                    fontFamily: "Gilroy-Bold",
                  ),
                ),
                SizedBox(
                  height: screenHeight * 0.015,
                ),
                Text(
                  product.description,
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    color: Colors.black.withOpacity(0.5),
                    fontSize: 15,
                    fontFamily: "Gilroy-Medium",
                  ),
                ),
                SizedBox(
                  height: screenHeight * 0.025,
                ),
                CustomMainButton(text: "Buy Now", onPressed: () {}),
                SizedBox(
                  height: screenHeight * 0.01,
                )
              ],
            ),
          ),
        ),
      ),
    );
  }

  AppBar buildProductDetailAppBar(BuildContext context) {
    return AppBar(
      centerTitle: true,
      leading: IconButton(
        onPressed: () {
          Navigator.pop(context);
        },
        icon: const Icon(Icons.arrow_back_ios),
        color: Colors.black,
      ),
      backgroundColor: Colors.white,
      title: const Text(
        "Product Details",
        overflow: TextOverflow.ellipsis,
        style: TextStyle(
          color: Colors.black,
        ),
      ),
    );
  }
}
