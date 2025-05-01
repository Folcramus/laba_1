import 'package:flutter/material.dart';
import 'photo_item.dart';

class DetailScreen extends StatelessWidget {
  final PhotoItem photo;

  const DetailScreen({super.key, required this.photo});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Photo Detail')),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Image.network(photo.imageUrl, width: 100, height: 100),
            const SizedBox(height: 20),
            Text(
              photo.title,
              style: const TextStyle(fontSize: 22, fontWeight: FontWeight.bold),
              textAlign: TextAlign.center,
            ),
          ],
        ),
      ),
    );
  }
}
