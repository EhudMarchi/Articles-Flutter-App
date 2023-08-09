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
      appBar: AppBar(title: Text('Flutter News App'),
          backgroundColor: Colors.grey[800]),
      backgroundColor: Colors.grey[900],
      body: BlocBuilder<NewsBloc, NewsState>(
        builder: (context, state) {
          if (state is NewsLoading) {
            return const Center(child: CircularProgressIndicator(color: Colors.pinkAccent,));
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
            return Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Image.asset('assets/images/error_image.png',height: 200, color: Colors.pinkAccent), // Replace with your error image asset
                  const SizedBox(height: 20),
                  Text(
                    state.error,
                    style: const TextStyle(
                      color: Colors.white,
                      fontSize: 18,
                    ),
                  ),
                ],
              ),
            );
          } else {
            return Center(child: Text('No data'));
          }
        },
      ),
    );
  }
}


