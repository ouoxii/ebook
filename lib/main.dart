import 'package:ebook/chiikaw_tile.dart';
import 'package:ebook/chiikawa.dart';
import 'package:flutter/material.dart';

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
  final List<Chiikawa> chiikawas = const [
    Chiikawa(name: '烏薩奇', text: '相信就會有魔法,夢想成真'),
    Chiikawa(name: '小八', text: '人只有用心,才能看見真實的美'),
    Chiikawa(name: '小可愛', text: '一個指環統治他們,勇者拯救世界'),
  ];

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
            GridView.count(
              padding: const EdgeInsets.all(10),
              crossAxisCount: 2,
              mainAxisSpacing: 10,
              crossAxisSpacing: 20,
              children: [
                for (var chiikawa in chiikawas) ChiikawTile(chiikawa: chiikawa)
              ],
            ),
            ListView.builder(
              itemCount: 3,
              itemBuilder: (context, index) {
                var chiikawa = chiikawas[index];
                return Card(
                  color: Colors.lightBlue,
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Column(
                      children: [
                        Text(chiikawa.name),
                        Text(chiikawa.text),
                      ],
                    ),
                  ),
                );
              },
            ),
          ],
        ),
      ),
    );
  }
}
