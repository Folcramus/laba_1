import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'photo_provider.dart';
import 'detail_screen.dart';

class FavoritesScreen extends StatelessWidget {
  const FavoritesScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final photoProvider = Provider.of<PhotoProvider>(context);

    final favorites = photoProvider.favorites;

    if (favorites.isEmpty) {
      return const Center(child: Text('Нет избранных фото'));
    }

    return ListView.builder(
      itemCount: favorites.length,
      itemBuilder: (context, index) {
        final photo = favorites[index];
        return ListTile(
          leading: Image.network(photo.url),
          title: Text(photo.title),
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
