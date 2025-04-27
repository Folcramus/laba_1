class PhotoItem {
  final int id;
  final String title;
  final String url;
  final String thumbnailUrl;
  bool isFavorite;

  PhotoItem({
    required this.id,
    required this.title,
    required this.url,
    required this.thumbnailUrl,
    this.isFavorite = false,
  });

  factory PhotoItem.fromJson(Map<String, dynamic> json) {
    return PhotoItem(
      id: json['id'],
      title: json['title'],
      url: json['url'],
      thumbnailUrl: json['thumbnailUrl'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'title': title,
      'url': url,
      'thumbnailUrl': thumbnailUrl,
      'isFavorite': isFavorite,
    };
  }
}
