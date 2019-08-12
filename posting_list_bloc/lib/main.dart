import 'package:flutter/material.dart';
import 'package:posting_list_bloc/pages/home_page.dart';
import 'package:posting_list_bloc/services/posts_repository.dart';

void main() {
  PostsRepository _repository = PostsRepository();
  runApp(MyApp(
    repository: _repository,
  ));
}

class MyApp extends StatelessWidget {
  final PostsRepository repository;

  MyApp({this.repository});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: MyHomePage(
        repository: repository,
      ),
    );
  }
}
