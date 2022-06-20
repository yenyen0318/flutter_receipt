import 'package:flutter/material.dart';
import 'package:flutter_receipt/components/components.dart';
import 'package:flutter_receipt/models/post.dart';

class FriendPostListView extends StatelessWidget {
  final List<Post> friendPosts;
  const FriendPostListView({Key? key, required this.friendPosts})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
        padding: const EdgeInsets.only(left: 16, right: 16, top: 0),
        child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
          Text('Social Chefs ! ', style: Theme.of(context).textTheme.headline1),
          const SizedBox(height: 16),
          ListView.separated(
              primary: false,
              physics: const NeverScrollableScrollPhysics(),
              // 4
              shrinkWrap: true,
              scrollDirection: Axis.vertical,
              itemCount: friendPosts.length,
              itemBuilder: (context, index) {
                // 5
                final post = friendPosts[index];
                return FriendPostTile(post: post);
              },
              separatorBuilder: (context, index) {
                // 6
                return const SizedBox(height: 16);
              }),
          const SizedBox(height: 16),
        ]));
  }
}
