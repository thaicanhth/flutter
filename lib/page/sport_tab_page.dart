import 'package:flutter/material.dart';
import 'package:project_flutter2/models/news.dart';
import 'package:project_flutter2/page/read_new_page.dart';
import 'package:project_flutter2/widgets/primary_card.dart';
import 'package:project_flutter2/widgets/sporttap.dart';
class SportTapPage extends StatelessWidget {
  const SportTapPage({Key? key,}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      controller: ScrollController(),
      itemCount: trendingList.length,
      scrollDirection: Axis.vertical,
      shrinkWrap: true,
      physics: BouncingScrollPhysics(),
      itemBuilder: (context,  index) {
        var sport = sportList[index];
        return InkWell(
          onTap: (){
            Navigator.push(context,
            MaterialPageRoute(builder: (context) =>
            ReadNewsPage(news: sport),
            ),
            );
          },
          // child: Container(
          //   width: double.infinity,
          //   height: 135,
          //   margin: EdgeInsets.symmetric(horizontal: 18, vertical: 8),
          //   child: SportTap(news: sport),
          // ),
        );
      },
    );
  }
}
