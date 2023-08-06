import 'package:articles/screens/article_details_screen.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

import 'generalServices.dart';
import 'model/article.dart';

class ArticleCard extends StatelessWidget {
  const ArticleCard({
    super.key,
    required this.article,
  });

  final Article article;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      child: Card(
        elevation: 3,
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
        color: Colors.grey[800],
        child: Column(
          children: [
            if (article.urlToImage != null)
              Card( // Nested Card for the Image to have its own elevation
                elevation: 4, // Set the elevation for the image
                shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(12),
                  child: Image.network(
                    article.urlToImage,
                    width: double.infinity,
                    height: 120,
                    fit: BoxFit.cover,
                  ),
                ),
              ),
            Text(
              article.source,
              style: const TextStyle(
                fontStyle: FontStyle.italic,
                color: Colors.white54,
              ),
            ),
            ListTile(
              title: Text(
                article.title,
                style: const TextStyle(
                  color: Colors.pinkAccent,
                  fontWeight: FontWeight.bold,
                ),
              ),
              subtitle: Text(
                article.description,
                style: const TextStyle(
                  color: Colors.white,
                ),
              ),
            ),
            const SizedBox(height: 12,),
            Text(
              'Published at: ${formatDate(article.publishedAt)}',
              style: const TextStyle(
                fontStyle: FontStyle.italic,
                color: Colors.white54,
              ),
            ),
          ],
        ),
      ),
      onTap: () {
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => ArticleDetailsScreen(article: article),
          ),
        );
      },
    );
  }
}