import 'package:verblet/features/home_page/domain/entity/blog_entity.dart';

class BlogModel extends BlogPost {
  BlogModel(
      {required super.id,
      required super.createdAt,
      required super.updatedAt,
      required super.posterId,
      required super.title,
      required super.content,
      required super.imageUrl,
      required super.topics,
      required super.likes,
      required super.views});
}
