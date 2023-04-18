import 'package:interview_task_app/core/utils/dio_api.dart';
import 'package:interview_task_app/features/posts/data/post_data_source.dart';
import 'package:flutter_test/flutter_test.dart';


void main() {
  late PostDataSource postDataProvider;

  setUp(() {
    postDataProvider = PostDataSource(DioApi().dio);
  });

  test(
    'Should return json list of posts containing profile picture links',
    () async {
      await postDataProvider.getPosts(1);
    },
  );
}
