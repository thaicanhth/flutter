import 'package:flutter/material.dart';
import 'package:project_flutter2/constants.dart';
import 'package:project_flutter2/models/news.dart';
import 'package:project_flutter2/page/read_new_page.dart';
import 'package:project_flutter2/widgets/primary_card.dart';
import 'package:project_flutter2/widgets/secondary.dart';
class PopularTabPage extends StatelessWidget {
  const PopularTabPage({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Container(
      child: ListView(
        children: [
          Container(
            width: double.infinity,
            color: Colors.white,
            height: 300,
            padding: EdgeInsets.only(right: 10),
            child: ListView.builder(
              itemCount: popularList.length,
              scrollDirection: Axis.horizontal,
              shrinkWrap: true,
              itemBuilder: (context, index) {
                var news = popularList[index];
                return InkWell(
                  onTap: (){
                    Navigator.push(context,
                      MaterialPageRoute(
                      builder: (context) => ReadNewsPage(news: news),
                      ),
                    );
                  },
                  child: Container(
                    margin: EdgeInsets.only(right: 0),
                    child: PrimaryCard(news: news),
                  ),
                );
              },
            ),
          ),
          SizedBox(height: 5),
          // Align(
          //   alignment: Alignment.topLeft,
          //   child: Padding(
          //     padding: EdgeInsets.only(left: 5),
          //     child: Text("BASED ON YOUR READING HISTORY",
          //     style: kNonActiveTabStyle,),
          //   ),
          // ),
          ListView.builder(
            itemCount: recentList.length,
            scrollDirection: Axis.vertical,
            shrinkWrap: true,
            physics: ScrollPhysics(),
            itemBuilder: (context, index){
              var recent = recentList[index];
              return InkWell(
                onTap: (){
                  Navigator.push(context,
                    MaterialPageRoute(
                      builder: (context) => ReadNewsPage(news: recent),
                    ),
                  );
                },
                // child: Container(
                //   width: double.infinity,
                //   height: 135,
                //   margin: EdgeInsets.symmetric(horizontal: 18, vertical: 8),
                //   child: SecondaryCard(news: recent),
                // ),
              );
            },
          ),
        ],
      ),
    );
  }
}
