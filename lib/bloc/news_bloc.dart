import 'package:bloc/bloc.dart';
import '../model/article.dart';
import '../repository/news_repository.dart';
import 'news_event.dart';
import 'news_state.dart';

class NewsBloc extends Bloc<NewsEvent, NewsState> {
  final NewsRepository newsRepository;

  NewsBloc({required this.newsRepository}) : super(NewsInitial());

  @override
  Stream<NewsState> mapEventToState(NewsEvent event) async* {
    if (event is FetchNews) {
      yield* _mapFetchNewsToState();
    } else if (event is SearchNews) {
      yield* _mapSearchNewsToState(event);
    }
  }

  Stream<NewsState> _mapFetchNewsToState() async* {
    yield NewsLoading();
    try {
      final List<Article> articles = await newsRepository.getNews().timeout(Duration(seconds: 10));
      yield NewsLoaded(articles: articles);
    } catch (e) {
      yield NewsError(error: 'Failed to fetch news');
    }
  }

  Stream<NewsState> _mapSearchNewsToState(SearchNews event) async* {
    if (event.searchTerm.isEmpty) {
      yield NewsLoaded(articles: []);
    } else {
      try {
        final List<Article> articles = await newsRepository.searchNews(event.searchTerm);
        yield NewsLoaded(articles: articles);
      } catch (e) {
        yield NewsError(error: 'Failed to search news');
      }
    }
  }
}
