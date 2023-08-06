import 'package:flutter/material.dart';

import '../generalServices.dart';
import '../model/article.dart';

class ArticleDetailsScreen extends StatelessWidget {
  final Article article;

  ArticleDetailsScreen({required this.article});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text(article.title),
      backgroundColor:Colors.grey[800],),
      backgroundColor: Colors.grey[900],
      body: Padding(
        padding: EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            if (article.urlToImage != '')
              ClipRRect(
                borderRadius: BorderRadius.circular(12),
                child: Image.network(
                  article.urlToImage,
                  width: double.infinity,
                  height: 200,
                  fit: BoxFit.cover,
                ),
              ),
            SizedBox(height: 16),
            Text(
              article.source,
              style: const TextStyle(
                fontStyle: FontStyle.italic,
                fontWeight: FontWeight.w900,
                color: Colors.white54,
                fontSize: 18,
              ),
            ),
            SizedBox(height: 4),
            Text(
              'Published at: ${formatDate(article.publishedAt)}',
              style: const TextStyle(
                fontStyle: FontStyle.italic,
                color: Colors.white54,
              ),
            ),
            SizedBox(height: 16),
            Text(
              article.description,
              style: TextStyle(fontSize: 20, color: Colors.white),
            ),
            SizedBox(height: 4),
            Divider(thickness: 3, color: Colors.pinkAccent,),
            SizedBox(height: 4),
            Expanded(
              child: SingleChildScrollView(
                child: Text(
                  article.content, // Replace this with the actual full content of the article
                  style: TextStyle(fontSize: 18, color: Colors.white),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
