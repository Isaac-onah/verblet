import 'dart:io';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:verblet/core/usecase_interface/usecase.dart';
import 'package:verblet/features/home_page/domain/entity/blog_entity.dart';
import 'package:verblet/features/home_page/domain/usecase/get_all_blogs.dart';
import 'package:verblet/features/home_page/domain/usecase/upload_blog.dart';

part 'blog_event.dart';
part 'blog_state.dart';

class BlogBloc extends Bloc<BlogEvent, BlogState> {
  final UploadBlog _uploadBlog;
  final GetAllBlogs _getAllBlogs;

  BlogBloc({required UploadBlog uploadBlog, required GetAllBlogs getAllBlogs}) : _uploadBlog = uploadBlog, _getAllBlogs = getAllBlogs ,super(BlogInitial()) {
    on<BlogEvent>((event, emit)  => emit(BlogLoading()));
    on<BlogUploadEvent>(_onBlogUpload);
    on<FetchAllBlogs>(_onFetchAllBlogs);
  }

  void _onBlogUpload(BlogUploadEvent event, Emitter<BlogState> emit) async{
      final result = await _uploadBlog(UploadBlogParams(image: event.image, title: event.title, content: event.content, posterId: event.posterId, topics: event.topics));

      result.fold((l) => emit(BlogFailure(l.message)), (r) => emit(BlogUploadSuccess()));

  }

  void _onFetchAllBlogs(FetchAllBlogs event, Emitter<BlogState> emit) async{
    final result = await _getAllBlogs(NoParams());
    result.fold((l) => emit(BlogFailure(l.message)), (r) => emit(BlogDisplaySuccess(r)));
  }
}
