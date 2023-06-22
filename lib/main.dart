import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/material.dart';
import 'package:project_flutter2/CommentSection.dart';
import 'package:project_flutter2/cloud_firestore.dart';
import 'package:project_flutter2/helpers/ThemeModal.dart';
import 'package:project_flutter2/page/login.dart';
import 'package:project_flutter2/page/navibottum.dart';
import 'package:project_flutter2/page/register.dart';
import 'package:project_flutter2/page/start_page.dart';
import 'package:provider/provider.dart';
import 'package:firebase_app_check/firebase_app_check.dart';


import '../routes.dart';

@pragma('vm:entry-point')
Future<void> _firebaseMessagingBackgroundHandler(RemoteMessage message)async {
  await Firebase.initializeApp();
}
Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  await FirebaseAppCheck.instance.activate();
  FirebaseMessaging.onBackgroundMessage(_firebaseMessagingBackgroundHandler);
  runApp(MyApp());
}


class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (_) => ThemeModal(),
      child: Consumer(builder: (context,ThemeModal themeModal,child){
      return MaterialApp(
        debugShowCheckedModeBanner: false,
        theme: themeModal.isDark ? ThemeData.dark() : ThemeData.light(),
        // home: StartPage(),
        home: StreamBuilder<User?>(
          stream: FirebaseAuth.instance.authStateChanges(),
          builder: (context, snapshot){
            if(snapshot.connectionState == ConnectionState.waiting){
              return Center(child: CircularProgressIndicator(),);
            }
            else if(snapshot.hasError){
              return Center(child: Text("Something Went wrong!"),);
            }
            if (snapshot.hasData){
              return StartPage();
            } else{
              return naviBottum();
            }
          },
        ),
        routes:{
              '/start': (context) => StartPage(),
              '/login': (context) => LoginPage(),
              '/signup': (context) => Register(),
              '/comments': (context) => CommentSection(),
              '/Search': (context) => CloudFirestoreSearch(),
              '/add': (context) => CloudFirestoreSearch(),

        },
      );
    }),
    );
  }
}
