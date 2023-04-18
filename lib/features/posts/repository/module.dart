import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:interview_task_app/features/posts/repository/post_repository.dart';

import '../data/module.dart';

final postRepositoryProvider = Provider<PostRepository>((ref) {
  return PostRepository(ref.read(postDataSourceProvider));
});
