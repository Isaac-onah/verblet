import 'dart:io';

import 'package:fpdart/fpdart.dart';
import 'package:uuid/uuid.dart';
import 'package:verblet/core/error/exceptions.dart';
import 'package:verblet/core/error/failures.dart';
import 'package:verblet/features/home_page/data/blogmodel/blog_model.dart';
import 'package:verblet/features/home_page/data/datasources/remote_data_source.dart';
import 'package:verblet/features/home_page/domain/entity/blog_entity.dart';
import 'package:verblet/features/home_page/domain/repositories/blog_repository.dart';

class BlogRepositoryImplementation implements BlogRepository {
  final BlogRemoteDataSource blogRemoteDataSource;

  BlogRepositoryImplementation(this.blogRemoteDataSource);

  @override
  Future<Either<Failure, BlogPost>> uploadBlog(
      {required File image,
      required String title,
      required String content,
      required String posterId,
      required List<String> topics}) async {
    try {
      BlogModel blogModel = BlogModel(
          id: Uuid().v1(),
          createdAt: DateTime.now(),
          updatedAt: DateTime.now(),
          posterId: posterId,
          title: title,
          content: content,
          imageUrl: '',
          topics: topics,
          likes: 0,
          views: 0);

      final imageUrl = await blogRemoteDataSource.uploadBlogImage(
          image: image, blog: blogModel);
      blogModel = blogModel.copyWith(imageUrl: imageUrl);
      
      final uploadedBlog = await blogRemoteDataSource.uploadBlog(blogModel);
      return right(uploadedBlog);
    } on ServerException catch (e) {
      return left(Failure(e.message));
    }catch (e) {
      return left(Failure('Unexpected error: ${e.toString()}'));
    }
  }

  @override
  Future<Either<Failure, List<BlogPost>>> getAllBlog() async {
    try {
      final blogs = await blogRemoteDataSource.getAllBlogs();
      return right(blogs);
    } on ServerException catch (e) {
      return left(Failure(e.message));
    }catch (e) {
      return left(Failure('Unexpected error: ${e.toString()}'));
    }
  }
}
