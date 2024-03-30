import 'package:ebook/chiikawa.dart';
import 'package:flutter/material.dart';

class ChiikawDetailPageTile extends StatelessWidget {
  final Chiikawa chiikawainfo;
  const ChiikawDetailPageTile({Key? key, required this.chiikawainfo})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.white,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Image.asset(
            'assets/${chiikawainfo.image}.png',
            width: 78,
            height: 78,
          ),
        ],
      ),
    );
  }
}
