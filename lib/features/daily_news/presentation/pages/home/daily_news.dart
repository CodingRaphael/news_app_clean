import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:movie_app/core/common/widgets/article_tile.dart';
import 'package:movie_app/features/daily_news/domain/entities/article.dart';
import 'package:movie_app/features/daily_news/presentation/bloc/article/remote/remote_article_bloc.dart';

class DailyNews extends StatelessWidget {
  const DailyNews({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Daily News'),
      ),
      body: BlocBuilder<RemoteArticleBloc, RemoteArticleState>(
        builder: (_, state) {
          if (state is RemoteArticleInitial) {
            return const Center(
              child: CircularProgressIndicator(),
            );
          } else if (state is RemoteArticleLoadingState) {
            return const Center(
              child: Text('Loading...'),
            );
          } else if (state is RemoteArticleLoadedState) {
            return ListView.builder(
              itemCount: state.articles.length,
              itemBuilder: (context, index) {
                return ArticleTile(
                  article: state.articles![index],
                  onArticlePressed: (article) =>
                      _onArticlePressed(context, article),
                );
              },
            );
          } else if (state is RemoteArticleErrorState) {
            return Center(
              child: Text(state.error.message ?? "Unknown error"),
            );
          } else {
            return const Center(
              child: Text('Unknown State'),
            );
          }
        },
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () => _onShowSavedArticlesViewTapped(context),
        child: Icon(Icons.article_outlined),
      ),
    );
  }

  void _onArticlePressed(BuildContext context, ArticleEntity article) {
    Navigator.pushNamed(context, '/ArticleDetails', arguments: article);
  }

  void _onShowSavedArticlesViewTapped(BuildContext context) {
    Navigator.pushNamed(context, '/SavedArticles');
  }
}
