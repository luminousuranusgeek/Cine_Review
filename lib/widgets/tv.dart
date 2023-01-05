import 'package:example/utils/text.dart';
import 'package:flutter/material.dart';
import 'package:example/description.dart';
class TV extends StatelessWidget {
  const TV({Key? key, required this.tv}) : super(key: key);
  final List tv;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(10),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          modified_text(text:'TV Shows', size: 22, color: Colors.white,),
          SizedBox(height: 10,),
          Container(height: 200,
            child: ListView.builder(itemCount: tv.length,
                scrollDirection: Axis.horizontal,
                itemBuilder: (context, index){
                  return InkWell(
                    onTap: (){
                      Navigator.push(context, MaterialPageRoute(builder: (context)=>Description(name: tv[index]['name'], description: tv[index]['overview'], bannerurl: 'http://image.tmdb.org/t/p/w500'+tv[index]['backdrop_path'], posturl: 'http://image.tmdb.org/t/p/w500'+tv[index]['poster_path'], vote: tv[index]['vote_average'].toString(), launch_on: tv[index]['first_air_date'],)));
                    },
                    child:tv[index]['name']!=null?
                    Container(
                      padding: EdgeInsets.all(5),
                      width: 250,
                      child: Column(
                        children: [
                          Container(
                            width:240,
                            height: 160,
                            decoration: BoxDecoration(borderRadius: BorderRadius.circular(20),
                                image: DecorationImage( image: NetworkImage(
                                    'http://image.tmdb.org/t/p/w500'+tv[index]['poster_path']
                                ), fit: BoxFit.cover
                                )),
                          ),
                          Container(child: modified_text(size:16, color: Colors.white,text: tv[index]['name']!=null?
                          tv[index]['name']:'Loading'),)
                        ],
                      ),
                    ):Container(),
                  );
                }
            ),
          ),
          SizedBox(height: 10),
        ],
      ),
    );
  }
}
