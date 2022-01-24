import 'package:flutter/material.dart';

class OutlineIconButton extends StatelessWidget {
  OutlineIconButton({
    Key? key,
    required this.iconData,
    required this.title,
    this.color = Colors.blue,
    required this.onPressed,
  }) : super(key: key);

  final IconData iconData;
  final String title;
  Function()? onPressed;
  Color color;

  @override
  Widget build(BuildContext context) {
    return OutlinedButton.icon(
      onPressed: onPressed,
      icon: Icon(
        iconData,
        size: 20.0,
        color: color,
      ),
      label: Text(
        title,
        style: TextStyle(color: color, fontSize: 12.0),
      ),
      style: OutlinedButton.styleFrom(
        side: BorderSide(width: 1.0, color: color),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(10.0),
        ),
      ),
    );
  }
}
