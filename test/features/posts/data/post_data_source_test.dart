import 'package:dio/dio.dart';
import 'package:interview_task_app/core/utils/dio_api.dart';
import 'package:interview_task_app/features/posts/data/post_data_source.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/annotations.dart';

import 'post_data_source_test.mocks.dart';

@GenerateMocks([Dio])
void main() {
  late MockDio mockDio;
  late PostDataSource postDataProvider;

  setUp(() {
    mockDio = MockDio();
    postDataProvider = PostDataSource(DioApi().dio);
  });

  test(
    'Should return json list of posts containing profile picture links',
    () async {
      await postDataProvider.getPosts(1);
    },
  );
}
