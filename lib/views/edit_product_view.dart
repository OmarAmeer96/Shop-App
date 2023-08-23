import 'package:flutter/material.dart';

class EditProductView extends StatelessWidget {
  const EditProductView({super.key});

  static String id = "EditProductView";

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: buildEditProductViewAppBar(context),
      body: ,
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
    );
  }
}
