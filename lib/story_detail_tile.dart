import 'package:flutter/material.dart';
import 'package:ebook/story.dart';

class StoryDetailTile extends StatelessWidget {
  final Story story;
  const StoryDetailTile({super.key, required this.story});

  @override
  Widget build(BuildContext context) {
    // Widget implementation
    return Scaffold(
      appBar: AppBar(
        title: const Text("劇情介紹"),
      ),
      body: Align(
        alignment: Alignment.topCenter,
        child: Container(
          padding: const EdgeInsets.all(30),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Image.asset(
                'assets/${story.image}.png',
                width: 450,
              ),
              Text(story.topic, style: const TextStyle(fontSize: 25)),
              const Divider(
                thickness: 2,
                height: 10,
                indent: 30,
                endIndent: 30,
              ),
              Wrap(
                children: [
                  Text(story.text,
                      style: const TextStyle(fontSize: 15, color: Colors.black)),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
