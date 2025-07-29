// lib/models/article_model.dart
class Article {
  final String imageUrl;
  final String category;
  final String title;
  final String authorName;
  final String authorImageUrl;
  final String date;
  final String views;
  final String content;

  Article({
    required this.imageUrl,
    required this.category,
    required this.title,
    required this.authorName,
    required this.authorImageUrl,
    required this.date,
    required this.views,
    required this.content,
  });
}

class BlogPost {
  final String id;
  final DateTime createdAt;
  final DateTime updatedAt;
  final String posterId;
  final String? posterName;
  final String title;
  final String content;
  final String imageUrl;
  final List<String> topics;
  final int likes;
  final int views;

  BlogPost({
    required this.id,
    required this.createdAt,
    required this.updatedAt,
    required this.posterId,
    required this.title,
    required this.content,
    required this.imageUrl,
    required this.topics,
    required this.likes,
    required this.views,
    this.posterName,
  });
}
