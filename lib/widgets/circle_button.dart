import 'package:flutter/material.dart';
import 'package:project_flutter2/constants.dart';
class CircleButton extends StatelessWidget {
  const CircleButton({Key? key, required this.icon, required this.onTap}) : super(key: key);
  final IconData icon;
  final  Function()? onTap;
  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      borderRadius: BorderRadius.circular(25),
      child: Container(
        width: 50,
        height: 50,
        decoration: BoxDecoration(
          shape: BoxShape.circle,
        ),
        child: Card(
          elevation: 1,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(25),
          ),
          child: Icon(
            icon,
            color: kGrey2,
            size: 15,
          ),
        ),
      ),
    );
  }
}
