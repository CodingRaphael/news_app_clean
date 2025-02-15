import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:movie_app/core/common/widgets/article_tile.dart';
import 'package:movie_app/core/services/injection_container.dart';
import 'package:movie_app/features/daily_news/domain/entities/article.dart';
import 'package:movie_app/features/daily_news/presentation/bloc/article/local/local_article_bloc.dart';

class SavedArticles extends HookWidget {
  const SavedArticles({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (_) => sl<LocalArticleBloc>()
        ..add(
          const GetAllSavedArticlesEvent(),
        ),
      child: Scaffold(
        appBar: _buildAppBar(),
        body: _buildBody(),
      ),
    );
  }

  PreferredSizeWidget _buildAppBar() {
    return AppBar(
      leading: Builder(
        builder: (context) => GestureDetector(
          behavior: HitTestBehavior.opaque,
          onTap: () => _onBackButtonTapped(context),
          child: const Icon(
            CupertinoIcons.back,
            color: Colors.black,
          ),
        ),
      ),
      title: const Text(
        "Saved Articles",
        style: TextStyle(color: Colors.white),
      ),
    );
  }

  Widget _buildBody() {
    return BlocBuilder<LocalArticleBloc, LocalArticleState>(
      builder: (context, state) {
        if (state is LocalArticleLoadingState) {
          return const Center(
            child: CupertinoActivityIndicator(),
          );
        } else if (state is LocalArticleLoadedState) {
          return _buildArticlesList(state.articles!);
        }
        return Container();
      },
    );
  }

  Widget _buildArticlesList(List<ArticleEntity> articles) {
    if (articles.isEmpty) {
      return const Center(
        child: Text(
          'NO SAVED ARTICLES YET!!!',
          style: TextStyle(color: Colors.white),
        ),
      );
    }

    return ListView.builder(
        itemCount: articles.length,
        itemBuilder: (context, index) {
          return ArticleTile(
            article: articles[index],
            isRemovable: true,
            onRemove: (article) => _onRemoveArticle(context, article),
            onArticlePressed: (article) => _onArticlePressed(context, article),
          );
        });
  }

  void _onBackButtonTapped(BuildContext context) {
    Navigator.pop(context);
  }

  void _onRemoveArticle(BuildContext context, ArticleEntity article) {
    BlocProvider.of<LocalArticleBloc>(context).add(
      DeleteSavedArticleEvent(article),
    );
  }

  void _onArticlePressed(BuildContext context, ArticleEntity article) {
    Navigator.pushNamed(context, '/ArticleDetails', arguments: article);
  }
}
