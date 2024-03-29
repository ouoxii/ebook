import 'package:ebook/chiikawa.dart';
import 'package:flutter/material.dart';

class ChiikawTile extends StatelessWidget {
  final Chiikawa chiikawa;
  const ChiikawTile({Key? key, required this.chiikawa}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Column(
          children: [
            Text(chiikawa.name),
            Text(chiikawa.text),
          ],
        ),
      ],
    );
  }
}
