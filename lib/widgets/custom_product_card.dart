import 'package:flutter/material.dart';

import '../models/product_model.dart';

class CustomProductCard extends StatelessWidget {
  const CustomProductCard({
    super.key,
    required this.screenWidth,
    required this.screenHeight,
    required this.product,
  });

  final double screenWidth;
  final double screenHeight;
  final ProductModel product;

  @override
  Widget build(BuildContext context) {
    return Stack(
      clipBehavior: Clip.none,
      children: [
        Container(
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
          child: Card(
            color: Colors.white,
            elevation: 1,
            child: Padding(
              padding: const EdgeInsets.all(16),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  Text(
                    product.title,
                    overflow: TextOverflow.ellipsis,
                    style: TextStyle(
                      color: Colors.black.withOpacity(0.5),
                      fontFamily: "Gilroy-Medium",
                      fontSize: screenWidth * 0.036,
                    ),
                  ),
                  SizedBox(
                    height: screenHeight * 0.004,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text("\$" "${product.price}",
                          style: TextStyle(
                            color: Colors.black,
                            fontFamily: "Gilroy-Bold",
                            fontSize: screenWidth * 0.045,
                          )),
                      const Icon(
                        Icons.favorite,
                        color: Colors.red,
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ),
        ),
        Positioned(
          right: screenWidth * 0.06,
          top: screenHeight * -0.073,
          child: Image.network(
            product.image,
            height: screenHeight * 0.12,
            width: screenWidth * 0.24,
          ),
        ),
        IconButton(
          icon: const Icon(
            Icons.edit,
            color: Colors.black,
            size: 20,
          ),
          onPressed: () {},
        ),
      ],
    );
  }
}
