import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:reddit_scroller/models/comments_model.dart';
import 'package:reddit_scroller/services/comments_service.dart';

part 'get_comments_event.dart';
part 'get_comments_state.dart';

class GetCommentsBloc extends Bloc<GetCommentsEvent, GetCommentsState> {
  GetCommentsBloc() : super(GetCommentsInitial()) {
    final CommentsService commentsService = CommentsService();
    on<GetCommentsEvent>((event, emit) async {
      try{
        emit(GetCommentsLoading());
        final mList = await commentsService.getComments(event.url);
        emit(GetCommentsLoaded(mList));
      } on NetworkError {
        emit(const GetCommentsError("Failed to fetch data. Check if your device is connect to the internet"));
      }
    });
  }
}