// ignore_for_file: use_key_in_widget_constructors

import 'package:carousel_pro/carousel_pro.dart';
import 'package:carousel_slider/carousel_controller.dart';
import 'package:flutter/material.dart';
import 'package:project_flutter2/models/news.dart';
import 'package:project_flutter2/constants.dart';
class PrimaryCard extends StatelessWidget {
  PrimaryCard({Key? key, required this.news}) ;
  final News news;
  final List<String> images =[
  "https://images2.thanhnien.vn/thumb_w/640/528068263637045248/2023/4/15/hinh-1-1681556191138250215464.jpeg",
  "https://images2.thanhnien.vn/thumb_w/640/528068263637045248/2023/4/15/thu-hoc-phi-16815567026151197754424.jpg",
  "https://o.aolcdn.com/images/dims?resize=1200%2C630&crop=1200%2C630%2C0%2C0&quality=80&image_uri=https%3A%2F%2Fs.yimg.com%2Fos%2Fcreatr-uploaded-images%2F2020-05%2F6caefb80-9c5d-11ea-afc4-ccfd5d320326&client=amp-blogside-v2&signature=69f050090db51ec49b41f34498ede628d5515e40",
  "https://images2.thanhnien.vn/thumb_w/640/528068263637045248/2023/4/12/thanh-hoa-1-1681280938875382357715.jpeg",
  "https://images2.thanhnien.vn/thumb_w/640/528068263637045248/2023/4/14/vinast-1681495731482142840763.jpg",
    "https://images2.thanhnien.vn/thumb_w/640/528068263637045248/2023/4/13/thcs-1681375247213416066037.jpeg",
    "https://cdn.24h.com.vn/upload/1-2023/images/2023-02-28/f-1677552633-430-width1200height800.jpg",
    "https://images2.thanhnien.vn/528068263637045248/2023/2/28/2023-02-27t111218z2115954908rc23jz9u72bkrtrmadp3ukraine-crisis-bakhmut-16775781273741510441059.jpg"
  ];
  final CarouselController carouselController = CarouselController();
  int currentIndex = 0;
  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    return Container(
      width: MediaQuery.of(context).size.width,
      padding: EdgeInsets.symmetric(horizontal: 10,vertical: 15),
      decoration: BoxDecoration(
        color: Colors.white,
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: <Widget> [
              Icon(Icons.call_missed_outgoing,color: Colors.red,size: 35,),
              SizedBox(width: 10),
              Text(news.category, style: kCategoryTitle,)
            ],
          ),
          SizedBox(height: 5,
          ),
          Expanded(child: Hero(
            tag: news.seen,
              child: Carousel(
                autoplay: true,
                dotSpacing: 15,
                dotSize: 6,
                dotBgColor: Colors.transparent,
                images:
                  images.map((item) =>
                      Container(
                        child: Container(
                          margin: EdgeInsets.all(5),
                            child: ClipRRect(
                              borderRadius: BorderRadius.all(Radius.circular(5)),
                              child: Stack(
                                children: [
                                  Image.network(item, fit: BoxFit.cover,width: 1700,),
                                  Positioned(
                                    bottom: 0,
                                      left: 0,
                                      right: 0,
                                      child: Container(
                                        decoration: BoxDecoration(
                                          gradient: LinearGradient(
                                            colors: [
                                              Color.fromARGB(200, 0, 0, 0),
                                              Color.fromARGB(0, 0, 0, 0)
                                            ],
                                            begin: Alignment.bottomCenter,
                                            end: Alignment.topCenter,
                                          ),
                                        ),
                                        padding: EdgeInsets.symmetric(
                                          vertical: 10, horizontal: 20
                                        ),
                                        child: Text(
                                          'Tin ${images.indexOf(item)}',
                                          style: TextStyle(
                                            color: Colors.white,
                                            fontSize: 20.0,
                                            fontWeight: FontWeight.bold,
                                          ),
                                        ),
                                      ),
                                  )

                                ],
                              ),
                            ),
                        ),
                      ),
                  ).toList(),
              ),
          ),
          ),
          SizedBox(height: 5,),
          Row(
            children: [
              Icon(Icons.library_books,color: Color(0xff06AB8D),size: 30,),
              SizedBox(width: 10,),
              Text(news.text, style: TextStyle(fontSize: 17,color: Colors.black,fontWeight: FontWeight.bold),),
              Spacer(flex: 10,),
              Icon(Icons.arrow_forward_ios_sharp,color: Color(0xff06AB8D),size: 30,),
              Spacer(flex: 2,),
            ],
          )
        ],
      ),
    );
  }
}
