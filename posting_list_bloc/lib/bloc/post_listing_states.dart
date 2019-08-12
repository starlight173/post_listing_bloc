import 'package:flutter/foundation.dart';
import 'package:posting_list_bloc/models/post_model.dart';

// Bloc -> UI
abstract class PostListingState {}

class PostUninitializedState extends PostListingState {}

class PostFetchingState extends PostListingState {}

class PostFetchedState extends PostListingState {
  final List<PostModel> posts;

  PostFetchedState({@required this.posts}) : assert(posts != null);
}

class PostErrorState extends PostListingState {}

class PostEmptyState extends PostListingState {}
