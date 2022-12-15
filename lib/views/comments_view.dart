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
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(5.0),
                  child: ExpansionTile(
                    textColor: Colors.white,
                    collapsedTextColor: Colors.white,
                    collapsedBackgroundColor: Colors.grey[700],
                    title: Column(  
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children:[
                        Padding(  
                          padding: const EdgeInsets.only(top: 5, bottom: 5),
                          child: Text(
                            comments!.data!.children![index].data!.author!, 
                            style: TextStyle(color: Colors.blue[300], fontWeight: FontWeight.bold),
                          )
                        ),
                        Text(comments.data!.children![index].data!.body!),
                      ]
                    ),
                    trailing: FittedBox(
                      child: Padding(  
                        padding: const EdgeInsets.only(right: 10),
                        child: Row(  
                          children: [
                            const Icon(Icons.arrow_upward, color: Colors.green,),
                              Text(
                                comments.data!.children![index].data!.ups! > 1000 
                                ? '${(comments.data!.children![index].data!.ups! / 1000).toStringAsFixed(1)}k'
                                : '${comments.data!.children![index].data!.ups}', 
                                style: const TextStyle(color: Colors.white, fontWeight: FontWeight.bold),
                              ),
                          ],
                        ),
                      ),
                    )//Text(comments.data!.children![index].data!.ups.toString()),
                    
                  )
                )
              );
            },
          ),
        ],
      ),
    );
  }
}