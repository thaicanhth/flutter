import 'package:flutter/material.dart';
import 'shared/listitem.dart';


Widget listWidget(ListItem item)
{
  return Card(
    elevation: 2.0,
    margin: EdgeInsets.only(bottom: 20.0),
    child: Padding(
      padding: EdgeInsets.all(8.0),
      child: Row(
        children: [
          Container(
            width: 80,
            height: 80,
            decoration: BoxDecoration(
              image: DecorationImage(
                image: NetworkImage(item.imgUrl),
                  fit: BoxFit.cover
              ),
              borderRadius: BorderRadius.circular(8),
            ),
          ),
          SizedBox(
            width: 5,
          ),
          // Expanded(child: )
        ],
      ),
    ),
  );
}
