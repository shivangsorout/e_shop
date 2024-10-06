import 'dart:convert';
import 'package:e_shop/features/home/repository/shop_exceptions.dart';
import 'package:http/http.dart' as http;
import 'package:e_shop/features/home/model/product.dart';

class ShopRepo {
  // Declaring Singleton class
  factory ShopRepo() => sharedReference;
  static final sharedReference = ShopRepo._sharedInstance();
  ShopRepo._sharedInstance();

  final String baseUrl = 'https://dummyjson.com/products';

  // Fetch the list of products
  Future<List<Product>> fetchProducts() async {
    try {
      final response = await http.get(Uri.parse(baseUrl));

      if (response.statusCode == 200) {
        // Parse the JSON response
        final Map<String, dynamic> data = json.decode(response.body);
        // Extract the product list and convert it to a list of Product objects
        List<Product> products = (data['products'] as List)
            .map((productJson) => Product.fromJson(productJson))
            .toList();
        return products;
      } else {
        throw InvalidStatusCodeShopException();
      }
    } catch (_) {
      throw GenericShopException();
    }
  }
}
