import 'package:flutter/material.dart';
import 'package:ebook/chiikawa.dart';

class ChiikawaDetailTile extends StatelessWidget {
  final Chiikawa chiikawa;

  const ChiikawaDetailTile({super.key, required this.chiikawa});

  @override
  Widget build(BuildContext context) {
    // Widget implementation
    return Scaffold(
      appBar: AppBar(
        title: const Text("角色介紹"),
      ),
      body: SingleChildScrollView(
        scrollDirection: Axis.vertical,
        padding: const EdgeInsets.all(30),
        child: Container(
          color: Colors.white,
          child: Column(
            children: [
              Image.asset(
                'assets/${chiikawa.image}.png',
                width: 250,
                height: 250,
              ),
              const SizedBox(height: 10),
              Text(chiikawa.name, style: const TextStyle(fontSize: 25)),
              const SizedBox(height: 10),
              Text(chiikawa.birthday),
              const SizedBox(height: 10),
              Wrap(
                children: [
                  Text(chiikawa.text,
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
