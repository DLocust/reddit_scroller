import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../blocs/comments/get_comments_bloc.dart';
import '../models/comments_model.dart';

class CommentsView extends StatefulWidget{
  final String url;
  const CommentsView(this.url, {super.key});

  @override 
  CommentsViewState createState()=> CommentsViewState();
}

class CommentsViewState extends State<CommentsView>{
  final GetCommentsBloc commentsBloc = GetCommentsBloc();

  @override  
  void initState(){
    commentsBloc.add(GetCommentsList(widget.url));
    super.initState();
  }

  @override  
  Widget build(BuildContext context){
    return Scaffold(  
      backgroundColor: Colors.grey[800], 
      appBar: AppBar(  
        title: const Text('Reddit Scroller (Top 10 Comments)'),
        backgroundColor: Colors.grey[900],
      ),
      body: buildCommentsList(),
    );
  }

  Widget buildCommentsList(){
    return Container(
      margin: const EdgeInsets.all(10),
      child: BlocProvider(  
        create: (_)=> commentsBloc,
        child: BlocListener<GetCommentsBloc,GetCommentsState>(  
          listener: ((context, state) {
            if(state is GetCommentsError){
              ScaffoldMessenger.of(context).showSnackBar(
                SnackBar(
                  content: Text(state.message!)
                )
              );
            }
          }),
          child: BlocBuilder<GetCommentsBloc, GetCommentsState>(  
            builder: (context, state){
              if(state is GetCommentsInitial){
                return const Center(child: CircularProgressIndicator());
              }
              else if(state is GetCommentsLoading){
                return const Center(child: CircularProgressIndicator());
              }
              else if(state is GetCommentsLoaded){
                return state.comments != null ? buildComments(context, state.comments) : const Center(child: CircularProgressIndicator(),);
              }
              else if(state is GetCommentsError){
                return Container();
              }
              else{
                return Container();
              }
            },
          )
        )
      ),
    );
  }

  Widget buildComments(BuildContext context, Comments? comments){
    return SingleChildScrollView(
      child: Column(  
        children: [
          ListView.builder(
            shrinkWrap: true,
            itemCount: 10,
            itemBuilder: (context, index) {
              return Padding(  
                padding: const EdgeInsets.only(bottom: 7.5),
                child: ListTile(
                  textColor: Colors.white,
                  tileColor: Colors.grey[700],
                  title: Text(comments!.data!.children![index].data!.body!),
                  trailing: Text(comments.data!.children![index].data!.ups.toString()),
                )
              );
            },
          ),
        ],
      ),
    );
  }
}