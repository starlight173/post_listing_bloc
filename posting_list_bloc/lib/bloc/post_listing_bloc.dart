import 'package:bloc/bloc.dart';
import 'package:posting_list_bloc/bloc/post_listing_events.dart';
import 'package:posting_list_bloc/bloc/post_listing_states.dart';
import 'package:posting_list_bloc/models/post_model.dart';
import 'package:posting_list_bloc/services/posts_repository.dart';

class PostListingBloc extends Bloc<PostListingEvent, PostListingState> {
  final PostsRepository repository;

  PostListingBloc({this.repository}) : assert(repository != null);

  @override
  PostListingState get initialState => PostEmptyState();

  @override
  Stream<PostListingState> mapEventToState(PostListingEvent event) async* {
    print("mapEventToState");
    yield PostFetchingState();
    try {
      List<PostModel> posts;
      if (event is FetchPostEvent) {
        posts = await repository.fetchPosts();
      }
      if (posts.length == 0) {
        yield PostEmptyState();
      } else {
        yield PostFetchedState(posts: posts);
      }
    } catch (error) {
      yield PostErrorState();
    }
  }
}
