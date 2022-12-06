import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:reddit_scroller/blocs/home/get_posts_bloc.dart';
import 'package:reddit_scroller/views/comments_view.dart';
import '../models/home_model.dart';

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
            Padding(
              padding: const EdgeInsets.only(bottom: 7.5),
              child: ClipRRect(
                borderRadius: const BorderRadius.all(Radius.circular(5)),
                child: ExpansionTile(
                  trailing: const Padding( 
                    padding: EdgeInsets.only(right: 20), 
                    child: Icon(Icons.expand_more),
                  ),
                  collapsedIconColor: Colors.white,
                  tilePadding: const EdgeInsets.only(top: 10, bottom: 10, left: 5),
                  leading: const CircleAvatar(backgroundImage: AssetImage('assets/icons/launcher_icon.png'),backgroundColor: Colors.transparent,),
                  collapsedBackgroundColor: Colors.grey[700],
                  backgroundColor: Colors.grey[600],
                  title: Text('View Additonal Subreddits', style: TextStyle(color: Colors.blue[200], fontWeight: FontWeight.bold),),
                  subtitle: const Text('Tap Here To See Available Options', style: TextStyle(color: Colors.white),),
                  children: [
                    ListTile(  
                      tileColor: Colors.transparent,
                      title: const Text('Build A PC Sales', style: TextStyle(color: Colors.white),),
                      subtitle: const Text('A community for links to products that are on sale at various websites. Monitors, cables, processors, video cards, fans, cooling, cases, accessories, anything for a PC build.', style: TextStyle(color: Colors.white),),
                      leading: const CircleAvatar(  
                        backgroundImage: NetworkImage('https://styles.redditmedia.com/t5_2s3dh/styles/communityIcon_bf4ya2rtdaz01.png?width=256&s=76feb45fa3beb2c72b1ce635a0cd311dfb5d1cd3'),
                        backgroundColor: Colors.transparent,
                      ),
                      onTap:()=>Navigator.of(context).pushReplacement(newSubredditRoute(const HomeView('buildapcsales'))),
                    ),
                    ListTile(  
                      tileColor: Colors.transparent,
                      title: const Text('Battlestations', style: TextStyle(color: Colors.white),),
                      subtitle: const Text('A subreddit for reddit users\' battlestation pictures.', style: TextStyle(color: Colors.white),),
                      leading: const CircleAvatar(  
                        backgroundImage: NetworkImage('https://styles.redditmedia.com/t5_2rdbn/styles/communityIcon_cwc65gri69h01.png?width=256&s=81d53ba008cb96e8d57dadf6b130d991411157ad'),
                        backgroundColor: Colors.transparent,
                      ),
                      onTap:()=>Navigator.of(context).pushReplacement(newSubredditRoute(const HomeView('battlestations'))),
                    ),
                    ListTile(  
                      tileColor: Colors.transparent,
                      title: const Text('Programming', style: TextStyle(color: Colors.white),),
                      subtitle: const Text('Computer Programming', style: TextStyle(color: Colors.white),),
                      leading: const CircleAvatar(  
                        backgroundImage: NetworkImage('https://styles.redditmedia.com/t5_2fwo/styles/communityIcon_1bqa1ibfp8q11.png?width=256&s=45361614cdf4a306d5510b414d18c02603c7dd3c'),
                        backgroundColor: Colors.transparent,
                      ),
                      onTap:()=>Navigator.of(context).pushReplacement(newSubredditRoute(const HomeView('programming'))),
                    ),
                    ListTile(  
                      tileColor: Colors.transparent,
                      title: const Text('PCMR', style: TextStyle(color: Colors.white),),
                      subtitle: const Text('Welcome to the official subreddit of the PC Master Race / PCMR! All PC related content is welcome, including build help, tech support, and any doubt one might have about PC ownership. You don\'t necessarily need a PC to be a member of the PCMR. You just have to love PCs. It\'s not about the hardware in your rig, but the software in your heart! Join us in celebrating and promoting tech, knowledge, and the best gaming and working platform. The PC.', style: TextStyle(color: Colors.white),),
                      leading: const CircleAvatar(  
                        backgroundImage: NetworkImage('https://styles.redditmedia.com/t5_2sgp1/styles/communityIcon_1mit7n6qhy481.png?width=256&s=b693ef2414ef97485151d9140733c025405e027b'),
                        backgroundColor: Colors.transparent,
                      ),
                      onTap:()=>Navigator.of(context).pushReplacement(newSubredditRoute(const HomeView('pcmasterrace'))),
                    ),
                  ],
                )
              )
            ),
            ListView.builder(
              physics: const NeverScrollableScrollPhysics(),
              shrinkWrap: true,
              itemCount: posts!.data!.children!.length,
              itemBuilder: ((context, index) {
                return Padding(
                  padding: const EdgeInsets.only(bottom: 7.5),
                  child: ClipRRect(
                    borderRadius: BorderRadius.circular(5.0),
                    child: ExpansionTile(  
                      title: Text("${posts.data!.children![index].data?.title}", style: const TextStyle(color: Colors.white, fontWeight: FontWeight.bold),),
                      subtitle: FittedBox(
                        alignment: Alignment.centerLeft,
                        fit: BoxFit.scaleDown,
                        child: Text(
                        "Posted By: ${posts.data!.children![index].data?.author}", 
                        maxLines: 1, 
                        style: const TextStyle(color: Colors.white,)
                        )
                      ),  
                      leading: CircleAvatar(
                        backgroundImage: posts.data!.children![index].data!.thumbnail!.contains('https://')
                          ? NetworkImage(posts.data!.children![index].data!.thumbnail!)
                          : null,
                        backgroundColor: Colors.transparent,
                      ),
                      trailing: FittedBox(  
                        child: Padding(  
                          padding: const EdgeInsets.only(right: 10),
                          child: Row(  
                            children: [
                              const Icon(Icons.arrow_upward, color: Colors.green,),
                              Text(
                                posts.data!.children![index].data!.ups! > 1000 
                                ? '${(posts.data!.children![index].data!.ups! / 1000).toStringAsFixed(1)}k'
                                : '${posts.data!.children![index].data!.ups}', 
                                style: const TextStyle(color: Colors.white),
                              ),
                              IconButton(
                                onPressed:(){
                                  Navigator.of(context).push(commentsRoute('https://www.reddit.com/${posts.data!.children![index].data!.permalink}.json?sort=top'));
                                },
                                icon: const Icon(Icons.list, color: Colors.white,)
                              )
                            ],
                          )
                        ),
                      ),
                      collapsedBackgroundColor: Colors.grey[700],
                      backgroundColor: Colors.grey[600],
                      tilePadding: const EdgeInsets.all(5.0),
                      children:[listTileChildren(posts.data!.children![index].data!)],
                    ),
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
                        String? previous = 'https://api.reddit.com/r/${widget.subreddit}/.json';
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

  Route newSubredditRoute(Widget subreddit){
    return PageRouteBuilder(
      pageBuilder: (context, animation, secondaryAnimation) => subreddit,
      transitionsBuilder: (context, animation, secondaryAnimation, child) {
        const begin = Offset(0.0, -1.0);
        const end = Offset.zero;
        const curve = Curves.ease;

        var tween = Tween(begin: begin, end: end).chain(CurveTween(curve: curve));

        return SlideTransition(
          position: animation.drive(tween),
          child: child,
        );
      },
    );
  }

  Route commentsRoute(String commentsUrl){
    return PageRouteBuilder(
      pageBuilder: (context, animation, secondaryAnimation) => CommentsView(commentsUrl),
      transitionsBuilder: (context, animation, secondaryAnimation, child) {
        const begin = Offset(1.0, 0.0);
        const end = Offset.zero;
        const curve = Curves.ease;

        var tween = Tween(begin: begin, end: end).chain(CurveTween(curve: curve));

        return SlideTransition(
          position: animation.drive(tween),
          child: child,
        );
      },
    );
  }

  Widget listTileChildren(ChildData cd){
    int? numResolutions = cd.preview?.images?[0].resolutions?.length;
    if(numResolutions != null && numResolutions > 1){
      return SizedBox( 
        width: MediaQuery.of(context).size.width, 
        child: Image.network(
          cd.preview!.images![0].resolutions![numResolutions-1].url!.replaceAll('amp;', ''),
          fit: BoxFit.fill,
        )
      );
    }
    else{
      return Container();
    }
  }
}

