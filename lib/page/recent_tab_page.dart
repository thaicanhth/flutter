import 'package:flutter/material.dart';
import 'package:project_flutter2/models/news.dart';
import 'package:project_flutter2/page/read_new_page.dart';
import 'package:project_flutter2/widgets/secondary.dart';
class RecentTabView extends StatelessWidget {
  const RecentTabView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      controller: ScrollController(),
      itemCount: recentList.length,
      scrollDirection: Axis.vertical,
      physics: BouncingScrollPhysics(),
      shrinkWrap: true,
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
          //   margin: EdgeInsets.symmetric(horizontal: 18, vertical: 12),
          //   child: SecondaryCard(news: recent)
          // ),
        );
      },
    );
  }
}

