import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:verax_mart/controllers/product_list_repository.dart';
import 'package:verax_mart/screens/product_list/product_model.dart';

class ProductListProvider extends ChangeNotifier {
  bool _loading = true;
  bool get loading => _loading;

  final _productListRepo = ProductListRepo();

  List<ProductModel> _product = [];
  List<ProductModel> get product => _product;

  Future<void> getProductList() async {
    log('loadig 1');
    log(loading.toString());
    try {
      _product = await _productListRepo.getProduct();
      log('_product logging...');
      log(_product.toString());
      _updateLoading();
      log('loadig 2');
      log(loading.toString());
    } catch (e) {
      log(e.toString());
    }
    return;
  }

  void _updateLoading() {
    _loading = !_loading;
    log('loading...');
    notifyListeners();
  }
}
