import 'package:flutter/material.dart';

class ProductDetailAppBar extends StatelessWidget {
  const ProductDetailAppBar({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
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
