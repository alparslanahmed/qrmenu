import 'dart:convert';
import 'dart:typed_data';

import 'package:flutter/material.dart';
import 'package:localstore/localstore.dart';
import '../api.dart';
import '../models/business.dart';
import '../models/category.dart';
import '../models/product.dart';

final db = Localstore.instance;

class MainProvider with ChangeNotifier {
  final ApiClient apiClient = ApiClient();

  Business? _business;

  List<Category> _categories = [];

  List<Category> get categories => _categories;

  Future<Uint8List> getImage(String url) async {
    final response = await apiClient.getImage(url);
    if (response.statusCode == 200) {
      return response.bodyBytes;
    } else {
      return Uint8List(0);
    }
  }

  Future<Business?> getBusiness() async {
    final response = await apiClient.get('/business');

    if (response.statusCode == 200) {
      final data = json.decode(utf8.decode(response.bodyBytes));
      _business = Business(
        name: data['business_name'],
        address: data['address'],
        logoUrl: data['logo_url'],
        phone: data['phone'],
      );

      notifyListeners();

      return _business;
    } else {
      throw Exception('Failed to get business');
    }
  }

  Future<Category> getCategory(int id) async {
    final response = await apiClient.get('/categories/$id');

    if (response.statusCode == 200) {
      final data = json.decode(utf8.decode(response.bodyBytes));
      return Category.fromJson(data);
    } else {
      throw Exception('Failed to get category');
    }
  }

  Future<List<Category>> fetchCategories() async {
    final response = await apiClient.get('/categories');

    if (response.statusCode == 200) {
      final List<dynamic> data = json.decode(utf8.decode(response.bodyBytes));
      _categories = data.map((json) {
        return Category.fromJson(json);
      }).toList();
      notifyListeners();
      return categories;
    } else {
      return [];
    }
  }

  Future<List<Product>> fetchProducts(int categoryId) async {
    final response = await apiClient.get('/products/$categoryId');

    if (response.statusCode == 200) {
      final List<dynamic> data = json.decode(utf8.decode(response.bodyBytes));
      return data.map((json) {
        return Product.fromJson(json);
      }).toList();
    } else {
      return [];
    }
  }

}
