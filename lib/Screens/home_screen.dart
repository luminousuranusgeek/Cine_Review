import 'package:example/Screens/signin_screen.dart';
import 'package:example/utils/text.dart';
import 'package:example/widgets/toprated.dart';
import 'package:example/widgets/trending.dart';
import 'package:example/widgets/tv.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:tmdb_api/tmdb_api.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  List trendingmovies = [];
  List topratedmovies = [];
  List tv = [];
  final String apikey = 'c3f794053ceb6509a89d689824d754aa';
  final readaccesstoken = 'eyJhbGciOiJIUzI1NiJ9.eyJhdWQiOiJjM2Y3OTQwNTNjZWI2NTA5YTg5ZDY4OTgyNGQ3NTRhYSIsInN1YiI6IjYzYjI4ZDQ5ODc1ZDFhMDA4MjAyOTE5NyIsInNjb3BlcyI6WyJhcGlfcmVhZCJdLCJ2ZXJzaW9uIjoxfQ.TS98h2Ccb776-VyQUDhtvY1LSvXYp2pKEAz-iNkQF1U';

  @override
  void initState() {
    loadmovies();
    super.initState();
  }

  loadmovies() async{
        TMDB tmdbWithCustomLogs = TMDB(ApiKeys(apikey, readaccesstoken),
        logConfig: ConfigLogger(
          showLogs: true,
          showErrorLogs: true
        ));
  Map trendingresult = await tmdbWithCustomLogs.v3.trending.getTrending();
  Map topratedresult = await tmdbWithCustomLogs.v3.movies.getTopRated();
  Map tvresult = await tmdbWithCustomLogs.v3.tv.getPopular();
  setState(() {
    trendingmovies = trendingresult['results'];
    topratedmovies = topratedresult['results'];
    tv = tvresult['results'];
  });
  print(tv);
  print(trendingmovies);
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      appBar: AppBar(
        title: modified_text(text:'Movie App', size: 28, color: Colors.white,),
        backgroundColor: Colors.transparent,
        elevation: 0,
      ),
      body: ListView(
        children: [
          TrendingMovies(trending: trendingmovies),
          TopRated(toprated: topratedmovies),
          TV(tv: tv),
      ElevatedButton(
        child: Text('LOG OUT'),
        style: ElevatedButton.styleFrom(
          primary: Colors.white24,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(20),
          )
        ),
        onPressed: () {
          FirebaseAuth.instance.signOut().then((value) {
            print("Signed Out");
            Navigator.push(context,
                MaterialPageRoute(builder: (context)=> SignInScreen()));
          });

        })
        ],
      ),
    );
  }
}



// sanusourav200@gmail.com
/*
 child: ElevatedButton(
          child: Text('Logout'),
          onPressed: () {
            FirebaseAuth.instance.signOut().then((value) {
              print("Signed Out");
              Navigator.push(context,
                  MaterialPageRoute(builder: (context)=> SignInScreen()));
            });

          },
 */