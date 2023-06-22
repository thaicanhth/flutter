import 'package:firebase_database/firebase_database.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:project_flutter2/FeedScreen.dart';
import 'package:project_flutter2/page/popular_tab_page.dart';
import 'package:project_flutter2/page/recent_tab_page.dart';
import 'package:project_flutter2/page/sport_tab_page.dart';
import 'package:project_flutter2/page/trending_tab_page.dart';
import 'package:project_flutter2/routes.dart';
import 'package:project_flutter2/widgets/mainscreen.dart';
import 'package:project_flutter2/widgets/secondary.dart';
import 'package:project_flutter2/widgets/world.dart';

import '../widgets/insert.dart';

class HomePage extends StatefulWidget {
  // const HomePage({Key? key}) : super(key: key);
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {

  List<String> url = [
    "https://i1-sohoa.vnecdn.net/2022/12/12/image001-8574-1670836070.png?w=1020&h=0&q=100&dpr=1&fit=crop&s=k2am63b0YSKBleyg7u1tHA",
    "https://i1-sohoa.vnecdn.net/2022/12/12/image001-8574-1670836070.png?w=1020&h=0&q=100&dpr=1&fit=crop&s=k2am63b0YSKBleyg7u1tHA",
    "https://i1-sohoa.vnecdn.net/2022/12/12/image001-8574-1670836070.png?w=1020&h=0&q=100&dpr=1&fit=crop&s=k2am63b0YSKBleyg7u1tHA",
    "https://i1-sohoa.vnecdn.net/2022/12/12/image001-8574-1670836070.png?w=1020&h=0&q=100&dpr=1&fit=crop&s=k2am63b0YSKBleyg7u1tHA",
    "https://i1-sohoa.vnecdn.net/2022/12/12/image001-8574-1670836070.png?w=1020&h=0&q=100&dpr=1&fit=crop&s=k2am63b0YSKBleyg7u1tHA"
  ];
  @override
  Widget build(BuildContext context) {
    DatabaseReference db_Ref =
    FirebaseDatabase.instance.ref().child('contacts');
    return Scaffold(
      appBar: AppBar(
        systemOverlayStyle: SystemUiOverlayStyle(statusBarColor: Colors.teal),
        toolbarHeight: 80,
        automaticallyImplyLeading: false,
        centerTitle: true,
        elevation: 0,
        backgroundColor: Color(0xff06AB8D),
        leading: Padding(
          padding: const EdgeInsets.only(top: 5),
          child: IconButton(
            icon:  FloatingActionButton(
                backgroundColor: Color(0xff06AB8D),
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (_) => ccreate(),
                    ),
                  );
                },
                child: Icon(Icons.menu, size: 38,)),
            onPressed: () {},
          ),
        ),
        actions: [
          // Spacer(flex: 10),
          Row(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              Padding(
                padding: const EdgeInsets.only(top: 5,),
                child: GestureDetector(
                  child: Container(
                    width:  MediaQuery.of(context).size.width / 1.1-15,
                    // width:  MediaQuery.of(context).size.width / 1.1-5,
                    // width: 380,
                    // width: MediaQuery.of(context).size.width,
                    child: OutlinedButton.icon(onPressed: (){
                      Navigator.pushNamed(context, Routes.Search);
                    },
                        style: TextButton.styleFrom(
                            minimumSize: Size(500,50
                            ),
                            primary: Colors.white,
                            // elevation: 0,
                            alignment: Alignment.centerLeft,
                            shadowColor: Colors.white,
                            backgroundColor: Colors.white.withOpacity(0.2),
                            shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(10)
                            )
                        ),
                        icon:  Icon(Icons.search,size: 25,),
                        label: Text('Tìm kiếm...',style: TextStyle(fontSize: 19),)),
                    alignment: Alignment.centerLeft,
                  ),
                ),
              ),
            ],
          ),
          // Spacer(flex: 1),
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          children: [
            DefaultTabController(length: 4, child: Expanded(
              child: Column(
                children: [
                  const TabBar(
                      indicatorColor: Color(0xff06AB8D),
                      indicatorWeight: 3,
                      unselectedLabelColor: Colors.black,
                      isScrollable: true,
                      labelStyle: TextStyle(fontSize: 19),
                      labelColor: Color(0xff06AB8D),
                      tabs: [
                        Tab(
                          text: "Nổi bật",
                        ),
                        Tab(
                          text: "Thời sự",
                        ),
                        Tab(
                          text: "Thế giới",
                        ),
                        Tab(
                          text: "Thể thao",
                        ),
                      ]
                  ),
                  SizedBox(
                    height: 5,
                  ),
                  Expanded(
                    child: Container(
                      // height: 500,
                      child: TabBarView(
                        children: [
                          // PopularTabPage(),
                          // TrendingTabPage(),
                          SecondaryCard(),
                          MainScreen(),
                          World(),
                          FeedScreen(),

                          // RecentTabView(),
                          // SportTapPage(),
                        ],
                      ),
                    ),
                  )
                ],
              ),
            ),
            ),
          ],
        ),
      ),
    );
  }
}