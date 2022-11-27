import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'controller/bloc/get_posts_bloc.dart';
import 'home_model.dart';

class HomeView extends StatefulWidget{
  final String subreddit;
  const HomeView(this.subreddit, {super.key});

  @override  
  HomeViewState createState()=> HomeViewState();
}

class HomeViewState extends State<HomeView>{
  final GetPostsBloc postsBloc = GetPostsBloc();

  @override  
  void initState(){
    postsBloc.add(GetPostList('https://api.reddit.com/r/${widget.subreddit}'));
    super.initState();
  }

  @override  
  Widget build(BuildContext context){
    return Scaffold( 
      backgroundColor: Colors.grey[800], 
      appBar: AppBar(  
        title: const Text('Reddit Scroller'),
        backgroundColor: Colors.grey[900],
      ),
      body: buildPostsList(),
    );
  }

  Widget buildPostsList(){
    return Container(
      margin: const EdgeInsets.all(10),
      child: BlocProvider(  
        create: (_)=> postsBloc,
        child: BlocListener<GetPostsBloc,GetPostsState>(  
          listener: ((context, state) {
            if(state is GetPostsError){
              ScaffoldMessenger.of(context).showSnackBar(
                SnackBar(
                  content: Text(state.message!)
                )
              );
            }
          }),
          child: BlocBuilder<GetPostsBloc, GetPostsState>(  
            builder: (context, state){
              if(state is GetPostsInitial){
                return loadingWidget();
              }
              else if(state is GetPostsLoading){
                return loadingWidget();
              }
              else if(state is GetPostsLoaded){
                return state.posts != null ? buildPosts(context, state.posts) : const Center(child: CircularProgressIndicator(),);
              }
              else if(state is GetPostsError){
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

  Widget buildPosts(BuildContext context, Posts? posts){
    return SingleChildScrollView( 
        child: Column(  
          children:[
            ListView.builder(
              physics: const NeverScrollableScrollPhysics(),
              shrinkWrap: true,
              itemCount: posts!.data!.children!.length,
              itemBuilder: ((context, index) {
                return Padding(
                  padding: const EdgeInsets.only(bottom: 7.5),
                  child: ListTile( 
                    shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(5)),
                    tileColor: Colors.grey[700],
                    minVerticalPadding: 10.0,
                    contentPadding: const EdgeInsets.all(5.0),
                    leading: CircleAvatar(
                      backgroundImage: posts.data!.children![index].data!.thumbnail!.contains('https://')
                        ? NetworkImage(posts.data!.children![index].data!.thumbnail!)
                        : null,
                      backgroundColor: Colors.transparent,
                    ),
                    title: Text("${posts.data!.children![index].data?.title}", style: const TextStyle(color: Colors.white, fontWeight: FontWeight.bold),),
                    subtitle: FittedBox(
                      alignment: Alignment.centerLeft,
                      fit: BoxFit.scaleDown,
                      child: Text(
                      "Posted By: ${posts.data!.children![index].data?.author}", 
                      maxLines: 1, 
                      style: const TextStyle(color: Colors.white,)
                    )),  
                    trailing: FittedBox(  
                      child: Padding(  
                        padding: const EdgeInsets.only(right: 10),
                        child: Row(  
                          children: [
                            const Icon(Icons.arrow_upward, color: Colors.green,),
                            Text('${posts.data!.children![index].data!.ups}', style: const TextStyle(color: Colors.white),)
                          ],
                        )
                      ),
                    )
                  )
                );
              })
            ),
            Row(  
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                posts.data?.before != null 
                  ? TextButton(  
                      onPressed:(() {
                        String? previous = 'https://api.reddit.com/r/${widget.subreddit}/.json?count=25&before=${posts.data?.before}';
                        BlocProvider.of<GetPostsBloc>(context).add(GetPostList(previous));
                      }),  
                      child: const Text('Back', style: TextStyle(color: Colors.red),),
                    )
                  : Container(),
                TextButton(  
                  onPressed:(() {
                    String? next = 'https://api.reddit.com/r/${widget.subreddit}/.json?count=25&after=${posts.data?.after}';
                    BlocProvider.of<GetPostsBloc>(context).add(GetPostList(next));
                  }),  
                  child: const Text('Next'),
                )
              ],
            )
          ]
        )
    );
  }

  Widget loadingWidget(){
    return const Center(
      child: CircularProgressIndicator(),
    );
  }
}

