import 'package:flutter/material.dart';
import 'package:shop_app/models/product_model.dart';
import 'package:shop_app/services/get_all_products_service.dart';
import 'package:shop_app/widgets/products_grid_view.dart';

class HomeViewBody extends StatelessWidget {
  const HomeViewBody({
    super.key,
    required this.screenWidth,
    required this.screenHeight,
  });

  final double screenWidth;
  final double screenHeight;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(
        left: 12,
        right: 12,
        top: 90,
      ),
      child: FutureBuilder<List<ProductModel>>(
        future: AllProductsService().getAllProducts(),
        builder: (context, snapshot) {
          if (snapshot.hasData) {
            List<ProductModel> products = snapshot.data!;
            return ProductsGridView(
              products: products,
              screenWidth: screenWidth,
              screenHeight: screenHeight,
            );
          } else {
            return const Center(
              child: CircularProgressIndicator(
                valueColor: AlwaysStoppedAnimation<Color>(
                  Color(0xff8d0000),
                ),
              ),
            );
          }
        },
      ),
    );
  }
}
