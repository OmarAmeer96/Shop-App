import 'package:flutter/material.dart';

import '../models/product_model.dart';

class ProductDetailView extends StatelessWidget {
  const ProductDetailView({super.key, required this.product});

  final ProductModel product;
  static String id = "ProductDetailView";

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
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
      ),
    );
  }
}
