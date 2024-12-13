import 'package:falcons_task/domain/repository/Inventory_repository.dart';
import 'package:flutter/cupertino.dart';

import '../state/inventory_state.dart';

class InventoryViewModel with ChangeNotifier {
  final repository = InventoryRepository();

  InventoryState _state = InventoryState();

  InventoryState get state => _state;

  Future<void> loadInventory() async {
    _state = _state.copyWith(isLoading: true);
    notifyListeners();

     try {
      final items = await repository.fetchAndMergeData();
      _state = _state.copyWith(items: items, isLoading: false);
     } catch (e) {
       _state = _state.copyWith(error: e.toString(), isLoading: false);
     }
    notifyListeners();
  }

  Future<void> refreshInventory() async {
    await loadInventory();
  }
}
