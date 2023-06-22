import 'package:flutter/material.dart';
import 'package:flutter/painting.dart';
import 'package:flutter/cupertino.dart';
TextStyle titleFont=
    const TextStyle(fontWeight: FontWeight.w600, fontSize:13);
TextStyle infoFont=
    const TextStyle(fontWeight: FontWeight.w300, fontSize:14);
Widget additionalInofrmation(
String wind, String humidity,String pressure,String feels_like){
  return Container(
    width: double.infinity,
    padding: EdgeInsets.all(18),
    child: Column(
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text("Wind",
                style: titleFont,
                ),
                SizedBox(height: 10,),
                Text("Pressure",
                  style: titleFont,
                ),
                // SizedBox(height: 10,),
                // Text("Temp Min",
                //   style: titleFont,
                // ),
                // SizedBox(height: 10,),
                // Text("Sea Level",
                //   style: titleFont,
                // ),
              ],
            ),
            Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text("$wind",
                  style:infoFont,
                ),
                SizedBox(height: 10,),
                Text("$pressure",
                  style: infoFont,
                ),
                // SizedBox(height: 10,),
                // Text("$temp_min",
                //   style: infoFont,
                // ),
                // SizedBox(height: 10,),
                // Text("$sea_level",
                //   style: infoFont,
                // ),
              ],
            ),
            Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text("Humidity",
                  style: titleFont,
                ),
                SizedBox(height: 10,),
                Text("Feels Like",
                  style: titleFont,
                ),
                // SizedBox(height: 10,),
                // Text("Temp Max",
                //   style: titleFont,
                // ),
                // SizedBox(height: 10,),
                // Text("Grnd Level",
                //   style: titleFont,
                // ),
              ],
            ),
            Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text("$humidity",
                  style:infoFont,
                ),
                SizedBox(height: 10,),
                Text("$feels_like",
                  style: infoFont,
                ),
                // SizedBox(height: 10,),
                // Text("$temp_max",
                //   style: infoFont,
                // ),
                // SizedBox(height: 10,),
                // Text("$grnd_level",
                //   style: infoFont,
                // ),
              ],
            ),
          ],
        ),
      ],
    ),
  );
}