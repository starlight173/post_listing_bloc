import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:posting_list_bloc/bloc/post_listing_bloc.dart';
import 'package:posting_list_bloc/bloc/post_listing_events.dart';
import 'package:posting_list_bloc/bloc/post_listing_states.dart';
import 'package:posting_list_bloc/models/post_model.dart';
import 'package:posting_list_bloc/pages/home_page_detail.dart';
import 'package:posting_list_bloc/services/posts_repository.dart';

class MyHomePage extends StatefulWidget {
  final PostsRepository repository;

  MyHomePage({this.repository});

  @override
  MyHomePageState createState() => MyHomePageState();
}

class MyHomePageState extends State<MyHomePage> {
  PostListingBloc _bloc;

  @override
  void initState() {
    super.initState();
    _bloc = PostListingBloc(repository: widget.repository);
    _bloc.dispatch(FetchPostEvent());
  }

  @override
  void dispose() {
    // TODO: implement dispose
    _bloc.dispose();
    super.dispose();
  }

  @override
  void didUpdateWidget(MyHomePage oldWidget) {
    // TODO: implement didUpdateWidget
    super.didUpdateWidget(oldWidget);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("data"),
      ),
      body: BlocBuilder<PostListingBloc, PostListingState>(
        bloc: _bloc,
        builder: (context, state) {
          if (state is PostFetchedState) {
            return Center(
              child: _buildList(state.posts),
            );
          }
          if (state is PostErrorState) {
            return Center(child: Text("Error"));
          }
          if (state is PostEmptyState) {
            return Center(child: Text("Empty"));
          }
          return Center(child: CircularProgressIndicator());
        },
      ),
    );
  }

  Widget _buildList(List<PostModel> posts) {
    return ListView.separated(
      separatorBuilder: (context, index) {
        return Divider();
      },
      itemCount: posts.length,
      itemBuilder: (context, index) {
        return ListTile(
          title: Text(posts[index].title),
          subtitle: Text(posts[index].body),
          onTap: () {
            Navigator.push(
              context,
              MaterialPageRoute(
                  builder: (context) => MyHomePageDetail(
                        post: posts[index],
                        repository: widget.repository,
                      )),
            );
          },
        );
      },
    );
  }
}
