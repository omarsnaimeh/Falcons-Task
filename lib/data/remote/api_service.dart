import 'dart:convert';

import 'package:falcons_task/data/url/url.dart';
import 'package:falcons_task/domain/model/items_response_model.dart';
import 'package:falcons_task/domain/model/quantity_response_model.dart';
import 'package:http/http.dart' as http;

class ApiService {
  Future<List<ItemsResponseModel>> fetchItems() async {
    final response =
        await http.get(Uri.parse('${Url.baseUrl}${Url.itemsEndPoint}'));
    if (response.statusCode == 200) {
      final jsonData = json.decode(response.body);
      return (jsonData['Items_Master'] as List)
          .map((e) => ItemsResponseModel.fromJson(e))
          .toList();
    } else {
      throw Exception('Failed to fetch items');
    }
  }

  Future<List<QuantityResponseModel>> fetchQuantities() async {
    final response =
        await http.get(Uri.parse('${Url.baseUrl}${Url.quantityEndPoint}'));
    if (response.statusCode == 200) {
      final jsonData = json.decode(response.body);
      return (jsonData['SalesMan_Items_Balance'] as List)
          .map((e) => QuantityResponseModel.fromJson(e))
          .toList();
    } else {
      throw Exception('Failed to fetch quantities');
    }
  }
}
