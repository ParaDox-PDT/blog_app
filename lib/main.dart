import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_defualt_project/cubits/articles/article_add_cubit/articles_cubit.dart';
import 'package:flutter_defualt_project/cubits/articles/article_get_cubit/article_get_cubit.dart';
import 'package:flutter_defualt_project/cubits/auth/auth_cubit.dart';
import 'package:flutter_defualt_project/cubits/profile/profile_cubit.dart';
import 'package:flutter_defualt_project/cubits/tab_box/tab_box_cubit.dart';
import 'package:flutter_defualt_project/cubits/website/website_cubit.dart';
import 'package:flutter_defualt_project/data/repositories/articles_repository.dart';
import 'package:flutter_defualt_project/data/repositories/auth_repository.dart';
import 'package:flutter_defualt_project/data/repositories/website_repository.dart';
import 'package:flutter_defualt_project/presentation/app_routes.dart';
import 'package:flutter_defualt_project/service/service_locator.dart';
import 'package:flutter_defualt_project/utils/theme.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'data/local/storage_repository/storage_repository.dart';
import 'data/repositories/profile_repository.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await StorageRepository.getInstance();
  getItSetup();

  runApp(const App());
}

class App extends StatelessWidget {
  const App({super.key,});

  @override
  Widget build(BuildContext context) {
    return MultiRepositoryProvider(
      providers: [
        RepositoryProvider(
          create: (context) => AuthRepository(),
        ),
        RepositoryProvider(
          create: (context) => ProfileRepository(),
        ),
        RepositoryProvider(
          create: (context) => WebsiteRepository(),
        ),
        RepositoryProvider(
          create: (context) => ArticlesRepository(),
        )
      ],
      child: MultiBlocProvider(
        providers: [
          BlocProvider(
            create: (context) => AuthCubit(
              authRepository: context.read<AuthRepository>(),
            ),
          ),
          BlocProvider(
              create: (context) => TabBoxCubit(
                    authRepository: context.read<AuthRepository>(),
                  )),
          BlocProvider(
              create: (context) => ProfileCubit(
                  profileRepository: context.read<ProfileRepository>())),
          BlocProvider(
              create: (context) => WebsiteCubit(
                  websiteRepository: context.read<WebsiteRepository>())),
          BlocProvider(
              create: (context) =>
                  ArticlesAddCubit(articlesRepository:  context.read<ArticlesRepository>())),
          BlocProvider(
              create: (context) =>
                  ArticleGetCubit(articlesRepository:  context.read<ArticlesRepository>())),
        ],
        child: const MyApp(),
      ),
    );
  }
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      designSize: const Size(360, 800),
      minTextAdapt: true,
      splitScreenMode: true,
      builder: (context, child) {
        return MaterialApp(
          debugShowCheckedModeBanner: false,
          theme: AppTheme.lightTheme,
          darkTheme: AppTheme.darkTheme,
          themeMode: ThemeMode.light,
          initialRoute: RouteNames.splashScreen,
          onGenerateRoute: AppRoutes.generateRoute,
        );
      },
    );
  }
}
