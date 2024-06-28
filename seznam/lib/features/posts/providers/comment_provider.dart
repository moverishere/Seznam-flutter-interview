import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:hive/hive.dart';
import 'package:seznam/core/constants/constants.dart';
import 'package:seznam/features/posts/models/comment_model.dart';
import 'package:seznam/features/posts/providers/post_provider.dart';

class CommentNotifier extends StateNotifier<List<Comment>> {
  CommentNotifier(this._postId, this._ref) : super([]) {
    _loadComments();
  }

  final int _postId;
  final Ref _ref;

  Future<void> _loadComments() async {
    // Load comments from server
    final serverComments = await _ref.read(postCommentsProvider(_postId).future);

    // Load comments from local storage
    final localComments = Hive.box<Comment>(Constants.hiveCommentsBox)
        .values
        .where((c) => c.postId == _postId)
        .toList();

    // Combine server and local comments
    state = [...serverComments, ...localComments];
  }

  void addComment(Comment comment) {
    Hive.box<Comment>(Constants.hiveCommentsBox).add(comment);
    state = [...state, comment];
  }
}

final commentNotifierProvider = StateNotifierProvider.family<CommentNotifier, List<Comment>, int>((ref, postId) {
  return CommentNotifier(postId, ref);
});
