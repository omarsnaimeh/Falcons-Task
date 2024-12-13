import 'package:falcons_task/feature/Inventory/components/inventory_components.dart';
import 'package:flutter/material.dart';

import '../view_model/inventory_view_model.dart';

class InventoryView extends StatefulWidget {
  const InventoryView({super.key});

  @override
  State<InventoryView> createState() => _InventoryViewState();
}

class _InventoryViewState extends State<InventoryView> {
  late InventoryViewModel inventoryViewModel;

  @override
  void initState() {
    super.initState();
    inventoryViewModel = InventoryViewModel();
    inventoryViewModel.loadInventory();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Inventory'),
        actions: [
          IconButton(
            icon: const Icon(Icons.refresh),
            onPressed: () => inventoryViewModel.refreshInventory(),
          ),
        ],
      ),
      body: AnimatedBuilder(
        animation: inventoryViewModel,
        builder: (context, _) {
          final state = inventoryViewModel.state;
          if (state.isLoading) {
            return const Center(child: CircularProgressIndicator());
          }

          if (state.items.isEmpty) {
            return const Padding(
              padding: EdgeInsets.all(10),
              child: Center(
                  child: Text(
                'Data Is Empty..Check Your Internet Connection Then Press Refresh To Reload The Data',
                style: TextStyle(
                    color: Colors.black,
                    fontWeight: FontWeight.w600,
                    fontSize: 18),
              )),
            );
          }

          if (state.error != null) {
            return Center(
                child: Text(
                    'Error: ${state.error} Press Refresh To Reload The Data',
                    style: const TextStyle(
                        color: Colors.black,
                        fontWeight: FontWeight.w600,
                        fontSize: 18)));
          }
          return ListView.builder(
            itemCount: state.items.length,
            itemBuilder: (context, index) {
              final item = state.items[index];
              return Padding(
                padding:
                    const EdgeInsets.symmetric(horizontal: 16.0, vertical: 8.0),
                child: inventoryItemCard(
                    item.parsedQty, item.qty, item.barcode, item.name),
              );
            },
          );
        },
      ),
    );
  }
}
