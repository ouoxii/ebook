import 'package:flutter/material.dart';
import 'package:ebook/story.dart';

class StoryDetailTile extends StatelessWidget {
  final Story story;
  const StoryDetailTile({Key? key, required this.story}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    // Widget implementation
    return Scaffold(
      appBar: AppBar(
        title: Text("劇情介紹"),
      ),
      body: Align(
        alignment: Alignment.topCenter,
        child: Container(
          padding: EdgeInsets.all(30),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Image.asset(
                'assets/${story.image}.png',
                width: 450,
              ),
              Text(story.topic),
              Divider(
                thickness: 2,
                height: 10,
                indent: 30,
                endIndent: 30,
              ),
              Wrap(
                children: [
                  Text(story.text,
                      style: TextStyle(fontSize: 15, color: Colors.black)),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
