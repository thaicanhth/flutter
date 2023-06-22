import 'package:flutter/material.dart';
import 'package:project_flutter2/constants.dart';
import 'package:project_flutter2/models/news.dart';
import 'package:project_flutter2/widgets/circle_button.dart';
class ReadNewsPage extends StatelessWidget {
  const ReadNewsPage({Key? key, required this.news,}) : super(key: key);
  final News news;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: PreferredSize(
        preferredSize: Size.fromHeight(65),
        child: Center(
          child: SafeArea(child: Padding(padding: EdgeInsets.fromLTRB(18, 15, 18, 0),
          child: Row(
            children: [
              CircleButton(
                  icon: Icons.arrow_back_ios,
                  onTap: ()=>Navigator.pop(context),
              ),
              SizedBox(width: 5,),
              Text(news.textcome,style: kCategoryTitle
              ),
              Spacer(),
              CircleButton(
                icon: Icons.bookmark_border,
                onTap: (){},
              ),
              CircleButton(
                icon: Icons.share,
                onTap: (){},
              ),
            ],
          ),
          ),
          ),
        ),
      ),
      body: Container(
        padding: EdgeInsets.symmetric(horizontal: 18),
        child: ListView(
          children: [
            SizedBox(height: 12,),
            Hero(tag: news.seen, child: Container(
              height: 220,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(15),
                image: DecorationImage(image: NetworkImage(news.image),
                fit: BoxFit.fill),
              ),
            ),
            ),
            SizedBox(height: 15,),
            Row(
              children: [
                Container(
                  padding: EdgeInsets.symmetric(
                    horizontal: 12,
                    vertical: 15,
                  ),
                  decoration: BoxDecoration(
                    border: Border.all(color: kGrey3,width: 1),
                    borderRadius: BorderRadius.circular(25),
                  ),
                  child: Row(
                    children: [
                      CircleAvatar(
                        radius: 5,
                        backgroundColor: kGrey3,
                      ),
                      SizedBox(width: 6,),
                      Text(
                        news.category,
                        style: kCategoryTitle,
                      )
                    ],
                  ),
                ),
                Spacer(),
                Status(icon: Icons.remove_red_eye,
                    total: news.seen),
                SizedBox(width: 15,),
                Status(icon: Icons.favorite_border,
                    total: news.favorite),
              ],
            ),
            SizedBox(height: 12,),
            Text(news.title,style: kTitleCard.copyWith(fontSize: 28),),
            SizedBox(height: 15,),
            Row(
              children: [
                Text(news.time,style: kDetailContent,),
                SizedBox(width: 5,),
                SizedBox(width: 10,
                child: Divider(
                  color: kBlack,
                  height: 1,
                ),
                ),
                SizedBox(width: 5,),
                Text(news.author,
                style: kDetailContent.copyWith(color: Colors.black,),
                ),
              ],
            ),
            SizedBox(height: 15,),
            Text(news.content, style: descriptionStyle.copyWith(color: Colors.black54),),
            SizedBox(height: 25,),
          ],
        ),
      ),
    );
  }
}




class Status extends StatelessWidget {
  const Status({Key? key, required this.icon, required this.total}) : super(key: key);
  final IconData icon;
  final String total;
  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Icon(icon,color: kGrey2,),
        SizedBox(width: 5,),
        Text(total, style: kDetailContent,),
      ],
    );
  }
}


