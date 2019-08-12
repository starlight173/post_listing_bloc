import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:posting_list_bloc/bloc/post_detail_bloc.dart';
import 'package:posting_list_bloc/bloc/post_detail_event.dart';
import 'package:posting_list_bloc/bloc/post_detail_state.dart';
import 'package:posting_list_bloc/models/post_model.dart';
import 'package:posting_list_bloc/services/posts_repository.dart';

class MyHomePageDetail extends StatefulWidget {
  final PostsRepository repository;
  final PostModel post;

  MyHomePageDetail({this.post, this.repository});

  @override
  MyHomePageDetailState createState() => MyHomePageDetailState();
}

class MyHomePageDetailState extends State<MyHomePageDetail> {
  PostDetailBloc _bloc;

  @override
  void initState() {
    _bloc = PostDetailBloc(repository: widget.repository);
    _bloc.dispatch(FetchPostEvent(id: widget.post.id));
    super.initState();
  }

  @override
  void dispose() {
    _bloc.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.post.title),
      ),
      body: BlocBuilder<PostDetailBloc, PostDetailState>(
        bloc: _bloc,
        builder: (context, state) {
          if (state is PostFetchedState) {
            return Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                Text('Id: ${state.post.id}'),
                Text('UserId: ${state.post.userId}'),
                Text('Title: ${state.post.title}'),
                Text('${state.post.body}'),
              ],
            );
          }
          if (state is PostErrorState) {
            return Center(child: Text("Error"));
          }
          return Center(child: CircularProgressIndicator());
        },
      ),
    );
  }
}
