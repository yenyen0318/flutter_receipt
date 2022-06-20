import 'package:flutter/material.dart';
import 'package:flutter_receipt/api/mock_fooderlich_service.dart';
import 'package:flutter_receipt/components/today_recipe_list_view.dart';
import 'package:flutter_receipt/models/explore_data.dart';

import '../components/components.dart';


class ExploreScreen extends StatelessWidget {
  final mockService = MockFooderlichService();

  ExploreScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
        future: mockService.getExploreData(),
        builder: (context, AsyncSnapshot<ExploreData> snapshot) {
          if (snapshot.connectionState == ConnectionState.done) {
            return ListView(
                scrollDirection: Axis.vertical,
                children: [
                  TodayRecipeListView(recipes: snapshot.data?.todayRecipes ?? []),
                  const SizedBox(height: 16),
                  FriendPostListView(friendPosts: snapshot.data?.friendPosts ?? []),
                ]);
          } else {
            return const Center(child: CircularProgressIndicator());
          }
        });
  }
}