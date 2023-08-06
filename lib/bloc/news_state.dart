import 'package:equatable/equatable.dart';
import '../model/article.dart';

abstract class NewsState extends Equatable {
  const NewsState();

  @override
  List<Object> get props => [];
}

class NewsInitial extends NewsState {}

class NewsLoading extends NewsState {}

class NewsLoaded extends NewsState {
  final List<Article> articles;

  NewsLoaded({required this.articles});

  @override
  List<Object> get props => [articles];
}

class NewsError extends NewsState {
  final String error;

  NewsError({required this.error});

  @override
  List<Object> get props => [error];
}
