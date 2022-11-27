part of 'get_posts_bloc.dart';

@immutable
abstract class GetPostsState extends Equatable{

  const GetPostsState();

  @override 
  List<Object> get props => [];
}

class GetPostsInitial extends GetPostsState {}

class GetPostsLoading extends GetPostsState {}

class GetPostsLoaded extends GetPostsState {
  final Posts? posts;
  const GetPostsLoaded(this.posts);
}

class GetPostsError extends GetPostsState {
  final String? message;
  const GetPostsError(this.message);
}