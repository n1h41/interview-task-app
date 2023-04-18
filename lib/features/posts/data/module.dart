import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:interview_task_app/core/utils/dio_api.dart';
import 'package:interview_task_app/features/posts/data/post_data_source.dart';

final postDataSourceProvider = Provider<PostDataSource>((ref) {
  return PostDataSource(DioApi().dio);
});
