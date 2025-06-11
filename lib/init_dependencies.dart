import 'package:get_it/get_it.dart';
import 'package:supabase_flutter/supabase_flutter.dart';
import 'package:verblet/core/secrets/app_secrets.dart';
import 'package:verblet/features/auth/data/datasources/auth_supabase.dart';
import 'package:verblet/features/auth/data/repository/auth_repository_impl.dart';
import 'package:verblet/features/auth/domain/repository/auth_repository.dart';
import 'package:verblet/features/auth/domain/usecases/user_sign_up.dart';
import 'package:verblet/features/auth/presentation/bloc/auth_bloc.dart';

final serviceLocator = GetIt.instance;

Future<void> initDependencies() async{
_initAuth();
  final supabase = await Supabase.initialize(url: AppSecrets.supabaseUrl, anonKey: AppSecrets.SupabaseAnonKey);
  serviceLocator.registerLazySingleton(() => supabase.client);

}

void _initAuth(){
  serviceLocator.registerFactory<AuthRemoteDataSource>(()=>AuthRemoteDataSourceImplementation(serviceLocator()));
  serviceLocator.registerFactory<AuthRepository>(()=>AuthRepositoryImplementation(serviceLocator()));
  serviceLocator.registerFactory(()=>UserSignUp(serviceLocator()));
  serviceLocator.registerLazySingleton(() => AuthBloc(userSignUp: serviceLocator()));
}