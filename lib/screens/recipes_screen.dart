import 'package:flutter/material.dart';
import 'package:flutter_receipt/api/mock_fooderlich_service.dart';

class RecipesScreen extends StatelessWidget {
  final exploreService = MockFooderlichService();
  RecipesScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
        future: exploreService.getRecipes(),
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.done) {
            // TODO: Add RecipesGridView Here
            return const Center(child: Text('Recipes Screen'));
          } else {
            return const Center(child: CircularProgressIndicator());
          }
        });
  }
}
