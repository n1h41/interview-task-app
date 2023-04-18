// ignore_for_file: prefer_const_constructors

import 'package:flutter_test/flutter_test.dart';
import 'package:interview_task_app/features/posts/data/models/post_model.dart';
import 'package:interview_task_app/features/posts/data/post_data_source.dart';
import 'package:interview_task_app/features/posts/repository/entities/post.dart';
import 'package:interview_task_app/features/posts/repository/post_repository.dart';
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';

import 'post_repository_test.mocks.dart';

@GenerateMocks([PostDataSource])
void main() {
  late MockPostDataSource mockPostDataSource;
  late PostRepository postRepository;
  late List<PostModel> postList;

  setUp(() {
    mockPostDataSource = MockPostDataSource();
    postRepository = PostRepository(mockPostDataSource);
    postList = [
      PostModel(
        id: 1,
        title: 'title',
        url: 'url',
        thumbnailUrl: 'thumbnailUrl',
      ),
      PostModel(
        id: 2,
        title: 'title',
        url: 'url',
        thumbnailUrl: 'thumbnailUrl',
      ),
    ];
  });

  test(
    'Should return json list of posts containing profile picture links',
    () async {
      when(mockPostDataSource.getPosts(any)).thenAnswer((realInvocation) async {
        return postList;
      });
      final result = await postRepository.getPosts(1);
      expect(result, isA<List<Post>>());
    },
  );
}
