class ProductModel {
  final String name;
  final String? description;
  final String imageUrl;
  final double currentPrice;
  final String currency;

  ProductModel({
    required this.name,
    required this.description,
    required this.imageUrl,
    required this.currentPrice,
    required this.currency,
  });
  String get productImgUrl => 'https://api.timbu.cloud/images/$imageUrl';

  factory ProductModel.fromJson(Map<String, dynamic> json) {
    final currencyData =
        (json['current_price'] as List)[0] as Map<String, dynamic>;
    return ProductModel(
      name: json['name'],
      description: json['description'],
      imageUrl: (json['photos'] as List)[0]['url'],
      currency: currencyData.keys.toList()[0],
      currentPrice: currencyData.values.toList()[0][0],
    );
  }

  @override
  String toString() {
    return 'ProductModel($name $currency $currentPrice $description $imageUrl)';
  }
}
