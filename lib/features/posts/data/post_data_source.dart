import 'package:interview_task_app/core/data/data_source.dart';

import 'models/post_model.dart';

class PostDataSource extends DataSource {
  PostDataSource(super.api);

  Future<List<PostModel>> getPosts(int pageNumber) async {
    try {
      final response = await api.get('/photos?_page=$pageNumber&_limit=10');
      return response.data
          .map<PostModel>((e) => PostModel.fromJson(e))
          .toList();
    } catch (e) {
      rethrow;
    }
  }
}
