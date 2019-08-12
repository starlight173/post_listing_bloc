import 'package:flutter/foundation.dart';
import 'package:posting_list_bloc/models/post_model.dart';

// Bloc -> UI
abstract class PostDetailState {}

class PostFetchingState extends PostDetailState {}

class PostFetchedState extends PostDetailState {
  final PostModel post;

  PostFetchedState({@required this.post}) : assert(post != null);
}

class PostErrorState extends PostDetailState {}
