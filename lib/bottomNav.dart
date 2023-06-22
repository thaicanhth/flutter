// import 'package:flutter/material.dart';
// import 'package:project_flutter2/page/canhan_page.dart';
// import 'package:project_flutter2/page/home_page.dart';
// import 'package:project_flutter2/page/tienich_page.dart';
// import 'package:project_flutter2/page/whatch_page.dart';
//
// // import 'shared/NavBaritem.dart';
//
// class BottomNav extends StatefulWidget {
//   const BottomNav({Key? key}) : super(key: key);
//
//   @override
//   State<BottomNav> createState() => _BottomNavState();
// }
//
// class _BottomNavState extends State<BottomNav> {
//   int _currentIndex = 0;
//
//   void _onItemTapped(int index){
//     setState(() {
//       _currentIndex = index;
//     });
//   }
//   List<Widget> _current = [
//     HomePage(),
//     WhatchPage(),
//     tienichPage(),
//     CanhanPage(),
//   ];
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       bottomNavigationBar: BottomNavigationBar(
//         currentIndex: _currentIndex,
//         showSelectedLabels: false,
//         showUnselectedLabels: false,
//         type: BottomNavigationBarType.fixed,
//         onTap: (value){
//           setState(() {
//             _currentIndex = value;
//           });
//         },
//         unselectedItemColor: Color(0xFF5E5E5E),
//         selectedItemColor: Color(0xff06AB8D),
//         items: const [
//           BottomNavigationBarItem(
//               icon: Icon(Icons.newspaper_sharp),
//               label:'Tin tức'
//           ),
//           BottomNavigationBarItem(
//               icon: Icon(Icons.video_collection_rounded),
//               label:'Video'
//           ),
//           BottomNavigationBarItem(
//               icon: Icon(Icons.keyboard_command_key),
//               label:'Tiện ích'
//           ),
//           BottomNavigationBarItem(
//               icon: Icon(Icons.account_circle_sharp),
//               label:'Cá nhân'
//           ),
//         ],
//       ),
//       body: _current[0],
//     );
//   }
// }
// // class NavBarItem {
// //   final String icon;
// //   final String activeIcon;
// //   final String title;
// //   NavBarItem({required this.icon, required this.activeIcon, required this.title});
// // }
//
// // List<NavBarItem> _navBarList =[
// //  // NavBarItem(
// //  //     icon: "assets/new.svg",
// //  //     activeIcon: "assets/new.svg",
// //  //     title: "New",
// //  // ),
// //   NavBarItem(
// //       icon: "assets/yt.svg",
// //       activeIcon: "assets/yt.svg",
// //       title: "video",
// //   ),
// //   NavBarItem(
// //       icon: "assets/tn.svg",
// //       activeIcon: "assets/tn.svg",
// //       title: "tien ich",
// //   ),
// //   NavBarItem(
// //       icon: "assets/cn.svg",
// //       activeIcon: "assets/cn.svg",
// //       title: "ca nhan",
// //   ),
// // ];