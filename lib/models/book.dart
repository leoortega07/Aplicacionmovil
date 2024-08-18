class Book {
  final String id;
  final String title;
  final String content;
  bool isFavorite;

  Book({
    required this.id,
    required this.title,
    required this.content,
    this.isFavorite = false,
  });

  factory Book.fromJson(Map<String, dynamic> json) {
    return Book(
      id: json['id'],
      title: json['title'],
      content: json['content'],
      isFavorite: json['isFavorite'] ?? false,
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'title': title,
      'content': content,
      'isFavorite': isFavorite,
    };
  }
}

