import 'package:posting_list_bloc/models/post_model.dart';
import 'package:posting_list_bloc/services/posts_api_provider.dart';

class PostsRepository {
    PostsProvider _postsProvider = PostsProvider();
    Future<List<PostModel>> fetchPosts() => _postsProvider.fetchPosts();
    Future<PostModel> fetchPost(int id) => _postsProvider.fetchPost(id);
}