import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:interview_task_app/features/posts/presentation/viewModel/post_state.dart';
import 'package:interview_task_app/features/posts/repository/post_repository.dart';

import '../../repository/entities/post.dart';

class PostViewModel extends StateNotifier<PostState> {
  PostViewModel(PostRepository repository)
      : _repository = repository,
        super(
          const PostState(
            status: PostStatus.initial,
            posts: [],
          ),
        ) {
    fetchPosts();
  }

  final PostRepository _repository;

  set currentPage(int value) {
    state = state.copyWith(currentPage: value);
  }

  Post getPostById(int id) => state.posts.firstWhere((post) => post.id == id);

  Future<void> fetchPosts() async {
    state = state.copyWith(status: PostStatus.loading);
    try {
      final List<Post> posts = await _repository.getPosts(state.currentPage);
      state = state.copyWith(
        status: PostStatus.success,
        posts: posts,
      );
    } catch (e) {
      state = state.copyWith(status: PostStatus.failure);
    }
  }
}
