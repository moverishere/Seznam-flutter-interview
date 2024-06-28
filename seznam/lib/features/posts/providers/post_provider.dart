import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:seznam/features/posts/models/comment_model.dart';
import 'package:seznam/features/posts/models/post_model.dart';
import 'package:seznam/features/posts/repository/post_repository.dart';
import 'package:seznam/network/dio.dart';

final postRepositoryProvider = Provider.autoDispose<PostRepository>((ref) {
  final dioClient = ref.read(dioClientProvider);
  return PostRepository(dioClient.dio);
});

final postsProvider = FutureProvider.autoDispose<List<Post>>((ref) {
  final postRepository = ref.read(postRepositoryProvider);
  return postRepository.getAllPosts();
});

final postProvider = FutureProvider.autoDispose.family<Post, int>((ref, id) {
  final postRepository = ref.read(postRepositoryProvider);
  return postRepository.getPostById(id);
});

final userPostsProvider = FutureProvider.autoDispose.family<List<Post>, int>((ref, userId) {
  final postRepository = ref.read(postRepositoryProvider);
  return postRepository.getAllPostsByUser(userId);
});

final postCommentsProvider = FutureProvider.autoDispose.family<List<Comment>, int>((ref, postId) {
  final postRepository = ref.read(postRepositoryProvider);
  return postRepository.getAllCommentsOfPost(postId);
});
