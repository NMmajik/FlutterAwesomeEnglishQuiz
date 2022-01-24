import 'package:flutter/material.dart';
import 'package:flutter_toeic_quiz/constants.dart';

class RoundedButton extends StatelessWidget {
  RoundedButton(
      {this.colour = kPrimaryHomeScreenColor,
      required this.title,
      required this.onPressed});
  final Color colour;
  final String title;
  final VoidCallback onPressed;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 8.0),
      child: ElevatedButton(
        style: ButtonStyle(
          elevation: MaterialStateProperty.all(5.0),
          backgroundColor: MaterialStateProperty.all(colour),
          shape: MaterialStateProperty.all<RoundedRectangleBorder>(
            RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(18.0),
            ),
          ),
        ),
        child: Text(title),
        onPressed: onPressed,
      ),
    );
  }
}
