import 'dart:async';
import 'dart:convert';
import 'package:flutter/foundation.dart';
import 'package:posting_list_bloc/http.dart';
import 'package:posting_list_bloc/models/post_model.dart';

List<PostModel> parsePosts(String responseBody) {
  final parsed = json.decode(responseBody).cast<Map<String, dynamic>>();

  return parsed.map<PostModel>((json) => PostModel.fromJson(json)).toList();
}

class PostsProvider {
  Future<List<PostModel>> fetchPosts() async {
    final response =
        await client.get('https://jsonplaceholder.typicode.com/posts');

    if (response.statusCode == 200) {
      return compute(parsePosts, response.body);
    } else {
      throw Exception('Failed to load posts');
    }
  }

  Future<PostModel> fetchPost(int id) async {
    final response =
        await client.get('https://jsonplaceholder.typicode.com/posts/$id');

    if (response.statusCode == 200) {
      return PostModel.fromJson(json.decode(response.body));;
    } else {
      throw Exception('Failed to load post');
    }
  }
}
