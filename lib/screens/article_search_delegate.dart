import 'package:flutter/material.dart';
import 'package:first_app/model/article_model.dart';
import 'article_detail_screen.dart';
import '../widgets/article_card.dart';

class ArticleSearchDelegate extends SearchDelegate {
  final List<Article> articles;

  ArticleSearchDelegate(this.articles);

  @override
  List<Widget>? buildActions(BuildContext context) {
    return [
      IconButton(
        icon: const Icon(Icons.clear),
        onPressed: () {
          query = '';
        },
      ),
    ];
  }

  @override
  Widget? buildLeading(BuildContext context) {
    return IconButton(
      icon: const Icon(Icons.arrow_back),
      onPressed: () {
        close(context, null);
      },
    );
  }

  @override
  Widget buildResults(BuildContext context) {
    return _buildSearchResults();
  }

  @override
  Widget buildSuggestions(BuildContext context) {
    return _buildSearchResults();
  }

  Widget _buildSearchResults() {
    final results = articles.where((article) {
      return (article.title?.toLowerCase().contains(query.toLowerCase()) ?? false) ||
          (article.source?.toLowerCase().contains(query.toLowerCase()) ?? false) ||
          (article.description?.toLowerCase().contains(query.toLowerCase()) ?? false);
    }).toList();

    if (results.isEmpty) {
      return const Center(child: Text('No articles found.'));
    }

    return ListView.builder(
      itemCount: results.length,
      itemBuilder: (context, index) {
        final article = results[index];
        return ArticleCard(
          title: article.title ?? 'No Title',
          author: article.source ?? 'Unknown Source',
          date: article.publishedAt ?? '',
          imageUrl: article.imageUrl ?? '',
          onTap: () {
            close(context, null);
            Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) => ArticleDetailScreen(
                  title: article.title ?? 'No Title',
                  author: article.source ?? 'Unknown Source',
                  date: article.publishedAt ?? '',
                  content: article.description ?? 'No Content',
                  imageUrl: article.imageUrl ?? '',
                ),
              ),
            );
          },
        );
      },
    );
  }
}