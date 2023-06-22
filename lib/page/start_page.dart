import 'dart:convert';

import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import '../Notifications/notification_services.dart';
import '../routes.dart';
class StartPage extends StatefulWidget {
  const StartPage({Key? key}) : super(key: key);
  @override
  State<StartPage> createState() => _StartPageState();
}

class _StartPageState extends State<StartPage> {
  NotificationServices notificationServices = NotificationServices();


  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    notificationServices.requestNotificationPermission();
    notificationServices.firebaseInit(context);
    notificationServices.setupInteractMessage(context);
    notificationServices.isTokenRefresh();
    notificationServices.getDeviceToken().then((value){
      if (kDebugMode) {
        print('device token');
        print(value);
      }
    });
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
       child: Column(
         mainAxisAlignment: MainAxisAlignment.center,
         children: [
           TextButton(onPressed: (){
           },
               child: Text('')),
           Spacer(flex: 20,),
           Image.asset('images/mn1.png',
           width: 150,
             height: 150,
           ),
           Spacer(flex: 1,),
           Text('Tin Tức 24h',style: TextStyle(fontSize: MediaQuery.of(context).size.width/20, fontWeight: FontWeight.bold,color: Color(0xff06AB8D)),),
           // Spacer(flex: 5,),
           SizedBox(height: 100,),
        Container(
               width: 150,
               height: 50,
               child:  MaterialButton(
                 child: Text(
                     'Get Started'
                 ),
                 onPressed: ()
                 {
                   Navigator.pushNamed(context, Routes.login);
                   },
                 shape: RoundedRectangleBorder(
                   borderRadius: BorderRadius.circular(30),
                 ),
                 color: Colors.white,
                 textColor: Colors.teal,
               ),
               // decoration: BoxDecoration(
               //   color: Colors.black26.withOpacity(0.05),
               //   borderRadius: BorderRadius.circular(25),
               // ),
               // child: Center(child: Text('Get Started',style: TextStyle(color: Color(0xff06AB8D),fontWeight: FontWeight.bold,fontSize: 16),)),
             ),
           Spacer(flex: 20,),
         ],
       ),
      )
    );
  }
}
