part of 'get_comments_bloc.dart';

abstract class GetCommentsState extends Equatable{
  const GetCommentsState();
  
  @override
  List<Object> get props => [];
}

class GetCommentsInitial extends GetCommentsState {}

class GetCommentsLoading extends GetCommentsState {}

class GetCommentsLoaded extends GetCommentsState{
  final Comments? comments;
  const GetCommentsLoaded(this.comments);
}

class GetCommentsError extends GetCommentsState{
  final String? message;
  const GetCommentsError(this.message);
}