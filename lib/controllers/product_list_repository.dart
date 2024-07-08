import 'dart:convert';
// import 'dart:developer';

import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:verax_mart/constants/api_constants.dart';
import 'package:verax_mart/screens/product_list/product_model.dart';
import 'package:http/http.dart' as http;

class ProductListRepo {
  Future<List<ProductModel>> getProduct() async {
    const url = baseUrl;
    // log('Azeez got it');
    try {
      final uri = Uri.parse(url).replace(
        queryParameters: {
          'organization_id': dotenv.env['org_id'],
          'Appid': dotenv.env['Appid'],
          'Apikey': dotenv.env['apikey'],
        },
      );

      final response = await http.get(uri);
      // log('Azeez got it');
      final json = jsonDecode(response.body) as Map<String, dynamic>;
      final products =
          (json['items'] as List).map((e) => ProductModel.fromJson(e)).toList();
      return products;
    } catch (e) {
      rethrow;
    }
  }
}
