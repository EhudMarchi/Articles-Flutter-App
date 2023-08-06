import 'package:equatable/equatable.dart';

abstract class NewsEvent extends Equatable {
  const NewsEvent();

  @override
  List<Object> get props => [];
}

class FetchNews extends NewsEvent {}

class SearchNews extends NewsEvent {
  final String searchTerm;

  SearchNews(this.searchTerm);

  @override
  List<Object> get props => [searchTerm];
}
