import 'package:flutter/material.dart';

import '../model/article.dart';

class ArticleDetailsScreen extends StatelessWidget {
  final Article article;

  ArticleDetailsScreen({required this.article});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text(article.title)),
      body: Padding(
        padding: EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            if (article.urlToImage != '')
              Image.network(
                article.urlToImage,
                width: double.infinity,
                height: 200,
                fit: BoxFit.cover,
              ),
            SizedBox(height: 16),
            Text(
              article.description,
              style: TextStyle(fontSize: 20),
            ),
            SizedBox(height: 4),
            Divider(thickness: 3),
            SizedBox(height: 4),
            Expanded(
              child: SingleChildScrollView(
                child: Text(
                  article.content, // Replace this with the actual full content of the article
                  style: TextStyle(fontSize: 18),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
