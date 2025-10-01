part of 'init_dependencies.dart';

final serviceLocator = GetIt.instance;

Future<void> initDependencies() async{
  // Initialize Supabase first
  final supabase = await Supabase.initialize(
    url: AppSecrets.supabaseUrl,
    anonKey: AppSecrets.SupabaseAnonKey,
  );

  // Register core dependencies
  serviceLocator.registerLazySingleton(() => supabase.client);
  serviceLocator.registerLazySingleton(() => InternetConnection());
  serviceLocator.registerLazySingleton<ConnectionChecker>(
        () => ConnectionCheckerImplementation(serviceLocator()),
  );

  // Initialize feature dependencies
  _initAuth();
  _initBlog();

  // Register AppUserCubit after auth is initialized
  serviceLocator.registerLazySingleton(() => AppUserCubit());
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