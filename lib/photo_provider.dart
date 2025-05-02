import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'photo_item.dart';
import 'dart:convert';
import 'package:http/http.dart' as http;

// Класс провайдера, который управляет списком фотографий и уведомляет слушателей об изменениях.
class PhotoProvider extends ChangeNotifier {
  // Приватный список всех фото (товаров).
  List<PhotoItem> _photos = [];

  // Геттер: возвращает весь список фото.
  List<PhotoItem> get photos => _photos;

  // Геттер: возвращает только те фото, которые добавлены в избранное.
  List<PhotoItem> get favorites => _photos.where((photo) => photo.isFavorite).toList();

  // Метод загрузки фото: сначала пытается взять из кэша, если нет — загружает из сети.
  Future<void> loadPhotos() async {
    // Получаем экземпляр SharedPreferences (локальное хранилище).
    SharedPreferences prefs = await SharedPreferences.getInstance();
    String? cachedPhotos = prefs.getString('cached_photos');

    // Если есть закэшированные данные, декодируем и загружаем их.
    if (cachedPhotos != null) {
      List decoded = json.decode(cachedPhotos);
      _photos = decoded.map((e) => PhotoItem.fromJson(e)).toList();
      notifyListeners(); // Обновляем UI.
    } else {
      // Если кэша нет — делаем запрос к API.
      var response = await http.get(Uri.parse('https://fakestoreapi.com/products'));

      // Если запрос успешный (код 200) — обрабатываем ответ.
      if (response.statusCode == 200) {
        List decoded = json.decode(response.body);
        _photos = decoded.map((e) => PhotoItem.fromJson(e)).toList();
        savePhotos();     // Сохраняем в кэш.
        notifyListeners(); // Обновляем UI.
      }
    }
  }

  // Метод сохранения текущих фото в кэш (SharedPreferences).
  Future<void> savePhotos() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();

    // Преобразуем список объектов в JSON-строку и сохраняем.
    await prefs.setString(
      'cached_photos',
      json.encode(_photos.map((e) => e.toJson()).toList()),
    );
  }

  // Метод для переключения состояния "избранное" у конкретного фото.
  void toggleFavorite(PhotoItem photo) {
    // Находим индекс нужного фото по его ID.
    final index = _photos.indexWhere((p) => p.id == photo.id);

    if (index != -1) {
      // Меняем состояние isFavorite на противоположное.
      _photos[index].isFavorite = !_photos[index].isFavorite;
      savePhotos();      // Сохраняем изменения в кэш.
      notifyListeners(); // Уведомляем UI об изменениях.
    }
  }
}
