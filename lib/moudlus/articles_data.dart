class ArticleModel {
  final String status;
  final List<Article> articles;

  ArticleModel({required this.status, required this.articles});

  factory ArticleModel.fromJson(Map<String, dynamic> json) {
    return ArticleModel(
      status: json['status'],
      articles: (json['articles'] as List)
          .map((e) => Article.fromJson(e))
          .toList(),
    );
  }
}

class Article {
  final String? author;
  final String? title;
  final String? description;
  final String? url;
  final String? urlToImage;
  final String? publishedAt;
  final String? sourceName;

  Article({
    this.author,
    this.title,
    this.description,
    this.url,
    this.urlToImage,
    this.publishedAt,
    this.sourceName,
  });

  factory Article.fromJson(Map<String, dynamic> json) {
    return Article(
      author: json['author'],
      title: json['title'],
      description: json['description'],
      url: json['url'],
      urlToImage: json['urlToImage'],
      publishedAt: json['publishedAt'],
      sourceName: json['source']?['name'],
    );
  }
}
