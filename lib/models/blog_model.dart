class BlogModel {
  final String title;
  final String category;
  final String content;
  final int date;
  String thumbUrl = '';

  BlogModel({
    required this.title,
    required this.category,
    required this.content,
    required this.date,
    this.thumbUrl = '',
  });

  factory BlogModel.fromMap(Map<String, dynamic> map) {
    return BlogModel(
      title: map['title'] ?? 'default',
      category: map['category'] ?? 'default',
      content: map['content'] ?? 'default',
      date: map['date'] ?? 'default',
      thumbUrl: map['thumb_url'],
    );
  }

  Map<String, dynamic> toMap(String url) {
    return {
      "title": title,
      "category": category,
      "content": content,
      "thumb_url": url,
      "date": date,
    };
  }
}
