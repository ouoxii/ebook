import 'package:flutter/material.dart';
import 'package:ebook/chiikawa.dart';

class ChiikawaDetailTile extends StatelessWidget {
  final Chiikawa chiikawa;

  const ChiikawaDetailTile({Key? key, required this.chiikawa})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    // Widget implementation
    return Container(
      color: Colors.white,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Image.asset(
            'assets/${chiikawa.image}.png',
            width: 250,
            height: 250,
          ),
          Text(chiikawa.name),
          Wrap(
            children: [
              Text(chiikawa.text,
                  style: TextStyle(fontSize: 12, color: Colors.black)),
            ],
          ),
        ],
      ),
    );
  }
}
