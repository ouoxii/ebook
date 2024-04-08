import 'package:ebook/chiikawa.dart';
import 'package:flutter/material.dart';
import 'package:ebook/chiikawa_detail_tile.dart';

class ChiikawaTile extends StatelessWidget {
  final Chiikawa chiikawa;
  const ChiikawaTile({super.key, required this.chiikawa});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => ChiikawaDetailTile(chiikawa: chiikawa),
          ),
        );
      },
      child: Container(
        color: Colors.white,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Image.asset(
              'assets/${chiikawa.image}.png',
              width: 200,
              height: 200,
            ),
            Text(chiikawa.name),
          ],
        ),
      ),
    );
  }
}
