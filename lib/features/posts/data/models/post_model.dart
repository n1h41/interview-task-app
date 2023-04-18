import 'package:json_annotation/json_annotation.dart';

import '../../repository/entities/post.dart';

part 'post_model.g.dart';

@JsonSerializable()
class PostModel extends Post {
  const PostModel({
    int? id,
    int? albumId,
    String? title,
    String? url,
    String? thumbnailUrl,
  }) : super(
          id: id,
          albumId: albumId,
          title: title,
          url: url,
          thumbnailUrl: thumbnailUrl,
        );

  factory PostModel.fromJson(Map<String, dynamic> json) =>
      _$PostModelFromJson(json);

  Map<String, dynamic> toJson() => _$PostModelToJson(this);
}
