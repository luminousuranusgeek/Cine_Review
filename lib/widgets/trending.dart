import 'package:example/description.dart';
import 'package:example/utils/text.dart';
import 'package:flutter/material.dart';
class TrendingMovies extends StatelessWidget {
  const TrendingMovies({Key? key, required this.trending}) : super(key: key);
  final List trending;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(10),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          modified_text(text:'Trending Movies', size: 22, color: Colors.white,),
          SizedBox(height: 10,),
          Container(height: 270,
          child: ListView.builder(itemCount: trending.length,
          scrollDirection: Axis.horizontal,
          itemBuilder: (context, index){
            return InkWell(
              onTap: (){
                Navigator.push(context, MaterialPageRoute(builder: (context)=>Description(name: trending[index]['title'], description: trending[index]['overview'], bannerurl: 'http://image.tmdb.org/t/p/w500'+trending[index]['backdrop_path'], posturl: 'http://image.tmdb.org/t/p/w500'+trending[index]['poster_path'], vote: trending[index]['vote_average'].toString(), launch_on: trending[index]['release_date'],)));
              },
              child:trending[index]['title']!=null?
              Container(
                width: 140,
                child: Column(
                  children: [
                    Container(
                      height:200,
                      decoration: BoxDecoration(
                        image: DecorationImage( image: NetworkImage(
                          'http://image.tmdb.org/t/p/w500'+trending[index]['poster_path']
                        )
                        )),
                    ),
                    Container(child: modified_text(size:16, color: Colors.white,text: trending[index]['title']!=null?
                      trending[index]['title']:'Loading'),)
                  ],
                ),
              ):Container(),
            );
          }
          ),
          )
        ],
      ),
    );
  }
}
