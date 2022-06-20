import 'package:flutter/material.dart';
import 'package:flutter_receipt/api/mock_fooderlich_service.dart';
import 'package:flutter_receipt/components/components.dart';
import 'package:flutter_receipt/models/explore_data.dart';

class ExploreScreen extends StatefulWidget {
  const ExploreScreen({Key? key}) : super(key: key);

  @override
  State<ExploreScreen> createState() => _ExploreScreenState();
}

class _ExploreScreenState extends State<ExploreScreen> {
  final mockService = MockFooderlichService();
  late ScrollController _controller;

  @override
  void initState() {
    super.initState();
    _controller = ScrollController();
    _controller.addListener(_scrollListener);
  }

  @override
  void dispose() {
    _controller.removeListener(_scrollListener);
    super.dispose();
  }

  void _scrollListener() {
    if (_controller.offset >= _controller.position.maxScrollExtent &&
        !_controller.position.outOfRange) {
      debugPrint('reached the bottom');
    }
    if (_controller.offset <= _controller.position.minScrollExtent &&
        !_controller.position.outOfRange) {
      debugPrint('reached the top!');
    }
  }

  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
        future: mockService.getExploreData(),
        builder: (context, AsyncSnapshot<ExploreData> snapshot) {
          if (snapshot.connectionState == ConnectionState.done) {
            return ListView(
              controller: _controller,
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