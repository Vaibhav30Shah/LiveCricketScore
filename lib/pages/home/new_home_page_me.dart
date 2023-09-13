import 'package:flutter/material.dart';
import 'dart:math' as math;
import '../../utils/colors.dart';
import '../news/news.dart';
import '../results/results_page.dart';
import '../upcoming/upcoming_matches.dart';
import 'food_page_body.dart';
import 'main_food_page.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xFF000080),
      appBar: AppBar(
        backgroundColor: Color(0xFF000080),
        title: Center(child: const Text('CRICKET LIVE SCORE', style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold),)),
      ),
      body:
      FoodPageBody(),

    );
  }
}
