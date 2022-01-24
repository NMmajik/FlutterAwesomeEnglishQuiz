import 'package:flutter/material.dart';
import 'package:flutter_toeic_quiz/constants.dart';

class BottomController extends StatelessWidget {
  BottomController({
    Key? key,
    required this.checkAnsPressed,
    required this.prePressed,
    required this.nextPressed,
  }) : super(key: key);

  Function()? nextPressed;
  Function()? prePressed;
  Function()? checkAnsPressed;

  @override
  Widget build(BuildContext context) {
    var brightness = MediaQuery.of(context).platformBrightness;
    bool isDarkMode = brightness == Brightness.dark;
    return Material(
      color: isDarkMode ? kSurfaceDarkColor : kBottomControllerBackgroundColor,
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 8.0, vertical: 2.0),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            IconButton(
              onPressed: prePressed,
              icon: Icon(
                Icons.arrow_back_ios_rounded,
                color: isDarkMode
                    ? kOnSurfaceDarkColorText
                    : kIconBottomControllerColor,
              ),
            ),
            IconButton(
              onPressed: () {},
              icon: Icon(
                Icons.favorite_border,
                color: isDarkMode
                    ? kOnSurfaceDarkColorText
                    : kIconBottomControllerColor,
              ),
            ),
            IconButton(
              onPressed: checkAnsPressed,
              icon: Icon(
                Icons.fact_check_outlined,
                color: isDarkMode
                    ? kOnSurfaceDarkColorText
                    : kIconBottomControllerColor,
              ),
            ),
            IconButton(
              onPressed: nextPressed,
              icon: Icon(
                Icons.arrow_forward_ios_rounded,
                color: isDarkMode
                    ? kOnSurfaceDarkColorText
                    : kIconBottomControllerColor,
              ),
            )
          ],
        ),
      ),
    );
  }
}
