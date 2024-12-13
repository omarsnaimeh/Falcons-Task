import 'package:falcons_task/domain/model/items_response_model.dart';
import 'package:falcons_task/domain/model/quantity_response_model.dart';

import '../../data/local/database_helper.dart';
import '../../data/remote/api_service.dart';

class InventoryRepository {
  final apiService = ApiService();

  final databaseHelper = DatabaseHelper();

  Future<List<ItemsResponseModel>> fetchAndMergeData() async {
    try {
      final items = await apiService.fetchItems();
      final quantities = await apiService.fetchQuantities();

      for (var item in items) {
        final matchingQty = quantities.firstWhere(
            (qty) => qty.itemOCode == item.itemNo,
            orElse: () =>
                QuantityResponseModel(itemOCode: item.itemNo, qty: '0'));
        item.qty = matchingQty.qty;
      }

      await databaseHelper.insertItems(items);

      return await databaseHelper.fetchItems();
    } catch (error) {
      return await databaseHelper.fetchItems();
    }
  }
}
