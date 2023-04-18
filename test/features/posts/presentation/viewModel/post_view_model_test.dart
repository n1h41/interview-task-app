// ignore_for_file: prefer_const_constructors

import 'package:flutter_test/flutter_test.dart';
import 'package:interview_task_app/features/posts/presentation/viewModel/post_state.dart';
import 'package:interview_task_app/features/posts/presentation/viewModel/post_view_model.dart';
import 'package:interview_task_app/features/posts/repository/entities/post.dart';
import 'package:interview_task_app/features/posts/repository/post_repository.dart';
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';

import 'post_view_model_test.mocks.dart';

@GenerateMocks([PostRepository])
void main() {
  late MockPostRepository mockPostRepository;
  late PostViewModel postViewModel;
  late List<Post> postList;

  setUp(() {
    mockPostRepository = MockPostRepository();
    postViewModel = PostViewModel(mockPostRepository);
    postList = [
      Post(
        id: 1,
        title: 'title',
        url: 'url',
        thumbnailUrl: 'thumbnailUrl',
      ),
      Post(
        id: 2,
        title: 'title',
        url: 'url',
        thumbnailUrl: 'thumbnailUrl',
      ),
    ];
  });

  test(
    'When the fetchPost function is called with an argument, post state will have a list of posts',
    () async {
      // arrange
      when(mockPostRepository.getPosts(any)).thenAnswer((_) async => postList);
      // act
      await postViewModel.fetchPosts();
      // assert
      expect(
        // ignore: invalid_use_of_protected_member
        postViewModel.state,
        equals(
          PostState(
            status: PostStatus.success,
            posts: postList,
          ),
        ),
      );
    },
  );
}
