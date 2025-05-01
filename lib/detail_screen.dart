import 'package:flutter/material.dart';
import 'photo_item.dart';

class DetailScreen extends StatelessWidget {
  final PhotoItem photo;

  const DetailScreen({Key? key, required this.photo}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Photo Detail')),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Image.network(photo.imageUrl),
            const SizedBox(height: 20),
            Text(
              photo.imageUrl,
              style: const TextStyle(fontSize: 22, fontWeight: FontWeight.bold),
              textAlign: TextAlign.center,
            ),
          ],
        ),
      ),
    );
  }
}
