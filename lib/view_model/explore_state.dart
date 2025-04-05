import 'package:first_app/model/article_model.dart';

abstract class ExploreState {}

class ExploreInitial extends ExploreState {}
class ExploreLoading extends ExploreState {}

class ExploreLoaded extends ExploreState {
  final List<Article> articles;
  ExploreLoaded(this.articles);
}

class ExploreError extends ExploreState {
  final String message;
  ExploreError(this.message);
}