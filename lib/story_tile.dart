import 'package:ebook/story.dart';
import 'package:flutter/material.dart';
import 'package:ebook/story_detail_tile.dart';

class StoryDetailPageTile extends StatelessWidget {
  final Story story;
  const StoryDetailPageTile({Key? key, required this.story}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => StoryDetailTile(story: story),
          ),
        );
      },
      child: Container(
        child: Card(
          color: Colors.grey[300],
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Column(
              children: [Text(story.topic)],
            ),
          ),
        ),
      ),
    );
  }
}
