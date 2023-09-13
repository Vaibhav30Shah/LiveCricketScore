import 'package:flutter/material.dart';
import 'package:food_delivery_app/pages/home/main_food_page.dart';
import 'package:food_delivery_app/pages/home/new_home_page_me.dart';
import 'package:food_delivery_app/pages/news/news.dart';
import 'package:food_delivery_app/pages/results/results_page.dart';
import 'package:food_delivery_app/pages/upcoming/upcoming_matches.dart';

class BottomNav extends StatefulWidget {
  const BottomNav({Key? key}) : super(key: key);

  @override
  State<BottomNav> createState() => _BottomNavState();
}

class _BottomNavState extends State<BottomNav> {
  int _currentIndex = 0;

  final List<Widget> _pages = [
    HomePage(),
    Upcoming(),
    Results(),
    NewsPage(),
  ];
  void _onItemTapped(int index) {
    setState(() {
      _currentIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body:_pages[_currentIndex],
      bottomNavigationBar: Container(
        decoration: BoxDecoration(
          color: Colors.green
        ),
        child: BottomNavigationBar(
          // backgroundColor: Colors.green,
          unselectedItemColor: Colors.white60,
          fixedColor: Colors.white,
          items: [
            BottomNavigationBarItem(
              backgroundColor: Color(0xFF006400),
              icon: Icon(Icons.sports_cricket, color: Colors.white,),
              label: 'Matches',
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.calendar_today, color: Colors.white,),
              label: 'Fixtures',
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.stars, color: Colors.white,),
              label: 'Results',
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.article, color: Colors.white,),
              label: 'News',
            ),
          ],
          currentIndex: _currentIndex,
          onTap: _onItemTapped,
        ),
      ),
    );
  }
}