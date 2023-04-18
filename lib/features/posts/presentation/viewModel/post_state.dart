import 'package:freezed_annotation/freezed_annotation.dart';

import '../../repository/entities/post.dart';

part 'post_state.freezed.dart';

enum PostStatus {
  initial,
  loading,
  success,
  failure,
}

@freezed
class PostState with _$PostState {
  const factory PostState({
    required PostStatus status,
    required List<Post> posts,
    @Default(1) int currentPage,
    @Default(false) bool? hasReachedMax,
  }) = _PostState;
}
