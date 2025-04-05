// explore_cubit.dart
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:first_app/services/news_service.dart';
import 'explore_state.dart';

class ExploreCubit extends Cubit<ExploreState> {
  final NewsService _newsService;

  ExploreCubit(this._newsService) : super(ExploreInitial());

  final List<String> categories = [
    'general',
    'business',
    'technology',
    'health',
    'science',
    'sports',
    'entertainment',
  ];

  int selectedCategoryIndex = 0;

  Future<void> fetchTopHeadlines() async {
    emit(ExploreLoading());
    try {
      final articles = await _newsService.fetchTopHeadlines(
        'us',
        category: categories[selectedCategoryIndex],
      );
      emit(ExploreLoaded(articles));
    } catch (e) {
      emit(ExploreError(e.toString()));
    }
  }

  void changeCategory(int index) {
    selectedCategoryIndex = index;
    fetchTopHeadlines();
  }
}