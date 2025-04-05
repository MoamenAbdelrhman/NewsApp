import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../view_model/explore_cubit.dart';
import '../view_model/explore_state.dart';
import 'article_detail_screen.dart';
import '../services/news_service.dart';
import '../model/article_model.dart';
import '../widgets/article_card.dart';
import 'article_search_delegate.dart';

class ExploreScreen extends StatelessWidget {
  const ExploreScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => ExploreCubit(NewsService())..fetchTopHeadlines(),
      child: Scaffold(
        appBar: AppBar(
          title: const Text('Explore'),
          actions: [
            IconButton(
              icon: const Icon(Icons.search),
              onPressed: () {
                final cubit = context.read<ExploreCubit>();
                final articles = (cubit.state is ExploreLoaded)
                    ? (cubit.state as ExploreLoaded).articles
                    : <Article>[];
                showSearch(
                  context: context,
                  delegate: ArticleSearchDelegate(articles),
                );
              },
            ),
          ],
        ),
        body: _buildBody(),
      ),
    );
  }

  Widget _buildBody() {
    return BlocBuilder<ExploreCubit, ExploreState>(
      builder: (context, state) {
        if (state is ExploreLoading) {
          return const Center(child: CircularProgressIndicator());
        }
        if (state is ExploreError) {
          return Center(child: Text(state.message));
        }
        if (state is ExploreLoaded) {
          final articles = state.articles;
          if (articles.isEmpty) {
            return const Center(child: Text('No articles found'));
          }
          final cubit = context.read<ExploreCubit>();
          return CustomScrollView(
            slivers: [
              SliverToBoxAdapter(
                child: Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
                  child: SizedBox(
                    height: 40,
                    child: ListView.builder(
                      scrollDirection: Axis.horizontal,
                      itemCount: cubit.categories.length,
                      itemBuilder: (context, index) {
                        return Padding(
                          padding: const EdgeInsets.only(right: 8),
                          child: ChoiceChip(
                            label: Text(cubit.categories[index]),
                            selected: cubit.selectedCategoryIndex == index,
                            onSelected: (selected) {
                              if (selected) {
                                cubit.changeCategory(index);
                              }
                            },
                            selectedColor: Colors.blue.withOpacity(0.2),
                            backgroundColor: Colors.grey[200],
                            labelStyle: TextStyle(
                              color: cubit.selectedCategoryIndex == index
                                  ? Colors.blue
                                  : Colors.black,
                            ),
                          ),
                        );
                      },
                    ),
                  ),
                ),
              ),
              SliverList(
                delegate: SliverChildBuilderDelegate(
                      (context, index) {
                    final article = articles[index];
                    if (index == 0) {
                      return GestureDetector(
                        onTap: () {
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
                        child: Padding(
                          padding: const EdgeInsets.all(16.0),
                          child: Card(
                            elevation: 4,
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(12),
                            ),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                ClipRRect(
                                  borderRadius: const BorderRadius.vertical(
                                      top: Radius.circular(12)),
                                  child: article.imageUrl != null &&
                                      article.imageUrl!.isNotEmpty
                                      ? Image.network(
                                    article.imageUrl!,
                                    height: 250,
                                    width: double.infinity,
                                    fit: BoxFit.cover,
                                    errorBuilder:
                                        (context, error, stackTrace) {
                                      return Container(
                                        height: 250,
                                        color: Colors.grey[300],
                                        child: const Icon(Icons.error,
                                            color: Colors.red),
                                      );
                                    },
                                  )
                                      : Container(
                                    height: 250,
                                    color: Colors.grey[300],
                                    child: const Icon(Icons.image,
                                        color: Colors.grey),
                                  ),
                                ),
                                Padding(
                                  padding: const EdgeInsets.all(16.0),
                                  child: Column(
                                    crossAxisAlignment:
                                    CrossAxisAlignment.start,
                                    children: [
                                      Text(
                                        article.title ?? 'No Title',
                                        style: const TextStyle(
                                          fontSize: 20,
                                          fontWeight: FontWeight.bold,
                                        ),
                                        maxLines: 2,
                                        overflow: TextOverflow.ellipsis,
                                      ),
                                      const SizedBox(height: 8),
                                      Text(
                                        '${article.source ?? 'Unknown Source'} • ${article.publishedAt ?? ''}',
                                        style: Theme.of(context)
                                            .textTheme
                                            .headlineMedium
                                            ?.copyWith(
                                          fontSize: 16,
                                          color: Colors.grey[600],
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),
                      );
                    } else {
                      return ArticleCard(
                        title: article.title ?? 'No Title',
                        author: article.source ?? 'Unknown Source',
                        date: article.publishedAt ?? '',
                        imageUrl: article.imageUrl ?? '',
                        onTap: () {
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
                    }
                  },
                  childCount: articles.length,
                ),
              ),
            ],
          );
        }
        return const SizedBox.shrink();
      },
    );
  }
}