import 'package:flutter/material.dart';
import 'package:ebook/chiikawa.dart';

class ChiikawaDetailTile extends StatelessWidget {
  final Chiikawa chiikawa;

  const ChiikawaDetailTile({Key? key, required this.chiikawa})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    // Widget implementation
    return Scaffold(
      appBar: AppBar(
        title: Text("角色介紹"),
      ),
      body: SingleChildScrollView(
        scrollDirection: Axis.vertical,
        padding: EdgeInsets.all(30),
        child: Container(
          color: Colors.white,
          child: Column(
            children: [
              Image.asset(
                'assets/${chiikawa.image}.png',
                width: 250,
                height: 250,
              ),
              SizedBox(height: 10),
              Text(chiikawa.name, style: TextStyle(fontSize: 25)),
              SizedBox(height: 10),
              Text(chiikawa.birthday),
              SizedBox(height: 10),
              Wrap(
                children: [
                  Text(chiikawa.text,
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
