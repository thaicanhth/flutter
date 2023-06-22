import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_database/firebase_database.dart';
import 'package:flutter/material.dart';
import 'package:project_flutter2/CommentSection.dart';
import 'package:project_flutter2/constants.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
class CloudFirestoreSearch extends StatefulWidget {
  @override
  _CloudFirestoreSearchState createState() => _CloudFirestoreSearchState();
}

class _CloudFirestoreSearchState extends State<CloudFirestoreSearch> {
  String name = "";

  @override
  Widget build(BuildContext context) {
    DatabaseReference db_Ref =
    FirebaseDatabase.instance.ref().child('contacts');
    return Scaffold(
      appBar: AppBar(
        toolbarHeight: 70,
        backgroundColor: Color(0xff06AB8D),
        elevation: 0,
        title: Card(
          child: TextField(
            decoration: InputDecoration(
                prefixIcon: Icon(Icons.search), hintText: 'Search...'),
            onChanged: (val) {
              setState(() {
                name = val;
              });
            },
          ),
        ),

      ),
      body: StreamBuilder<QuerySnapshot>(
        stream: (name != "" && name != null)
            ? FirebaseFirestore.instance
            .collection('Products1')
            .where("searchKeywords", arrayContains: name)
            .snapshots()
            : FirebaseFirestore.instance.collection("Products1").snapshots(),
        builder: (context, snapshot) {
          return (snapshot.connectionState == ConnectionState.waiting)
              ? Center(child: CircularProgressIndicator())
              : ListView.builder(
            padding: const EdgeInsets.all(5),
            itemCount: snapshot.data!.docs.length,
            itemBuilder: (context, index) {
              DocumentSnapshot data = snapshot.data!.docs[index];
              return Container(
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
                              data['name1'],
                              overflow: TextOverflow.ellipsis,
                              maxLines: 2,
                              style:kTitleCard01,
                            ),
                          ),
                          SizedBox(height: 15,),
                          Padding(
                            padding: const EdgeInsets.only(left: 15),
                            child: Text(
                              data['title1'],
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
                        placeholder: 'images/anh10.jpg', image: data['imageUrl'],
                        fit: BoxFit.cover,
                        height: 100,
                        width: 100,
                      ),
                    ),
                  ],
                ),
              );
            },
          );
        },
      ),
    );
  }
}
