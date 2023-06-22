import 'package:flutter/material.dart';
import 'package:project_flutter2/models/news.dart';
import 'package:project_flutter2/page/read_new_page.dart';
import 'package:project_flutter2/widgets/primary_card.dart';
class TrendingTabPage extends StatelessWidget {
  const TrendingTabPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      controller: ScrollController(),
      itemCount: trendingList.length,
      scrollDirection: Axis.vertical,
      shrinkWrap: true,
      physics: BouncingScrollPhysics(),
      itemBuilder: (context, index) {
        var trending = trendingList[index];
        return InkWell(
          onTap: (){
            Navigator.push(context,
              MaterialPageRoute(
                builder: (context) => ReadNewsPage(news: trending),
              ),
            );
          },
          child: Container(
            width: double.infinity,
            height: 300,
            margin: EdgeInsets.symmetric(horizontal: 18, vertical: 12),
            child:
            PrimaryCard(news: trending),
          ),
        );
      } ,
    );
  }
}
