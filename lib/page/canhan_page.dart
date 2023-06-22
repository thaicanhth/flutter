
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:path_provider/path_provider.dart';
import 'package:provider/provider.dart';
import 'package:switcher_button/switcher_button.dart';
import 'dart:io';
import '../helpers/ThemeModal.dart';
class CaNhanPage extends StatefulWidget {
  const CaNhanPage({Key? key}) : super(key: key);

  @override
  State<CaNhanPage> createState() => _CaNhanPageState();
}

class _CaNhanPageState extends State<CaNhanPage> {
  String imageUrl = "";

void PickUploadImage() async{
  final image = await ImagePicker().pickImage(
    source: ImageSource.gallery,
    maxWidth: 512,
    maxHeight: 512,
    imageQuality: 75,
  );
  if (ImagePicker == null) return;
  final appDir = await getApplicationDocumentsDirectory();
  Reference ref = FirebaseStorage.instance.ref().child("profilepic.jpg");
  String getdownloadURL;
  await ref.putFile(File(image!.path));
  ref.getDownloadURL().then((value) {
    print(value);
    setState(() {
      imageUrl = value;
    });
  });
}

  @override
  Widget build(BuildContext context) {
  final _auth =  FirebaseAuth.instance.currentUser!;
    return Consumer(builder: (context,ThemeModal themeNotifier,child){
      return Scaffold(
        // backgroundColor: Color(0xFFEAEAEA),
      appBar: AppBar(
        toolbarHeight: 70,
        backgroundColor: Color(0xff06AB8D),
        centerTitle: true,
        elevation: 0,
        automaticallyImplyLeading: false,
        title: Text('Cá nhân',style: TextStyle(fontSize: 25),),
      ),
      body: Container(
        child: ListView(
          children: [
            Container(
              width: 200,
              height: 100,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Padding(
                      padding: const EdgeInsets.only(top: 10,bottom: 10),
                      child: Container(
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(50),
                          border: Border.all(color: Colors.teal, )
                        ),
                          child: GestureDetector(
                            onTap: (){
                              PickUploadImage();
                            },
                            child: CircleAvatar(
                              // radius: 40,
                              backgroundColor: Colors.black12,
                              foregroundColor: Colors.white,
                              // child: Text("",style:TextStyle(fontSize: 45),),
                              radius: 40,
                                  child: imageUrl == ""? Icon(
                                    Icons.camera_alt_outlined,) : Image.network(imageUrl),
                              // backgroundImage: NetworkImage(_auth.photoURL!),
                            ),
                      ),
                      ),
                    ),
                ],
              ),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Padding(
                  padding: const EdgeInsets.only(left: 5),
                  child: Text("Loggin:" + _auth.email! ,style: TextStyle(fontSize: 16,fontWeight: FontWeight.w300),),

                ),
              ],
            ),
            SizedBox(height: 20,),

            Container(
              padding: EdgeInsets.only(left: 20),
              child: Row(
                children: [
                  Text("TIN NỔI BẬT",
                    style: TextStyle(
                        fontSize: 20,
                        fontWeight: FontWeight.bold
                    ),
                  ),
                ],
              ),
            ),
            SizedBox(height: 15,),
            Padding(
              padding: const EdgeInsets.only(left: 20,right: 20),
              child: Container(
                padding: EdgeInsets.symmetric(horizontal: 5),
                height: 65,
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(10)
                ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Row(
                      children: [
                        Icon(
                          Icons.circle_notifications_sharp,
                          size: 36,color: Color(0xff06AB8D),),
                        SizedBox(width: 0,),
                        Text("Tin hệ thống",
                          style: TextStyle(
                              fontSize: 14.5,color: Colors.black),),
                      ],
                    ),
                    IconButton(onPressed: (){}, icon: Icon(Icons.arrow_forward_ios,color: Color(0xff06AB8D),))
                  ],
                ),
              ),
            ),
            SizedBox(height: 10,),
            Padding(
              padding: const EdgeInsets.only(left: 20,right: 20),
              child: Container(
                padding: EdgeInsets.symmetric(horizontal: 5),
                height: 65,
                decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(10)
                ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Row(
                      children: [
                        Icon(
                          Icons.bookmark_border,
                          size: 36,color: Color(0xff06AB8D),),
                        SizedBox(width: 0,),
                        Text("Tin đã đánh dấu",
                          style: TextStyle(
                              fontSize: 14.5,color: Colors.black),),
                      ],
                    ),
                    IconButton(onPressed: (){}, icon: Icon(Icons.arrow_forward_ios,color: Color(0xff06AB8D)))
                  ],
                ),
              ),
            ),
            SizedBox(height: 10,),
            Padding(
              padding: const EdgeInsets.only(left: 20,right: 20),
              child: Container(
                padding: EdgeInsets.symmetric(horizontal: 5),
                height: 65,
                decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(10)
                ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Row(
                      children: [
                        Icon(
                          Icons.access_time,
                          size: 36,color: Color(0xff06AB8D),),
                        SizedBox(width: 0,),
                        Text("Tin đọc gần đây",
                          style: TextStyle(
                              fontSize: 14.5,color: Colors.black),),
                      ],
                    ),
                    IconButton(onPressed: (){}, icon: Icon(Icons.arrow_forward_ios,color: Color(0xff06AB8D)))
                  ],
                ),
              ),
            ),
            SizedBox(height: 20,),
            Container(
              padding: EdgeInsets.only(left: 20),
              child: Row(
                children: [
                  Text("CÁ NHÂN",
                    style: TextStyle(
                        fontSize: 20,
                        fontWeight: FontWeight.bold
                    ),
                  ),
                ],
              ),
            ),
            SizedBox(height: 15,),
            Padding(
              padding: const EdgeInsets.only(left: 20,right: 20),
              child: Container(
                padding: EdgeInsets.symmetric(horizontal: 5),
                height: 65,
                decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(10)
                ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Row(
                      children: [
                        Icon(
                          Icons.arrow_circle_down_sharp,
                          size: 36,color: Color(0xff06AB8D),),
                        SizedBox(width: 0,),
                        Text("Sắp xếp thứ tự chuyên mục",
                          style: TextStyle(
                              fontSize: 14.5,color: Colors.black),),
                      ],
                    ),
                    IconButton(onPressed: (){}, icon: Icon(Icons.arrow_forward_ios,color: Color(0xff06AB8D),))
                  ],
                ),
              ),
            ),
            SizedBox(height: 10,),
            Padding(
              padding: const EdgeInsets.only(left: 20,right: 20),
              child: Container(
                padding: EdgeInsets.symmetric(horizontal: 5),
                height: 65,
                decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(10)
                ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Row(
                      children: [
                        Icon(
                          Icons.sports_basketball,
                          size: 36,color: Color(0xff06AB8D),),
                        SizedBox(width: 0,),
                        Text("Live Score",
                          style: TextStyle(
                              fontSize: 14.5,color: Colors.black),),
                      ],
                    ),
                    IconButton(onPressed: (){}, icon: Icon(Icons.arrow_forward_ios,color: Color(0xff06AB8D)))
                  ],
                ),
              ),
            ),
            SizedBox(height: 20,),
            Container(
              padding: EdgeInsets.only(left: 20),
              child: Row(
                children: [
                  Text("ỨNG DỤNG",
                    style: TextStyle(
                        fontSize: 20,
                        fontWeight: FontWeight.bold
                    ),
                  ),
                ],
              ),
            ),
            SizedBox(height: 15,),
            Padding(
              padding: const EdgeInsets.only(left: 20,right: 20),
              child: Container(
                padding: EdgeInsets.symmetric(horizontal: 5),
                height: 65,
                decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(10)
                ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Row(
                      children: [
                        Icon(
                          Icons.font_download,
                          size: 36,color: Color(0xff06AB8D),),
                        SizedBox(width: 0,),
                        Text("Cỡ chữ",
                          style: TextStyle(
                              fontSize: 14.5,color: Colors.black),),
                      ],
                    ),
                    IconButton(onPressed: (){}, icon: Icon(Icons.arrow_forward_ios,color: Color(0xff06AB8D),))
                  ],
                ),
              ),
            ),
            SizedBox(height: 10,),
            Padding(
              padding: const EdgeInsets.only(left: 20,right: 20),
              child: Container(
                padding: EdgeInsets.symmetric(horizontal: 5),
                height: 65,
                decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(10)
                ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Row(
                      children: [
                        Icon(
                          Icons.bookmark_border,
                          size: 36,color: Color(0xff06AB8D),),
                        SizedBox(width: 0,),
                        Text("Chế độ ban đêm",
                          style: TextStyle(
                              fontSize: 14.5,color: Colors.black),),
                      ],
                    ),
                    SwitcherButton(
                      value: themeNotifier.isDark ? false : true,
                      offColor: Color(0xFFEAEAEA),
                      onColor: Color(0xff06AB8D),
                      onChange: (value){
                        themeNotifier.isDark
                            ? themeNotifier.isDark = false
                            : themeNotifier.isDark = true;
                      },
                    )
                  ],
                ),
              ),
            ),
            SizedBox(height: 10,),
            Padding(
              padding: const EdgeInsets.only(left: 20,right: 20),
              child: Container(
                padding: EdgeInsets.symmetric(horizontal: 5),
                height: 65,
                decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(10)
                ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Row(
                      children: [
                        Icon(
                          Icons.access_time,
                          size: 36,color: Color(0xff06AB8D),),
                        SizedBox(width: 0,),
                        Text("Tải hình ảnh bằng dữ liệu di động",
                          style: TextStyle(
                              fontSize: 14.5,color: Colors.black,),),
                      ],
                    ),

                    SwitcherButton(
                      // value: themeNotifier.isDark ? false : true,
                      offColor: Color(0xFFEAEAEA),
                      onColor: Color(0xff06AB8D),
                      onChange: (value){
                        // themeNotifier.isDark
                        //     ? themeNotifier.isDark = false
                        //     : themeNotifier.isDark = true;
                      },
                    ),
                  ],
                ),
              ),
            ),
            SizedBox(height: 25,),
            Padding(
              padding: const EdgeInsets.fromLTRB(19.0, 3.0, 19.0, 3.0),
              child: Card(
                elevation: 4,
                shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(5)
              ),
              child: Column(
                children: [
                  ListTile(
                    leading: Icon(Icons.facebook,size: 36,color: Color(0xff06AB8D)),
                    title: Text("Fanpage Đọc báo 24h"),
                  ),
                  _buildDivider(),
                  ListTile(
                    leading: Icon(Icons.warning_rounded,size: 36,color: Color(0xff06AB8D)),
                    title: Text("Thông tin liên hệ"),
          ),
                  _buildDivider(),
                  ListTile(
                    leading: Icon(Icons.autorenew_sharp,size: 36,color: Color(0xff06AB8D)),
                    title: Text("Kiểm tra cập nhập"),
                    trailing: Text("2.27.1")
          ),
                  _buildDivider(),
                  ListTile(
                    leading: Icon(Icons.newspaper_outlined,size: 36,color: Color(0xff06AB8D)),
                    title: Text("Điều khoảng sử dụng"),
          ),
                  _buildDivider(),
                  ListTile(
                    leading: Icon(Icons.reviews,size: 36,color: Color(0xff06AB8D)),
                    title: Text("Đánh giá ứng dụng"),
          ),
                  _buildDivider(),
                  ListTile(
                    leading: Icon(Icons.send,size: 36,color: Color(0xff06AB8D)),
                    title: Text("Gửi mail góp ý"),
          ),
                  _buildDivider(),
                  ListTile(
                    onTap: (){
                      Navigator.canPop(context)? Navigator.pop(context):null;
                    },
                    leading: Icon(Icons.logout,size: 36,color: Color(0xff06AB8D)),
                    title: Text("Logout"),
                  ),
                ],
              ),
              ),
            ),

          ],
        ),
      ),
    );
    }
    );
  }
}
Container _buildDivider(
    ){
  return Container(
    margin: EdgeInsets.symmetric(horizontal: 8),
    width: double.infinity,
    height: 1.0,
    color: Colors.grey.shade100,
  );
}


