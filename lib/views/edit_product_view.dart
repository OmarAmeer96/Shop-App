import 'package:flutter/material.dart';
import 'package:shop_app/models/product_model.dart';
import 'package:shop_app/services/update_product_service.dart';
import 'package:shop_app/widgets/custom_main_button.dart';
import 'package:shop_app/widgets/custom_text_field.dart';

// ignore: must_be_immutable
class EditProductView extends StatelessWidget {
  EditProductView({super.key});

  static String id = "EditProductView";
  String? productName, desc, image, price;

  @override
  Widget build(BuildContext context) {
    ProductModel product =
        ModalRoute.of(context)!.settings.arguments as ProductModel;
    final double screenHeight = MediaQuery.of(context).size.height;
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
                    price = data;
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
                CustomMainButton(
                    text: "Update",
                    onPressed: () {
                      UpdateProductService().updateProduct(
                        title: productName!,
                        price: price!,
                        description: desc!,
                        image: image!,
                        category: product.category,
                      );
                    }),
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
