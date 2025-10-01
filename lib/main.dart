import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get/get.dart';
import 'package:verblet/core/common/cubits/app_user.dart';
import 'package:verblet/core/enum.dart';
import 'package:verblet/core/theme/theme.dart';
import 'package:verblet/core/theme/themebloc/theme_bloc.dart';
import 'package:verblet/core/theme/themebloc/theme_event.dart';
import 'package:verblet/core/theme/themebloc/theme_state.dart';
import 'package:verblet/features/appnavigator/main_navigator.dart';
import 'package:verblet/features/appnavigator/navigatorbloc/navigation_bloc.dart';
import 'package:verblet/features/auth/presentation/bloc/auth_bloc.dart';
import 'package:verblet/features/auth/presentation/pages/login_page.dart';
import 'package:verblet/features/home_page/presentation/blogbloc/blog_bloc.dart';
import 'package:verblet/init_dependencies.dart';


void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await initDependencies();
  runApp(MultiBlocProvider(
    providers: [
      BlocProvider(create: (_) => serviceLocator<AppUserCubit>()),
      BlocProvider(create: (_) => serviceLocator<AuthBloc>()),
      BlocProvider(create: (_) => NavigationBloc()),
      BlocProvider(create: (_) => ThemeBloc()..add(LoadTheme())),
      BlocProvider(create: (_) => serviceLocator<BlogBloc>()),
    ],
    child: const MyApp(),
  ));
}

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {

  @override
  void initState() {
    super.initState();
    context.read<AuthBloc>().add(AuthIsUserLoggedIn());
  }

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<ThemeBloc, ThemeState>(
      builder: (context, state) {
        return MaterialApp(
          debugShowCheckedModeBanner: false,
          themeMode: state.themeMode.toThemeMode,
          theme: MyAppTheme.lightTheme,
          darkTheme: MyAppTheme.darkTheme,
          home: BlocSelector<AppUserCubit, AppUserState, bool>(
            selector: (state) {
              return state is AppUserLoggedIn;
            },
            builder: (context, isLoggedIn) {
              if (isLoggedIn) {
                return mainNavigator();
              }
              return LoginPage();
            },
          ),
        );
      },
    );
  }
}


