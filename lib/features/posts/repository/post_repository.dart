import 'package:interview_task_app/features/posts/data/post_data_source.dart';

import 'entities/post.dart';

class PostRepository {
  final PostDataSource postDataProvider;

  PostRepository(this.postDataProvider);

  Future<List<Post>> getPosts(int pageNumber) async {
    return await postDataProvider.getPosts(pageNumber);
  }
}
