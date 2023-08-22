import 'package:flutter/material.dart';

class CustomProductCard extends StatelessWidget {
  const CustomProductCard({
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
          Container(
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
                      "HandBag LV",
                      style: TextStyle(
                        color: Colors.black.withOpacity(0.5),
                        fontFamily: "Gilroy-Bold",
                        fontSize: screenWidth * 0.036,
                      ),
                    ),
                    SizedBox(
                      height: screenHeight * 0.01,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text("\$225",
                            style: TextStyle(
                              color: Colors.black,
                              fontFamily: "Gilroy-Bold",
                              fontSize: screenWidth * 0.036,
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
              "https://fakestoreapi.com/img/81fPKd-2AYL._AC_SL1500_.jpg",
              height: 105,
            ),
          ),
        ],
      ),
    );
  }
}
