import 'package:articles/repository/news_repository.dart';
import 'package:articles/screens/news_list_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'bloc/news_bloc.dart';
import 'bloc/news_event.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  final NewsRepository newsRepository = NewsRepository(apiKey: 'c25171fe43774bbe8e16f01f6e0c73ef');

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter News App',
      theme: ThemeData(primarySwatch: Colors.blue),
      home: BlocProvider(
        create: (context) => NewsBloc(
            newsRepository: newsRepository)
          ..add(FetchNews()),
        child: NewsListScreen(),
      ),
    );
  }
}
