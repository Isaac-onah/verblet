import 'package:verblet/features/home_page/domain/entity/blog_entity.dart';

class BlogModel extends BlogPost {
  BlogModel(
      {required super.id,
      required super.createdAt,
      required super.updatedAt,
      required super.posterId,
      super.posterName,
      required super.title,
      required super.content,
      required super.imageUrl,
      required super.topics,
      required super.likes,
      required super.views,});

  factory BlogModel.fromJson(Map<String, dynamic> json) {
      return BlogModel(
          id: json['id'] as String,
          createdAt:json['created_at'] == null ? DateTime.now() : DateTime.parse(json['created_at']),
          updatedAt:json['updated_at'] == null ? DateTime.now() :  DateTime.parse(json['updated_at']),
          posterId: json['poster_id'] as String,
          title: json['title'] as String,
          content: json['content'] as String,
          imageUrl: json['image_url'] as String,
          topics: List<String>.from(json['topics'] ?? []),
          likes: json['likes'] ?? 0,
          views: json['views'] ?? 0,
      );
  }

  // Convert to JSON (e.g., when sending data to Supabase)
  Map<String, dynamic> toJson() {

      return {
          'id': id,
          'created_at': createdAt.toIso8601String(),
          'updated_at': updatedAt.toIso8601String(),
          'poster_id': posterId,
          'title': title,
          'content': content,
          'image_url': imageUrl,
          'topics': topics,
          'likes': likes,
          'views': views,
      };
  }

  // Create a copy with updated values
  BlogModel copyWith({
      String? id,
      DateTime? createdAt,
      DateTime? updatedAt,
      String? posterId,
      String? posterName,
      String? title,
      String? content,
      String? imageUrl,
      List<String>? topics,
      int? likes,
      int? views,
  }) {
      return BlogModel(
          id: id ?? this.id,
          createdAt: createdAt ?? this.createdAt,
          updatedAt: updatedAt ?? this.createdAt, // Update timestamp on modification
          posterId: posterId ?? this.posterId,
          posterName: posterName ?? this.posterName,
          title: title ?? this.title,
          content: content ?? this.content,
          imageUrl: imageUrl ?? this.imageUrl,
          topics: topics ?? this.topics,
          likes: likes ?? this.likes,
          views: views ?? this.views,
      );
  }
}
