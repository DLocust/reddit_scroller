part of 'get_comments_bloc.dart';

abstract class GetCommentsEvent extends Equatable {
  final String url;
  const GetCommentsEvent(this.url);

  @override
  List<Object> get props => [];
}

class GetCommentsList extends GetCommentsEvent {
  const GetCommentsList(super.url);
}