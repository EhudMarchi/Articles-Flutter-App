import 'package:articles/screens/article_details_screen.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

import 'model/article.dart';

class ArticleCard extends StatelessWidget {
  const ArticleCard({
    super.key,
    required this.article,
  });

  final Article article;

  String formatDate(String dateString) {
    final DateTime date = DateTime.parse(dateString);
    final DateFormat formatter = DateFormat('MMM dd, yyyy, h:mm a');
    return formatter.format(date);
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      child: Card(
        elevation: 3,
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
        color: Colors.blue[100],
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
                    height: 150,
                    fit: BoxFit.cover,
                  ),
                ),
              ),
            Text(
              article.source,
              style: TextStyle(
                fontStyle: FontStyle.italic,
                color: Colors.black38,
              ),
            ),
            ListTile(
              title: Text(
                article.title,
                style: TextStyle(
                  color: Colors.blue,
                  fontWeight: FontWeight.bold,
                ),
              ),
              subtitle: Text(
                article.description,
                style: TextStyle(
                  color: Colors.black87,
                ),
              ),
            ),
            SizedBox(height: 12,),
            Text(
              'Published at: ${formatDate(article.publishedAt)}',
              style: TextStyle(
                fontStyle: FontStyle.italic,
                color: Colors.black38,
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