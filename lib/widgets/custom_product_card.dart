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
    return Card(
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
    );
  }
}
