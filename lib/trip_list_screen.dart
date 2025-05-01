import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'photo_provider.dart';
import 'detail_screen.dart';

class TripListScreen extends StatelessWidget {
  const TripListScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final photoProvider = Provider.of<PhotoProvider>(context);

    if (photoProvider.photos.isEmpty) {
      photoProvider.loadPhotos();
      return const Center(child: CircularProgressIndicator());
    }

    return ListView.builder(
      itemCount: photoProvider.photos.length,
      itemBuilder: (context, index) {
        final photo = photoProvider.photos[index];
        return ListTile(
          leading: Image.network(photo.imageUrl),
          title: Text(photo.title),
          trailing: IconButton(
            icon: Icon(
              photo.isFavorite ? Icons.favorite : Icons.favorite_border,
              color: photo.isFavorite ? Colors.red : Colors.grey,
            ),
            onPressed: () => photoProvider.toggleFavorite(photo),
          ),
          onTap: () {
            Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) => DetailScreen(photo: photo),
              ),
            );
          },
        );
      },
    );
  }
}
