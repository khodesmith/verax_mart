import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:verax_mart/screens/product_list/product_model.dart';

class FavouriteProvider extends ChangeNotifier {
  final List<ProductModel> _favourite = [];
  List<ProductModel> get favourite => _favourite;

  void toggleFavourite(ProductModel product) {
    if (_favourite.contains(product)) {
      _favourite.remove(product);
    } else {
      _favourite.add(product);
    }
    notifyListeners();
  }

  bool isExisting(ProductModel product) {
    final isExist = _favourite.contains(product);
    return isExist;
  }

  void removeFavourite(ProductModel product) {
    _favourite.remove(product);
    notifyListeners();
  }

  static FavouriteProvider of(
    BuildContext context, {
    bool listen = true,
  }) {
    return Provider.of<FavouriteProvider>(context, listen: listen);
  }
}
