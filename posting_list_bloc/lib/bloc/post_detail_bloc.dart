import 'package:bloc/bloc.dart';
import 'package:posting_list_bloc/bloc/post_detail_event.dart';
import 'package:posting_list_bloc/bloc/post_detail_state.dart';
import 'package:posting_list_bloc/services/posts_repository.dart';

class PostDetailBloc extends Bloc<FetchPostEvent, PostDetailState> {
  final PostsRepository repository;

  PostDetailBloc({this.repository}) : assert(repository != null);

  @override
  PostDetailState get initialState => PostFetchingState();

  @override
  Stream<PostDetailState> mapEventToState(FetchPostEvent event) async* {
    print("mapEventToState");
    yield PostFetchingState();
    try {
      yield PostFetchedState(post: await repository.fetchPost(event.id));
    } catch (error) {
      print(error);
      yield PostErrorState();
    }
  }
}
