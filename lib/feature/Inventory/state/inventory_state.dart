import 'package:falcons_task/domain/model/items_response_model.dart';

class InventoryState {
  final bool isLoading;
  final List<ItemsResponseModel> items;
  final String? error;

  InventoryState({
    this.isLoading = false,
    this.items = const [],
    this.error,
  });

  InventoryState copyWith({
    bool? isLoading,
    List<ItemsResponseModel>? items,
    String? error,
  }) {
    return InventoryState(
      isLoading: isLoading ?? this.isLoading,
      items: items ?? this.items,
      error: error,
    );
  }
}
