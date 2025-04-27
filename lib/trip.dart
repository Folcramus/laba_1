class Trip {
  final String title;
  final String date;
  final String image;
  bool isFavorite;

  Trip({
    required this.title,
    required this.date,
    required this.image,
    this.isFavorite = false,
  });

  Trip copyWith({bool? isFavorite}) {
    return Trip(
      title: title,
      date: date,
      image: image,
      isFavorite: isFavorite ?? this.isFavorite,
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'title': title,
      'date': date,
      'image': image,
      'isFavorite': isFavorite,
    };
  }

  factory Trip.fromJson(Map<String, dynamic> json) {
    return Trip(
      title: json['title'],
      date: json['date'],
      image: json['image'],
      isFavorite: json['isFavorite'] ?? false,
    );
  }
}
