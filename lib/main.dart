import 'dart:convert';
import 'package:flutter/services.dart' show rootBundle;
import 'package:ebook/chiikawa_tile.dart';
import 'package:ebook/chiikawa.dart';
import 'package:flutter/material.dart';
import 'package:ebook/story.dart';

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
          title: Text('Chiikawa Home Page'),
          bottom: TabBar(
            tabs: <Widget>[
              Tab(icon: Icon(Icons.directions_car)),
              Tab(icon: Icon(Icons.directions_transit)),
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
                    return ListView(
                      children: snapshot.data!
                          .map((story) => ListTile(title: Text(story.topic)))
                          .toList(),
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
