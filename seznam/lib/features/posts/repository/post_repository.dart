import 'dart:developer';
import 'package:dio/dio.dart';
import 'package:seznam/core/constants/constants.dart';
import '../models/comment_model.dart';
import '../models/post_model.dart';

class PostRepository {
  final Dio dio;

  PostRepository(this.dio);

  Future<List<Post>> getAllPosts() async {
    try {
      final response = await dio.get('${Constants.baseUrl}/posts');
      final rawPosts = response.data as List;
      return rawPosts.map((e) => Post.fromMap(e)).toList();
    } catch (e) {
      log(e.toString());
      rethrow;
    }
  }

  Future<Post> getPostById(int id) async {
    try {
      final response = await dio.get('${Constants.baseUrl}/posts/$id');
      final rawPost = response.data;
      return Post.fromMap(rawPost);
    } catch (e) {
      log(e.toString());
      rethrow;
    }
  }

  Future<List<Post>> getAllPostsByUser(int userId) async {
    try {
      final response = await dio.get('${Constants.baseUrl}/users/$userId/posts');
      final rawPosts = response.data as List;
      return rawPosts.map((e) => Post.fromMap(e)).toList();
    } catch (e) {
      log(e.toString());
      rethrow;
    }
  }

  Future<List<Comment>> getAllCommentsOfPost(int postId) async {
    try {
      final response = await dio.get('${Constants.baseUrl}/posts/$postId/comments');
      final rawComments = response.data as List;
      return rawComments.map((e) => Comment.fromMap(e)).toList();
    } catch (e) {
      log(e.toString());
      rethrow;
    }
  }
}
