import 'package:flutter/material.dart';
import 'package:flutter_receipt/components/grocery_tile.dart';
import 'package:flutter_receipt/screens/grocery_item_screen.dart';

import '../models/models.dart';

class GroceryListScreen extends StatelessWidget {
  final GroceryManager manager;
  const GroceryListScreen({Key? key, required this.manager}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    final groceryItems = manager.groceryItems;

    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: ListView.separated(
        itemCount: groceryItems.length,
        itemBuilder: (context, index) {
          final item = groceryItems[index];
          // TODO 28: Wrap in a Dismissable
          return InkWell(
            child: GroceryTile(
                key: Key(item.id),
                item: item,
                onComplete: (change) {
                  manager.completeItem(index, change!);
                }),
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => GroceryItemScreen(
                    originalItem: item,
                    onUpdate: (item) {
                      manager.updateItem(item, index);
                      Navigator.pop(context);
                    }, onCreate: (_) {  },
                  ),
                ),
              );
            },
          );
        },
        separatorBuilder: (context, index) {
          return const SizedBox(height: 16.0);
        },
      ),
    );
  }
}
