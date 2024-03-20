part of 'blog_bloc.dart';

@immutable
sealed class BlogEvent {}

final class onBlogUpload extends BlogEvent {
  final String posterId;
  final String title;
  final String content;
  final File image;
  final List<String> topics;

  onBlogUpload({
    required this.posterId,
    required this.title,
    required this.content,
    required this.image,
    required this.topics,
  });
}

final class onGetAllBlogs extends BlogEvent {}
