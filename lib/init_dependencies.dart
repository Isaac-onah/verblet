import 'package:get_it/get_it.dart';
import 'package:supabase_flutter/supabase_flutter.dart';
import 'package:verblet/core/common/cubits/app_user.dart';
import 'package:verblet/core/secrets/app_secrets.dart';
import 'package:verblet/features/auth/data/datasources/auth_supabase.dart';
import 'package:verblet/features/auth/data/repository/auth_repository_impl.dart';
import 'package:verblet/features/auth/domain/repository/auth_repository.dart';
import 'package:verblet/features/auth/domain/usecases/current_user.dart';
import 'package:verblet/features/auth/domain/usecases/user_login.dart';
import 'package:verblet/features/auth/domain/usecases/user_sign_up.dart';
import 'package:verblet/features/auth/presentation/bloc/auth_bloc.dart';

final serviceLocator = GetIt.instance;

Future<void> initDependencies() async{
_initAuth();
  final supabase = await Supabase.initialize(url: AppSecrets.supabaseUrl, anonKey: AppSecrets.SupabaseAnonKey);
  serviceLocator.registerLazySingleton(() => supabase.client);
 //core
  serviceLocator.registerLazySingleton(()=>AppUserCubit());
}

void _initAuth(){
  //this is the data source
  serviceLocator..registerFactory<AuthRemoteDataSource>(()=>AuthRemoteDataSourceImplementation(serviceLocator()))
    //this is the repository
  ..registerFactory<AuthRepository>(()=>AuthRepositoryImplementation(serviceLocator()))
    //this is the use cases
  ..registerFactory(()=>UserSignUp(serviceLocator()))
  ..registerFactory(()=>UserLogin(serviceLocator()))
  ..registerFactory(()=>CurrentUser(serviceLocator()))
    //this is the Bloc
  ..registerLazySingleton(() => AuthBloc(userSignUp: serviceLocator(), userLogin: serviceLocator(), currentUser: serviceLocator(), appUserCubit: serviceLocator()));
}