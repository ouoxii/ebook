import 'package:flutter/material.dart';
import 'package:ebook/story.dart';

class StoryDetailTile extends StatelessWidget {
  final Story story;
  const StoryDetailTile({Key? key, required this.story}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    // Widget implementation
    return Container(
      color: Colors.white,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Image.asset(
            'assets/${story.image}.png',
            width: 250,
            height: 250,
          ),
          Text(story.topic),
          Wrap(
            children: [
              Text(story.text,
                  style: TextStyle(fontSize: 12, color: Colors.black)),
            ],
          ),
        ],
      ),
    );
  }
}
