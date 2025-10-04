import 'package:ecommerce_spinecode/feature/products/data/models/produc_models.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

class ApiServices with ChangeNotifier {
  Product? products; // Store fetched data
  bool isLoading = false;

  Future<void> fetchData() async {
    isLoading = true;
    notifyListeners();

    try {
      final url = Uri.parse("https://dummyjson.com/products");
      final response = await http.get(url);

      print('Status Code: ${response.statusCode}');
      print('Response Body: ${response.body}');

      if (response.statusCode == 200) {
        products = productFromJson(response.body);
      } else {
        throw Exception("Failed to load data");
      }
    } catch (e) {
      print("Error fetching data: $e");
    } finally {
      isLoading = false;
      notifyListeners();
    }
  }
}
