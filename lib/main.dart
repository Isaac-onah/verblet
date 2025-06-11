import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get/get.dart';
import 'package:verblet/core/theme/theme.dart';
import 'package:verblet/features/auth/presentation/bloc/auth_bloc.dart';
import 'package:verblet/features/auth/presentation/pages/login_page.dart';
import 'package:verblet/init_dependencies.dart';

void main() async{
  WidgetsFlutterBinding.ensureInitialized();
await initDependencies();
  runApp(MultiBlocProvider(
    providers: [
     BlocProvider(create: (_) => serviceLocator<AuthBloc>())
    ],
    child:  const MyApp(),
  ));
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      themeMode: ThemeMode.system,
      theme: MyAppTheme.lightTheme,
      home:  LoginPage(),
    );
  }
}


