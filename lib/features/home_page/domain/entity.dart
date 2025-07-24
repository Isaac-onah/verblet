// lib/models/article_model.dart
class Article {
  final String imageUrl;
  final String category;
  final String title;
  final String authorName;
  final String authorImageUrl;
  final String date;
  final String views;

  Article({
    required this.imageUrl,
    required this.category,
    required this.title,
    required this.authorName,
    required this.authorImageUrl,
    required this.date,
    required this.views,
  });
}