
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_database/firebase_database.dart';
import 'package:firebase_database/ui/firebase_animated_list.dart';
import 'package:flutter/material.dart';
import 'package:project_flutter2/CommentSection.dart';
import 'package:project_flutter2/constants.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

import 'update.dart';

class MainScreen extends StatefulWidget {
  const MainScreen({Key? key}) : super(key: key);

  @override
  State<MainScreen> createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen> {
  @override
  Widget build(BuildContext context) {
    DatabaseReference db_Ref =
    FirebaseDatabase.instance.ref().child('contacts');
    return Scaffold(
      body: FirebaseAnimatedList(
        query: db_Ref,
        shrinkWrap: true,
        itemBuilder: (context, snapshot, animation, index) {
          Map Contact = snapshot.value as Map;
          Contact['key'] = snapshot.key;
          return GestureDetector(
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (_) => UpdateRecord(
                    Contact_Key: Contact['key'],
                  ),
                ),
              );
              // print(Contact['key']);
            },
            child: Container(
              // height: 127,
              width: double.infinity,
              margin: const EdgeInsets.only(bottom: 12),
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(10),
                boxShadow: const [
                  BoxShadow(
                    color: Colors.black26,
                    offset: Offset(2, 2),
                    blurRadius: 5,
                  ),
                ],
              ),
              child: Row(
                children: [
                  SizedBox(height: 12,),
                  Expanded(child: Padding(
                    padding: EdgeInsets.symmetric(vertical: 5),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Padding(
                          padding: const EdgeInsets.only(left: 15),
                          child: Text(
                            Contact['name'],
                            overflow: TextOverflow.ellipsis,
                            maxLines: 2,
                            style:kTitleCard01,
                          ),
                        ),
                        SizedBox(height: 15,),
                        Padding(
                          padding: const EdgeInsets.only(left: 15),
                          child: Text(
                            Contact['title'],
                            overflow: TextOverflow.ellipsis,
                            maxLines: 2,
                            style: kTitleCard,
                          ),
                        ),
                        Row(
                          children: [
                            GestureDetector(
                              child: IconButton(onPressed: (){
                                Navigator.push(context,
                                    MaterialPageRoute(
                                      builder: (context) =>
                                          CommentSection(),
                                    ));
                              },
                                icon: Icon(FontAwesomeIcons.comment,size: 22,color: Colors.black45,),),
                            ),
                            // Text(news.time,style: kDetailContent,),
                            // SizedBox(width: 10,),
                            // CircleAvatar(
                            //   radius: 5,
                            //   backgroundColor: kGrey1,
                            // ),
                            SizedBox(width: 0,),
                            Text("Comment",style: kDetailContent,),
                            SizedBox(width: 1,),
                            CircleAvatar(radius: 5,
                              backgroundColor: kGrey1,),
                            SizedBox(width: 3,),

                          ],
                        )
                      ],
                    ),
                  ),
                  ),
                  Container(
                    padding: EdgeInsets.only(right: 15),
                    child: FadeInImage.assetNetwork(
                      placeholder: 'images/anh9.jpg', image:  Contact['url'],
                      fit: BoxFit.cover,
                      height: 100,
                      width: 100,
                    ),
                  ),
                ],
              ),
            ),
          );
        },
      ),

    );

    // return Scaffold(
    //   body: SingleChildScrollView(
    //     padding: const EdgeInsets.all(5),
    //     child: Column(
    //       children: [
    //         // const Text(""),
    //         StreamBuilder<QuerySnapshot>(
    //           stream: FirebaseFirestore.instance.collection("Products").snapshots(),
    //           builder: (BuildContext context, AsyncSnapshot<QuerySnapshot> snapshot) {
    //             if(snapshot.hasData) {
    //               final snap = snapshot.data!.docs;
    //               return ListView.builder(
    //                 shrinkWrap: true,
    //                 primary: false,
    //                 itemCount: snap.length,
    //                 itemBuilder: (context, index) {
    //                   return Container(
    //                     height: 127,
    //                     width: double.infinity,
    //                     margin: const EdgeInsets.only(bottom: 12),
    //                     decoration: BoxDecoration(
    //                       color: Colors.white,
    //                       borderRadius: BorderRadius.circular(10),
    //                       boxShadow: const [
    //                         BoxShadow(
    //                           color: Colors.black26,
    //                           offset: Offset(2, 2),
    //                           blurRadius: 5,
    //                         ),
    //                       ],
    //                     ),
    //                     child: Row(
    //                       children: [
    //                         SizedBox(height: 12,),
    //                         Expanded(child: Padding(
    //                           padding: EdgeInsets.symmetric(vertical: 5),
    //                           child: Column(
    //                             crossAxisAlignment: CrossAxisAlignment.start,
    //                             children: [
    //                               Padding(
    //                                 padding: const EdgeInsets.only(left: 15),
    //                                 child: Text(
    //                                   snap[index]['name'],
    //                                   overflow: TextOverflow.ellipsis,
    //                                   maxLines: 2,
    //                                   style:kTitleCard01,
    //                                 ),
    //                               ),
    //                               SizedBox(height: 15,),
    //                               Padding(
    //                                 padding: const EdgeInsets.only(left: 15),
    //                                 child: Text(
    //                                   snap[index]['title'],
    //                                   overflow: TextOverflow.ellipsis,
    //                                   maxLines: 2,
    //                                   style: kTitleCard,
    //                                 ),
    //                               ),
    //                               Row(
    //                                 children: [
    //                                   GestureDetector(
    //                                     child: IconButton(onPressed: (){
    //                                       Navigator.push(context,
    //                                           MaterialPageRoute(
    //                                             builder: (context) =>
    //                                                 CommentSection(),
    //                                           ));
    //                                     },
    //                                       icon: Icon(FontAwesomeIcons.comment,size: 22,color: Colors.black45,),),
    //                                   ),
    //                                   // Text(news.time,style: kDetailContent,),
    //                                   // SizedBox(width: 10,),
    //                                   // CircleAvatar(
    //                                   //   radius: 5,
    //                                   //   backgroundColor: kGrey1,
    //                                   // ),
    //                                   SizedBox(width: 0,),
    //                                   Text("Comment",style: kDetailContent,),
    //                                   SizedBox(width: 1,),
    //                                   CircleAvatar(radius: 5,
    //                                     backgroundColor: kGrey1,),
    //                                   SizedBox(width: 3,),
    //
    //                                 ],
    //                               )
    //                             ],
    //                           ),
    //                         ),
    //                         ),
    //                         Container(
    //                           padding: EdgeInsets.only(right: 15),
    //                           child: FadeInImage.assetNetwork(
    //                               placeholder: 'images/anh1.jpg', image: snap[index]['imageUrl'],
    //                             fit: BoxFit.cover,
    //                             height: 100,
    //                             width: 100,
    //                           ),
    //                         ),
    //                       ],
    //                     ),
    //                   );
    //                 },
    //               );
    //             } else {
    //               return const SizedBox();
    //             }
    //           },
    //         )
    //       ],
    //     ),
    //   ),
    // );
  }
}
