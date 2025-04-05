import 'package:flutter/material.dart';

class ArticleDetailScreen extends StatelessWidget {
  final String title;
  final String author;
  final String date;
  final String content;
  final String imageUrl;

  const ArticleDetailScreen({
    super.key,
    required this.title,
    required this.author,
    required this.date,
    required this.content,
    required this.imageUrl,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Article Details'),
      ),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            _buildArticleImage(),
            Padding(
              padding: const EdgeInsets.all(16.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  _buildArticleTitle(),
                  const SizedBox(height: 8),
                  _buildAuthorInfo(),
                  const SizedBox(height: 16),
                  _buildArticleContent(),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildArticleImage() {
    return Container(
      height: 200,
      decoration: BoxDecoration(
        image: DecorationImage(
          image: imageUrl.isNotEmpty
              ? NetworkImage(imageUrl) as ImageProvider
              : const AssetImage('assets/placeholder.jpg'),
          fit: BoxFit.cover,
        ),
      ),
    );
  }

  Widget _buildArticleTitle() {
    return Text(
      title,
      style: const TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
    );
  }

  Widget _buildAuthorInfo() {
    return Text(
      '$author • ${_formatDate(date)}',
      style: const TextStyle(fontSize: 16, color: Colors.grey),
    );
  }

  Widget _buildArticleContent() {
    return Text(
      content,
      style: const TextStyle(fontSize: 16),
    );
  }

  String _formatDate(String date) {
    if (date.isEmpty) return '';
    try {
      final dateTime = DateTime.parse(date);
      return '${dateTime.day}/${dateTime.month}/${dateTime.year}';
    } catch (e) {
      return date;
    }
  }
}