import 'dart:io';

import 'package:firebase_database/firebase_database.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'secondary.dart';

class UpdateRecord extends StatefulWidget {
  String Contact_Key;
  UpdateRecord({required this.Contact_Key});

  @override
  State<UpdateRecord> createState() => _UpdateRecordState();
}

class _UpdateRecordState extends State<UpdateRecord> {
  TextEditingController contactName = new TextEditingController();
  TextEditingController contactTitle = new TextEditingController();
  var url;
  var url1;
  File? file;
  ImagePicker image = ImagePicker();
  DatabaseReference? db_Ref;

  @override
  void initState() {
    super.initState();
    db_Ref = FirebaseDatabase.instance.ref().child('contacts');
    Contactt_data();
  }

  void Contactt_data() async {
    DataSnapshot snapshot = await db_Ref!.child(widget.Contact_Key).get();

    Map Contact = snapshot.value as Map;

    setState(() {
      contactName.text = Contact['name'];
      contactTitle.text = Contact['title'];
      url = Contact['url'];
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Update Record',
          style: TextStyle(
            fontSize: 20,
          ),
        ),
        backgroundColor: Color(0xff06AB8D),
      ),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Center(
              child: Container(
                height: 200,
                width: 200,
                child: url == null
                    ? MaterialButton(
                  height: 100,
                  child: Image.file(
                    file!,
                    fit: BoxFit.fill,
                  ),
                  onPressed: () {
                    getImage();
                  },
                )
                    : MaterialButton(
                  height: 100,
                  child: CircleAvatar(
                    maxRadius: 100,
                    backgroundImage: NetworkImage(
                      url,
                    ),
                  ),
                  onPressed: () {
                    getImage();
                  },
                ),
              ),
            ),
            SizedBox(
              height: 10,
            ),
            TextFormField(
              controller: contactName,
              decoration: InputDecoration(
                filled: true,
                fillColor: Colors.white,
                hintText: 'Name',
              ),
            ),
            SizedBox(
              height: 20,
            ),
            TextFormField(
              controller: contactTitle,
              decoration: InputDecoration(
                filled: true,
                fillColor: Colors.white,
                hintText: 'title',
              ),
            ),
            SizedBox(
              height: 20,
            ),
            MaterialButton(
              height: 40,
              onPressed: () {
                // getImage();

                if (file != null) {
                  uploadFile();
                } else {
                  directupdate();
                }
              },
              child: Text(
                "Update",
                style: TextStyle(
                  color: Color.fromARGB(255, 255, 255, 255),
                  fontSize: 20,
                ),
              ),
              color: Color(0xff06AB8D),
            ),
          ],
        ),
      ),
    );
  }

  getImage() async {
    var img = await image.pickImage(source: ImageSource.gallery);
    setState(() {
      url = null;
      file = File(img!.path);
    });

    // print(file);
  }

  uploadFile() async {
    try {
      var imagefile = FirebaseStorage.instance
          .ref()
          .child("contact_photo")
          .child("/${contactName.text}.jpg");
      UploadTask task = imagefile.putFile(file!);
      TaskSnapshot snapshot = await task;
      url1 = await snapshot.ref.getDownloadURL();
      setState(() {
        url1 = url1;
      });
      if (url1 != null) {
        Map<String, String> Contact = {
          'name': contactName.text,
          'title': contactTitle.text,
          'url': url1,
        };

        db_Ref!.child(widget.Contact_Key).update(Contact).whenComplete(() {
          Navigator.pushReplacement(
            context,
            MaterialPageRoute(
              builder: (_) => SecondaryCard(),
            ),
          );
        });
      }
    } on Exception catch (e) {
      print(e);
    }
  }

  directupdate() {
    if (url != null) {
      Map<String, String> Contact = {
        'name': contactName.text,
        'title': contactTitle.text,
        'url': url,
      };

      db_Ref!.child(widget.Contact_Key).update(Contact).whenComplete(() {
        Navigator.pushReplacement(
          context,
          MaterialPageRoute(
            builder: (_) => SecondaryCard(),
          ),
        );
      });
    }
  }
}