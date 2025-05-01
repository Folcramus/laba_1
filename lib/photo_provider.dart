import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'photo_item.dart';
import 'dart:convert';
import 'package:http/http.dart' as http;

class PhotoProvider extends ChangeNotifier {
  List<PhotoItem> _photos = [];

  List<PhotoItem> get photos => _photos;
  List<PhotoItem> get favorites => _photos.where((photo) => photo.isFavorite).toList();

  Future<void> loadPhotos() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    String? cachedPhotos = prefs.getString('cached_photos');

    if (cachedPhotos != null) {
      List decoded = json.decode(cachedPhotos);
      _photos = decoded.map((e) => PhotoItem.fromJson(e)).toList();
      notifyListeners();
    } else {
      var response = await http.get(Uri.parse('https://fakestoreapi.com/products'));
      if (response.statusCode == 200) {
        List decoded = json.decode(response.body);
        _photos = decoded.map((e) => PhotoItem.fromJson(e)).toList();
        savePhotos();
        notifyListeners();
      }
    }
  }

  Future<void> savePhotos() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    await prefs.setString('cached_photos', json.encode(_photos.map((e) => e.toJson()).toList()));
  }

  void toggleFavorite(PhotoItem photo) {
    final index = _photos.indexWhere((p) => p.id == photo.id);
    if (index != -1) {
      _photos[index].isFavorite = !_photos[index].isFavorite;
      savePhotos();
      notifyListeners();
    }
  }
}
