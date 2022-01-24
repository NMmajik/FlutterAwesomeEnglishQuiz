import 'package:flutter/material.dart';

class MyOutlineIconButton extends StatelessWidget {
  MyOutlineIconButton({
    Key? key,
    this.color = Colors.blue,
    required this.onTap,
  }) : super(key: key);

  Color color;
  Function()? onTap;

  @override
  Widget build(BuildContext context) {
    return Ink(
      decoration: BoxDecoration(
        border: Border.all(color: color, width: 2.0),
        color: Colors.transparent,
        shape: BoxShape.circle,
      ),
      child: InkWell(
        //This keeps the splash effect within the circle
        borderRadius:
            BorderRadius.circular(1000.0), //Something large to ensure a circle
        onTap: onTap,
        child: Padding(
          padding: EdgeInsets.all(10.0),
          child: Icon(
            Icons.download,
            size: 20.0,
            color: color,
          ),
        ),
      ),
    );
  }
}
