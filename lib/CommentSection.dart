
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class CommentSection extends StatefulWidget {
  // const CommentSection({Key? key}) : super(key: key);

  @override
  _CommentSectionState createState() => _CommentSectionState();
}

class _CommentSectionState extends State<CommentSection> {
  User? user = FirebaseAuth.instance.currentUser;
  final commentController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // backgroundColor: Colors.black,
      appBar: AppBar(
        backgroundColor: Color(0xff06AB8D),
        title: Text(
          "Comments",
          style: TextStyle(
            color: Colors.white,
            fontSize: 16.5,
          ),
        ),
      ),
      body: Column(
        children: [
          Expanded(
            child: StreamBuilder<QuerySnapshot>(
              stream: FirebaseFirestore.instance
                  .collection('users')
                  .doc(user!.uid)
                  .collection('comments')
                  .snapshots(),
              builder:
                  (context, AsyncSnapshot<QuerySnapshot> commentSnapshot) {
                if (commentSnapshot.hasData) {
                  final List<DocumentSnapshot> commentDocuments =
                      commentSnapshot.data!.docs;
                  return ListView(
                    children: commentDocuments.map((doc) => Padding(
                      padding: const EdgeInsets.only(top: 15,),
                      child: Container(
                        padding: EdgeInsets.symmetric(vertical: 10, horizontal: 17),
                          width: double.infinity,
                          margin: EdgeInsets.symmetric(vertical: 5, horizontal: 8),
                               decoration: BoxDecoration(
                                 borderRadius: BorderRadius.circular(10),
                                 color: Color(0xFFEAEAEA)
                               ),
                                child: Text(doc['comment']),

                      ),
                    )).toList(),
                  );
                } else {
                  return Center(
                    child: CircularProgressIndicator(),
                  );
                }
              },
            ),
          ),
          Container(
            child: Row(
              children: [
                Expanded(
                  child: Padding(
                    padding: const EdgeInsets.only(left: 10),
                    child: TextFormField(
                      controller: commentController,
                      decoration: InputDecoration(hintText: "Enter a comment"),
                    ),
                  ),
                ),
                FloatingActionButton(
                  backgroundColor: Color(0xff06AB8D),
                  onPressed: () async {
                    await FirebaseFirestore.instance
                        .collection('users')
                        .doc(user!.uid)
                        .collection('comments')
                        .add({
                      'comment': commentController.text,
                      'timestamp': FieldValue.serverTimestamp(),
                    });
                    commentController.clear();
                  },
                  child: Icon(Icons.send),
                ),
              ],
            ),
          )
        ],
      ),
    );
  }
}