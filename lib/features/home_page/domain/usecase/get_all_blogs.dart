
import 'package:fpdart/fpdart.dart';
import 'package:verblet/core/error/failures.dart';
import 'package:verblet/core/usecase_interface/usecase.dart';
import 'package:verblet/features/home_page/domain/entity/blog_entity.dart';
import 'package:verblet/features/home_page/domain/repositories/blog_repository.dart';

class GetAllBlogs implements UseCase<List<BlogPost>, NoParams>{
  final BlogRepository blogRepository;
  GetAllBlogs(this.blogRepository);

  @override
  Future<Either<Failure, List<BlogPost>>> call(NoParams params) async{
    return await blogRepository.getAllBlog();
  }
}