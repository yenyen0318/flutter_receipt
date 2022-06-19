import 'package:flutter/material.dart';
import 'package:flutter_receipt/api/mock_fooderlich_service.dart';

class ExploreScreen extends StatelessWidget {
  final mockService = MockFooderlichService();
  ExploreScreen({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
        future: mockService.getExploreData(),
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.done) {
            return const Center(child: Text('Show TodayRecipeListView'));
          } else {
            return const Center(child: CircularProgressIndicator());
          }
        });
  }
}
