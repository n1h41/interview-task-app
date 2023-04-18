import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:interview_task_app/features/posts/presentation/viewModel/post_state.dart';
import 'package:interview_task_app/features/posts/presentation/viewModel/post_view_model.dart';

import '../../repository/module.dart';

final postViewModelProvider = StateNotifierProvider<PostViewModel, PostState>(
  (ref) => PostViewModel(
    ref.read(postRepositoryProvider),
  ),
);
