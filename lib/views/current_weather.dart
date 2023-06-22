import 'package:flutter/material.dart';
import 'package:project_flutter2/views/additonal_information.dart';
Widget currentWeather(IconData icon, String temp, String location){
  return Center(
    child: ClipRRect(
      borderRadius: BorderRadius.circular(15),
      child: Container(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            SizedBox(height: 10,),
            Text("Đà Nẵng",style: TextStyle(
                fontSize: 20,color: Colors.black
            ),),
            Icon(
              icon,
              color: Colors.orange,
              size: 64,
            ),
            Text(
              "$temp",
              style: TextStyle(
                  fontSize: 46,color: Colors.black
              ),
            ),
            SizedBox(height: 0,),
            Text("$location",
              style: TextStyle(
                color: Colors.black,fontSize: 20
              ),
            ),
            SizedBox(height: 40,),
            // Text(
            //   "Additional Information",
            //   style: TextStyle(
            //     fontSize: 24,
            //     color: Color(0xdd212121),
            //     fontWeight: FontWeight.bold,
            //   ),
            // ),
            // // Divider(),tạo đường kẽ
            // SizedBox(
            //   height: 20,
            // ),
            // additionalInofrmation("24", "2", "1014", "24.6"),
          ],
        ),
      ),
    ),
  );
}
