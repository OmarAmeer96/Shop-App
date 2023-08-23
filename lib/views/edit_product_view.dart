import 'package:flutter/material.dart';
import 'package:shop_app/widgets/custom_main_button.dart';
import 'package:shop_app/widgets/custom_text_field.dart';

// ignore: must_be_immutable
class EditProductView extends StatelessWidget {
  EditProductView({super.key});

  static String id = "EditProductView";
  String? productName, desc, image;
  double? price;

  @override
  Widget build(BuildContext context) {
    final double screenHeight = MediaQuery.of(context).size.height;
    final double screenWidth = MediaQuery.of(context).size.width;
    return GestureDetector(
      onTap: () {
        // To close keyboard and remove focus from text fields.
        FocusScope.of(context).unfocus();
      },
      child: Scaffold(
        backgroundColor: Colors.white,
        appBar: buildEditProductViewAppBar(context),
        body: Padding(
          padding: const EdgeInsets.all(16.0),
          child: SingleChildScrollView(
            child: Column(
              children: [
                SizedBox(
                  height: screenHeight * 0.04,
                ),
                CustomTextField(
                  onChanged: (data) {
                    productName = data;
                  },
                  hintText: "Enter Product Name",
                  labelText: "Product Name",
                ),
                SizedBox(
                  height: screenHeight * 0.01,
                ),
                CustomTextField(
                  onChanged: (data) {
                    desc = data;
                  },
                  hintText: "Enter Product Description",
                  labelText: "Product Description",
                ),
                SizedBox(
                  height: screenHeight * 0.01,
                ),
                CustomTextField(
                  textType: TextInputType.number,
                  onChanged: (data) {
                    price = double.parse(data);
                  },
                  hintText: "Enter Price",
                  labelText: "Price",
                ),
                SizedBox(
                  height: screenHeight * 0.01,
                ),
                CustomTextField(
                  onChanged: (data) {
                    image = data;
                  },
                  hintText: "Enter Image",
                  labelText: "Image",
                ),
                SizedBox(
                  height: screenHeight * 0.35,
                ),
                CustomMainButton(text: "Update", onPressed: () {}),
              ],
            ),
          ),
        ),
      ),
    );
  }

  AppBar buildEditProductViewAppBar(BuildContext context) {
    return AppBar(
      leading: IconButton(
        icon: const Icon(
          Icons.arrow_back_ios,
          color: Colors.black,
        ),
        onPressed: () {
          Navigator.pop(context);
        },
      ),
      title: const Text(
        "Update Product",
        style: TextStyle(
          color: Colors.black,
          fontFamily: "Gilroy-Bold",
        ),
      ),
      centerTitle: true,
      backgroundColor: Colors.white,
      elevation: 0,
    );
  }
}
