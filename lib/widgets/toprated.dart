import 'package:example/utils/text.dart';
import 'package:flutter/material.dart';
import 'package:example/description.dart';
class TopRated extends StatelessWidget {
  const TopRated({Key? key, required this.toprated}) : super(key: key);
  final List toprated;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(10),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          modified_text(text:'Top Rated Movies', size: 22, color: Colors.white,),
          SizedBox(height: 10,),
          Container(height: 270,
            child: ListView.builder(itemCount: toprated.length,
                scrollDirection: Axis.horizontal,
                itemBuilder: (context, index){
                  return InkWell(
                    onTap: (){
                      Navigator.push(context, MaterialPageRoute(builder: (context)=>Description(name: toprated[index]['title'], description: toprated[index]['overview'], bannerurl: 'http://image.tmdb.org/t/p/w500'+toprated[index]['backdrop_path'], posturl: 'http://image.tmdb.org/t/p/w500'+toprated[index]['poster_path'], vote: toprated[index]['vote_average'].toString(), launch_on: toprated[index]['release_date'],)));
                    },
                    child:toprated[index]['title']!=null?
                    Container(
                      width: 140,
                      child: Column(
                        children: [
                          Container(
                            height:200,
                            decoration: BoxDecoration(
                                image: DecorationImage( image: NetworkImage(
                                    'http://image.tmdb.org/t/p/w500'+toprated[index]['poster_path']
                                )
                                )),
                          ),
                          Container(child: modified_text(size:16, color: Colors.white,text: toprated[index]['title']!=null?
                          toprated[index]['title']:'Loading'),)
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
