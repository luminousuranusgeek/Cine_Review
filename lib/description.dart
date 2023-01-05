import 'package:example/utils/text.dart';
import 'package:flutter/material.dart';
class Description extends StatelessWidget {
  const Description({Key? key, required this.name, required this.description, required this.bannerurl, required this.posturl, required this.vote, required this.launch_on}) : super(key: key);
  final String name, description, bannerurl, posturl, vote, launch_on;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      body: Container(
        child: ListView(
          children: [
            Container(
              height: 250,
              child: Stack(
                children: [
                  Positioned(child: Container(
                    height: 250,
                    width: MediaQuery.of(context).size.width,
                    child: Image.network(bannerurl, fit: BoxFit.cover,),
                  )),
                  Positioned(bottom: 10,
                      child: modified_text(size:18, color: Colors.white,text: '    ⭐  Average Ratio - '+vote,))
                ],
              ),
            ),
            SizedBox(height: 10,),
            Container(padding: EdgeInsets.all(10),
            child: modified_text(size: 24, color: Colors.white, text: name!=null?name:'Not Loaded',)),
            Container(padding: EdgeInsets.only(left: 10),
            child: modified_text(size: 16, color: Colors.white, text: 'Releasing On - '+launch_on,),),
            Row(
              children: [
                Container(
                  margin: EdgeInsets.all(5),
                  height: 200,
                  width: 100,
                  child: Image.network(posturl),
                ),
                Flexible(child: Container(child: modified_text(size: 16, color: Colors.white,text: description,),))
              ],
            )
          ],
        ),
      ),
    );
  }
}
