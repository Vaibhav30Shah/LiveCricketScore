import 'package:flutter/material.dart';
import 'package:food_delivery_app/pages/bottom_nav_bar.dart';
import 'package:food_delivery_app/pages/details/more_details.dart';
import 'package:food_delivery_app/pages/home/home_page_new.dart';
import 'package:food_delivery_app/pages/home/main_food_page.dart';
import 'package:food_delivery_app/pages/home/new_home_page_me.dart';
import 'package:food_delivery_app/pages/upcoming/upcoming_matches.dart';
import 'package:food_delivery_app/utils/colors.dart';
import 'package:food_delivery_app/utils/provider_file.dart';
import 'package:get/get_navigation/get_navigation.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(ChangeNotifierProvider(create: (context)=>LiveMatchDataProvider(),child: MyApp()));
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'CricScore',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: AppColors.mainColor),
        useMaterial3: true,
        backgroundColor: Colors.blue,
      ),
      home: BottomNav(),
    );
  }
}
