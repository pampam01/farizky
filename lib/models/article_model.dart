// lib/models/article_model.dart
class Article {
  final String title;
  final String category;
  final String imageUrl;
  final String content;

  const Article({
    required this.title,
    required this.category,
    required this.imageUrl,
    required this.content,
  });
}