import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_toeic_quiz/constants.dart';
import 'package:flutter_toeic_quiz/screens/favorite/favorite_screen.dart';
import 'package:flutter_toeic_quiz/screens/more/more_screen.dart';
import 'package:flutter_toeic_quiz/screens/store/store_screen.dart';

import 'database/local/book_hive_api.dart';
import 'database/local/test_hive_api.dart';
import 'screens/home/home_screen.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  Firebase.initializeApp();
  await BookHiveApi.instance.initHive();
  await BookHiveApi.instance.openBox();
  await TestHiveApi.instance.openBox();
  runApp(const QuizApp());
}

class QuizApp extends StatefulWidget {
  const QuizApp({Key? key}) : super(key: key);

  @override
  State<QuizApp> createState() => _QuizAppState();
}

class _QuizAppState extends State<QuizApp> {
  int _currentIndex = 0;
  late PageController _pageController;
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _pageController = PageController();
  }

  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();
    _pageController.dispose();
    BookHiveApi.instance.closeHive();
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: kLightThemeData,
      darkTheme: kDarkThemeData,
      home: Scaffold(
        body: SizedBox.expand(
          child: PageView(
            physics: NeverScrollableScrollPhysics(),
            controller: _pageController,
            onPageChanged: (index) {
              setState(() => _currentIndex = index);
            },
            children: <Widget>[
              HomeScreen(),
              StoreScreen(),
              FavoriteScreen(),
              MoreScreen(),
            ],
          ),
        ),
        bottomNavigationBar: BottomNavigationBar(
          currentIndex: _currentIndex,
          onTap: (index) {
            setState(() => _currentIndex = index);
            _pageController.jumpToPage(index);
          },
          items: <BottomNavigationBarItem>[
            BottomNavigationBarItem(
              label: 'Books',
              //activeColor: kPrimaryHomeScreenColor,
              icon: Icon(Icons.my_library_books_sharp),
            ),
            BottomNavigationBarItem(
              label: 'Store',
              //activeColor: Color(0xffeaac8b),
              icon: Icon(Icons.shopping_cart_outlined),
            ),
            BottomNavigationBarItem(
              label: 'Favorite',
              //activeColor: Color(0xff6d597a),
              icon: Icon(Icons.favorite),
            ),
            BottomNavigationBarItem(
              label: 'More',
              //activeColor: Color(0xff355070),
              icon: Icon(Icons.storage_rounded),
            ),
          ],
        ),
      ),
    );
  }
}
