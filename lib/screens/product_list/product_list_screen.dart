import 'dart:developer';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:verax_mart/constants/app_color.dart';
import 'package:verax_mart/screens/favourite/favourite_screen.dart';
import 'package:verax_mart/screens/product_list/product_detail_screen.dart';
import 'package:verax_mart/providers/product_list_provider.dart';
import 'package:verax_mart/screens/product_list/product_view.dart';

class ProductListScreen extends StatefulWidget {
  const ProductListScreen({super.key});

  @override
  State<ProductListScreen> createState() => _ProductListScreenState();
}

final productListProvider = ProductListProvider();

class _ProductListScreenState extends State<ProductListScreen> {
  @override
  void initState() {
    Future.microtask(
      () => context.read<ProductListProvider>().getProductList(),
    );

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: kBackgroundColor,
      appBar: AppBar(
        backgroundColor: Colors.white,
        title: Text(
          'Verax Mart',
          style: TextStyle(
            color: kSecondaryColor,
            fontWeight: FontWeight.bold,
            fontSize: 35,
          ),
        ),
        actions: [
          IconButton(
              onPressed: () {
                Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => const FavouriteScreen(),
                    ));
              },
              icon: Icon(
                Icons.favorite_border_rounded,
                color: kSecondaryColor,
              ))
        ],
      ),
      body: Consumer<ProductListProvider>(
        builder: (context, value, child) {
          if (value.loading) {
            log(value.loading.toString());
            return const Center(
              child: CircularProgressIndicator(),
            );
          } else if (value.product.isEmpty) {
            return const Center(
              child: Text('Empty List'),
            );
          } else {
            return GridView.builder(
              // padding: const EdgeInsets.all(15),
              itemCount: value.product.length,
              gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 2,
                childAspectRatio: 5 / 6,
                crossAxisSpacing: 5,
                mainAxisSpacing: 5,
              ),
              itemBuilder: (context, index) {
                final productList = value.product[index];
                return InkWell(
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) =>
                            ProductDetailScreen(product: productList),
                      ),
                    );
                  },
                  child: ProductView(
                    product: productList,
                  ),
                );
              },
            );
          }
        },
      ),
    );
  }
}
