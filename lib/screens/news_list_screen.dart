import 'package:articles/model/article.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../article_card.dart';
import '../bloc/news_bloc.dart';
import '../bloc/news_state.dart';

class NewsListScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Flutter News App')),
      body: BlocBuilder<NewsBloc, NewsState>(
        builder: (context, state) {
          if (state is NewsLoading) {
            return Center(child: CircularProgressIndicator());
          } else if (state is NewsLoaded) {
            return ListView.builder(
              itemCount: state.articles.length,
              itemBuilder: (context, index) {
                final article = state.articles[index];
                return Padding(
                  padding: const EdgeInsets.all(4.0),
                  child: ArticleCard(article: article),
                );
              },
            );
          } else if (state is NewsError) {
            return Center(child: Text(state.error));
          } else {
            return Center(child: Text('No data'));
          }
        },
      ),
    );
  }
}


