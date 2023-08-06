class Article {
  final String title;
  final String description;
  final String url;
  final String urlToImage;
  final String content;
  final String publishedAt;
  final String source;

  Article({
    required this.title,
    required this.description,
    required this.url,
    required this.urlToImage,
    required this.content,
    required this.publishedAt,
    required this.source,
  });

  factory Article.fromJson(Map<String, dynamic> json) {
    return Article(
      title: json['title'] as String? ?? '', // Handle null with a default value
      description: json['description'] as String? ?? '', // Handle null with a default value
      url: json['url'] as String? ?? '', // Handle null with a default value
      urlToImage: json['urlToImage'] as String? ?? '', // Handle null with a default value
      content: json['content'] as String? ?? '', // Handle null with a default value
      publishedAt: json['publishedAt'] as String? ?? '', // Handle null with a default value
      source: json['source']['name'] as String? ?? '', // Handle null with a default value
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'title': title,
      'description': description,
      'url': url,
      'urlToImage': urlToImage,
      'content': content,
      'publishedAt': publishedAt,
      'source': source,
    };
  }
}
