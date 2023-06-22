import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_database/firebase_database.dart';
import 'package:firebase_database/ui/firebase_animated_list.dart';
import 'package:flutter/material.dart';
import 'package:project_flutter2/CommentSection.dart';
import 'package:project_flutter2/constants.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

import 'insert.dart';
import 'update.dart';
class SecondaryCard extends StatelessWidget {
  const SecondaryCard({Key? key, }) ;
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

  }
}
