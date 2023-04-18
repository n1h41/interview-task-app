import 'package:interview_task_app/core/utils/dio_api.dart';
import 'package:interview_task_app/features/posts/data/post_data_source.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

final postDataSourceProvider = Provider<PostDataSource>((ref) {
  return PostDataSource(DioApi().dio);
});
