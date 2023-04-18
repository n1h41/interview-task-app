// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:equatable/equatable.dart';

class Post extends Equatable {
  final int? id;
  final int? albumId;
  final String? title;
  final String? url;
  final String? thumbnailUrl;

  const Post({
    this.id,
    this.albumId,
    this.title,
    this.url,
    this.thumbnailUrl,
  });

  @override
  List<Object?> get props {
    return [
      id,
      albumId,
      title,
      url,
      thumbnailUrl,
    ];
  }
}
