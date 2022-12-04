part of 'get_posts_bloc.dart';

@immutable
abstract class GetPostsEvent extends Equatable{
  final String url;
  const GetPostsEvent(this.url);

  @override  
  List<Object> get props => [];
}

class GetPostList extends GetPostsEvent {
  const GetPostList(super.url);
}