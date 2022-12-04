import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:meta/meta.dart';
import '../../../models/home_model.dart';
import '../../../services/home_service.dart';

part 'get_posts_event.dart';
part 'get_posts_state.dart';

class GetPostsBloc extends Bloc<GetPostsEvent, GetPostsState> {
  GetPostsBloc() : super(GetPostsInitial()) {
    final HomeService homeService = HomeService();
    on<GetPostsEvent>((event, emit) async {
      try{
        emit(GetPostsLoading());
        final mList = await homeService.getPosts(event.url);
        emit(GetPostsLoaded(mList));
      } on NetworkError {
        emit(const GetPostsError("Faild to fetch data. Check if your device is connected to the internet"));
      }
    });
  }
}
