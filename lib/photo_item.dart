class PhotoItem {
  final int id;
  final String title;
  final String imageUrl;
  bool isFavorite;

  PhotoItem({
    required this.id,
    required this.title,
    required this.imageUrl,
    this.isFavorite = false,
  });

  factory PhotoItem.fromJson(Map<String, dynamic> json) {
    return PhotoItem(
      id: json['id'],
      title: json['title'],
      imageUrl: json['image'],
      isFavorite: json['isFavorite'] ?? false,
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'title': title,
      'image': imageUrl,
      'isFavorite': isFavorite,
    };
  }
}
