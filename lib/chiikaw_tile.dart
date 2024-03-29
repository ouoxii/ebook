import 'package:ebook/chiikawa.dart';
import 'package:flutter/material.dart';

class ChiikawTile extends StatelessWidget {
  final Chiikawa chiikawa;
  const ChiikawTile({Key? key, required this.chiikawa}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.white,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(chiikawa.name),
          Wrap(
            children: [
              Text(chiikawa.text),
            ],
          ),
        ],
      ),
    );
  }
}
