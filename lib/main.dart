import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:movie_app/core/res/fonts.dart';
import 'package:movie_app/core/services/injection_container.dart';
import 'package:movie_app/features/daily_news/domain/usecase/get_article.dart';
import 'package:movie_app/features/daily_news/presentation/bloc/article/remote/remote_article_bloc.dart';
import 'package:movie_app/features/daily_news/presentation/pages/home/daily_news.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await initializeDependecies();
  runApp(const MainApp());
}

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider<RemoteArticleBloc>(
      create: (context) => sl()..add(const GetRemoteArticleEvent()),
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        theme: ThemeData(
          useMaterial3: true,
          scaffoldBackgroundColor: Colors.white,
          fontFamily: Fonts.raleway,
          visualDensity: VisualDensity.adaptivePlatformDensity,
          appBarTheme: const AppBarTheme(
            centerTitle: true,
            color: Colors.transparent,
            elevation: 0,
          ),
        ),
        home: const DailyNews(),
      ),
    );
  }
}
