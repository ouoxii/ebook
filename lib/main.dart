import 'dart:convert';
import 'package:flutter/services.dart' show rootBundle;
import 'package:ebook/chiikawa_tile.dart';
import 'package:ebook/chiikawa.dart';
import 'package:flutter/material.dart';
import 'package:ebook/story.dart';
import 'package:ebook/story_tile.dart';
import 'package:audioplayers/audioplayers.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: MyHomePage(),
    );
  }
}

class MyHomePage extends StatelessWidget {
  final AudioPlayer audioPlayer = AudioPlayer();

  MyHomePage() {
    playBackgroundMusic();
  }

  void playBackgroundMusic() async {
    // Set the audio player to loop the audio file
    audioPlayer.setReleaseMode(ReleaseMode.loop);
    // Play the background music from the asset
    try {
      await audioPlayer.play(AssetSource('audio/chiikawa_bgm.mp3'));
      print("Music playing successfully.");
    } catch (e) {
      print("Error while playing music: $e");
    }
  }

  Future<List<Chiikawa>> loadChiikawas() async {
    String jsonString = await rootBundle.loadString('chiikawas.json');
    final List<dynamic> jsonResponse = json.decode(jsonString);
    return jsonResponse.map((item) => Chiikawa.fromJson(item)).toList();
  }

  Future<List<Story>> loadStory() async {
    String jsonString = await rootBundle.loadString('story.json');
    final List<dynamic> jsonResponse = json.decode(jsonString);
    return jsonResponse.map((item) => Story.fromJson(item)).toList();
  }

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 2, // 標籤的數量
      child: Scaffold(
        backgroundColor: Color.fromARGB(242, 242, 242, 242),
        appBar: AppBar(
          title: const Text('Chiikawa Home Page'),
          bottom: TabBar(
            tabs: <Widget>[
              Tab(icon: Icon(Icons.view_module)),
              Tab(icon: Icon(Icons.view_list)),
            ],
          ),
        ),
        body: TabBarView(
          children: [
            FutureBuilder<List<Chiikawa>>(
              future: loadChiikawas(),
              builder: (context, snapshot) {
                if (snapshot.connectionState == ConnectionState.done) {
                  if (snapshot.hasData) {
                    return GridView.count(
                      crossAxisCount: 2,
                      children: snapshot.data!
                          .map((chiikawa) => ChiikawaTile(chiikawa: chiikawa))
                          .toList(),
                    );
                  } else if (snapshot.hasError) {
                    return Text("Error: ${snapshot.error}");
                  }
                }
                return CircularProgressIndicator();
              },
            ),
            FutureBuilder<List<Story>>(
              future: loadStory(),
              builder: (context, snapshot) {
                if (snapshot.connectionState == ConnectionState.done) {
                  if (snapshot.hasData) {
                    return ListView.builder(
                      itemCount: snapshot.data!.length,
                      itemBuilder: (context, index) {
                        final story = snapshot.data![index];
                        return StoryDetailPageTile(story: story);
                      },
                    );
                  } else if (snapshot.hasError) {
                    return Text("Error: ${snapshot.error}");
                  }
                }
                return CircularProgressIndicator();
              },
            ),
          ],
        ),
      ),
    );
  }
}
