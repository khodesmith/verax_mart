import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:verax_mart/constants/app_color.dart';
import 'package:verax_mart/providers/favourite_provider.dart';
import 'package:verax_mart/screens/product_list/product_model.dart';

class ProductView extends StatelessWidget {
  const ProductView({super.key, required this.product});

  final ProductModel product;

  @override
  Widget build(BuildContext context) {
    return Column(
      // crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Card(
          color: const Color(0xFFF3E0CE),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(10.0),
          ),
          elevation: 5,
          child: Stack(
            children: [
              Container(
                width: 200,
                height: 180,
                decoration: BoxDecoration(
                  image: DecorationImage(
                    image: NetworkImage(product.productImgUrl),
                    fit: BoxFit.contain,
                  ),
                ),
              ),
              Positioned(
                child: Align(
                  alignment: Alignment.topRight,
                  child: Container(
                    width: 40,
                    height: 40,
                    decoration: BoxDecoration(
                      color: kSecondaryColor,
                      borderRadius: const BorderRadius.only(
                        // topLeft: Radius.circular(20),
                        bottomLeft: Radius.circular(10),
                      ),
                    ),
                    child: Consumer<FavouriteProvider>(
                      builder: (context, value, child) {
                        return GestureDetector(
                          onTap: () {
                            value.toggleFavourite(product);
                            log(value.favourite.toString());
                          },
                          child: Icon(
                            value.isExisting(product)
                                ? Icons.favorite
                                : Icons.favorite_border,
                            color: Colors.white,
                          ),
                        );
                      },
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
        Center(
          child: Text(
            product.name,
            style: const TextStyle(
              fontWeight: FontWeight.bold,
              fontSize: 15,
            ),
          ),
        ),
        Center(
          child: Text(
            '${product.currency} ${product.currentPrice}',
            style: TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 16,
                color: kSecondaryColor),
          ),
        ),
      ],
    );
  }
}
