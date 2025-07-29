

import 'dart:io';


import 'package:fpdart/fpdart.dart';
import 'package:verblet/core/error/failures.dart';
import 'package:verblet/core/usecase_interface/usecase.dart';
import 'package:verblet/features/home_page/domain/entity/blog_entity.dart';
import 'package:verblet/features/home_page/domain/repositories/blog_repository.dart';

class UploadBlog implements UseCase <BlogPost, UploadBlogParams>{
  final BlogRepository blogRepository;
  UploadBlog(this.blogRepository);
  
  @override
  Future<Either<Failure, BlogPost>> call(UploadBlogParams params) async{
    return await blogRepository.uploadBlog(image: params.image, title: params.title, content: params.content, posterId: params.posterId, topics: params.topics);
  }

}

class UploadBlogParams{
  final File image;
  final String title;
  final String content;
  final String posterId;
  final List<String> topics;

  UploadBlogParams({required this.image, required this.title, required this.content, required this.posterId, required this.topics});
}
