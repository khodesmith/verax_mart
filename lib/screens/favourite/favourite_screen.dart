import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:verax_mart/constants/app_color.dart';
import 'package:verax_mart/providers/favourite_provider.dart';
import 'package:verax_mart/screens/favourite/favourite_card.dart';

class FavouriteScreen extends StatelessWidget {
  const FavouriteScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        title: Text(
          'Favourite Products',
          style: TextStyle(
            color: kSecondaryColor,
            fontWeight: FontWeight.bold,
            fontSize: 35,
          ),
        ),
      ),
      body: Consumer<FavouriteProvider>(
        builder: (context, value, child) {
          if (value.favourite.isEmpty) {
            return Center(
              child: Text(
                'No Favourite Product Yet',
                style: TextStyle(
                  color: kSecondaryColor,
                  fontWeight: FontWeight.bold,
                  fontSize: 16,
                ),
              ),
            );
          } else {
            return ListView.builder(
              scrollDirection: Axis.vertical,
              itemCount: value.favourite.length,
              itemBuilder: (context, index) {
                final favouriteProduct = value.favourite[index];
                return FavouriteCard(product: favouriteProduct);
              },
            );
          }
        },
      ),
    );
  }
}
