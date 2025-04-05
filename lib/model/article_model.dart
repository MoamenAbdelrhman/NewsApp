class Article {
  final String? title;
  final String? description;
  final String? url;
  final String? imageUrl;
  final String? publishedAt;
  final String? source;

  Article({
    required this.title,
    required this.description,
    required this.url,
    required this.imageUrl,
    required this.publishedAt,
    required this.source,
  });

  factory Article.fromJson(Map<String, dynamic> json) {
    return Article(
      title: json['title'] ?? "No Title",
      description: json['description'] ?? "No Description",
      url: json['url'] ?? "",
      imageUrl: json['urlToImage'] ?? "",
      publishedAt: json['publishedAt'] ?? "",
      source: json['source']['name'] ?? "Unknown Source",
    );
  }
}
