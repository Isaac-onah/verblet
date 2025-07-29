import 'dart:io';

import 'package:fpdart/fpdart.dart';
import 'package:verblet/core/error/failures.dart';
import 'package:verblet/features/home_page/domain/entity/blog_entity.dart';

abstract interface class BlogRepository{
  Future<Either<Failure, BlogPost>> uploadBlog({
    required File image,
    required String title,
    required String content,
    required String posterId,
    required List<String> topics,
});
}