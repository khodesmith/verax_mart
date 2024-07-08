import 'package:flutter/material.dart';
import 'package:verax_mart/constants/app_color.dart';
import 'package:verax_mart/providers/favourite_provider.dart';
import 'package:verax_mart/screens/product_list/product_detail_screen.dart';
import 'package:verax_mart/screens/product_list/product_model.dart';

class FavouriteCard extends StatelessWidget {
  final ProductModel product;

  const FavouriteCard({super.key, required this.product});

  @override
  Widget build(BuildContext context) {
    final favProvider = FavouriteProvider().removeFavourite(product);
    return ListTile(
      leading: Image.network(product.productImgUrl,
          width: 80, height: 80, fit: BoxFit.contain),
      title: Text(
        product.name,
        style: const TextStyle(
          fontWeight: FontWeight.bold,
          fontSize: 15,
        ),
      ),
      subtitle: Text('${product.currency} ${product.currentPrice}'),
      trailing: IconButton(
        onPressed: () {
          favProvider;
        },
        icon: const Icon(Icons.cancel_outlined),
        color: kSecondaryColor,
      ),
      onTap: () {
        Navigator.of(context).push(MaterialPageRoute(
          builder: (context) => ProductDetailScreen(product: product),
        ));
      },
    );
  }
}
