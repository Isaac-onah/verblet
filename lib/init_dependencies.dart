import 'package:get_it/get_it.dart';
import 'package:internet_connection_checker_plus/internet_connection_checker_plus.dart';
import 'package:supabase_flutter/supabase_flutter.dart';
import 'package:verblet/core/common/cubits/app_user.dart';
import 'package:verblet/core/network/connection_checker.dart';
import 'package:verblet/core/secrets/app_secrets.dart';
import 'package:verblet/features/auth/data/datasources/auth_supabase.dart';
import 'package:verblet/features/auth/data/repository/auth_repository_impl.dart';
import 'package:verblet/features/auth/domain/repository/auth_repository.dart';
import 'package:verblet/features/auth/domain/usecases/current_user.dart';
import 'package:verblet/features/auth/domain/usecases/user_login.dart';
import 'package:verblet/features/auth/domain/usecases/user_sign_up.dart';
import 'package:verblet/features/auth/presentation/bloc/auth_bloc.dart';
import 'package:verblet/features/home_page/data/datasources/remote_data_source.dart';
import 'package:verblet/features/home_page/data/repositories/blog_repository_implementation.dart';
import 'package:verblet/features/home_page/domain/repositories/blog_repository.dart';
import 'package:verblet/features/home_page/domain/usecase/get_all_blogs.dart';
import 'package:verblet/features/home_page/domain/usecase/upload_blog.dart';
import 'package:verblet/features/home_page/presentation/blogbloc/blog_bloc.dart';

final serviceLocator = GetIt.instance;

Future<void> initDependencies() async{
_initAuth();
_initBlog();
  final supabase = await Supabase.initialize(url: AppSecrets.supabaseUrl, anonKey: AppSecrets.SupabaseAnonKey);
  serviceLocator.registerLazySingleton(() => supabase.client);
 //core
serviceLocator.registerFactory(()=>InternetConnection());
  serviceLocator.registerLazySingleton(()=>AppUserCubit());
  serviceLocator.registerFactory(()=>ConnectionCheckerImplementation(serviceLocator()));
}

void _initAuth(){
  //this is the data source
  serviceLocator..registerFactory<AuthRemoteDataSource>(()=>AuthRemoteDataSourceImplementation(serviceLocator()))
    //this is the repository
  ..registerFactory<AuthRepository>(()=>AuthRepositoryImplementation(serviceLocator(),serviceLocator()))
    //this is the use cases
  ..registerFactory(()=>UserSignUp(serviceLocator()))
  ..registerFactory(()=>UserLogin(serviceLocator()))
  ..registerFactory(()=>CurrentUser(serviceLocator()))
    //this is the Bloc
  ..registerLazySingleton(() => AuthBloc(userSignUp: serviceLocator(), userLogin: serviceLocator(), currentUser: serviceLocator(), appUserCubit: serviceLocator()));
}

void _initBlog(){
  //this is the data source
  serviceLocator..registerFactory<BlogRemoteDataSource>(()=>BlogRemoteDataSourceImplementation(serviceLocator()))
    //this is the repository
  ..registerFactory<BlogRepository>(()=>BlogRepositoryImplementation(serviceLocator()))
    //this is the use cases
  ..registerFactory(()=>UploadBlog(serviceLocator()))
  ..registerFactory(()=>GetAllBlogs(serviceLocator()))
    //this is the Bloc
  ..registerLazySingleton(() => BlogBloc(uploadBlog:serviceLocator(),  getAllBlogs: serviceLocator(), ));
}