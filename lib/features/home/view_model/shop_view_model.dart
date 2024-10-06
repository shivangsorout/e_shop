import 'package:e_shop/features/home/model/product.dart';
import 'package:e_shop/features/home/repository/shop_repo.dart';
import 'package:e_shop/features/home/repository/shop_exceptions.dart';
import 'package:flutter/material.dart';

class ShopViewModel extends ChangeNotifier {
  List<Product> _products = [];
  bool _isLoading = false;
  String _loadingText = '';
  String? _errorMessage;

  List<Product> get products => _products;
  bool get isLoading => _isLoading;
  String get loadingText => _loadingText;
  String? get errorMessage => _errorMessage;

  // Fetch list of products function
  Future<void> fetchProducts() async {
    try {
      _loadingTrue(text: 'Fetching products..');
      final products = await ShopRepo().fetchProducts();
      _products.addAll(products);
      _errorMessage = null;
    } on InvalidStatusCodeShopException {
      _errorMessage = 'Failed to fetch products. Please try again!';
    } on GenericShopException {
      _errorMessage = 'Error while fetching products list. Please try again!';
    } finally {
      _loadingFalse();
    }
  }

  clearError() {
    _errorMessage = null;
    notifyListeners();
  }

  _loadingTrue({required String text}) {
    _isLoading = true;
    _loadingText = text;
    notifyListeners();
  }

  _loadingFalse() {
    _isLoading = false;
    _loadingText = '';
    notifyListeners();
  }
}
