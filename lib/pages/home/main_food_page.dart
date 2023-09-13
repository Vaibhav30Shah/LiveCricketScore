import 'package:flutter/material.dart';
import 'package:food_delivery_app/pages/home/food_page_body.dart';
import 'package:food_delivery_app/pages/news/news.dart';
import 'package:food_delivery_app/pages/results/results_page.dart';
import 'package:food_delivery_app/pages/upcoming/upcoming_matches.dart';
import 'package:food_delivery_app/utils/colors.dart';
import 'package:food_delivery_app/utils/dimensions.dart';
import 'package:food_delivery_app/widgets/big_text.dart';
import 'package:food_delivery_app/widgets/small_text.dart';

class MainFoodPage extends StatefulWidget {
  const MainFoodPage({Key? key}) : super(key: key);

  @override
  State<MainFoodPage> createState() => _MainFoodPageState();
}

class _MainFoodPageState extends State<MainFoodPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: Drawer(
        child: ListView(
          children: [
            DrawerHeader(
              decoration: BoxDecoration(
                color: AppColors.newMain,
              ),
              child: Text(
                'Menu',
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 24,
                ),
              ),
            ),
            ListTile(
              leading: Icon(Icons.home),
              title: Text('Home'),
              onTap: () {
                Navigator.push(context, MaterialPageRoute(builder: (context)=>MainFoodPage())); // Close the drawer
              },
            ),
            ListTile(
              leading: Icon(Icons.event),
              title: Text('Upcoming'),
              onTap: () {
                Navigator.push(context, MaterialPageRoute(builder: (context)=>Upcoming()));
              },
            ),
            ListTile(
              leading: Icon(Icons.list),
              title: Text('Results'),
              onTap: () {
                Navigator.push(context, MaterialPageRoute(builder: (context)=>Results()));
              },
            ),
            ListTile(
              leading: Icon(Icons.article),
              title: Text('News'),
              onTap: () {
                Navigator.push(context, MaterialPageRoute(builder: (context)=>NewsPage()));
              },
            ),
          ],
        ),
      ),
      backgroundColor: Colors.grey[200],
      body:
      Container(
        decoration: BoxDecoration(
            // gradient: LinearGradient(
            //     colors: [Colors.cyan, Colors.blue, Colors.greenAccent,],
            //     begin: Alignment.topLeft,
            //     end: Alignment.bottomRight
            // )
            ),
        child: Column(
          children: [
            Container(
              margin: EdgeInsets.only(
                  top: Dimensions.height70, bottom: Dimensions.height15),
              padding: EdgeInsets.only(
                left: Dimensions.height20,
                right: Dimensions.height20,
              ),
              child: Container(
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Builder(builder: (context) {
                          return IconButton(
                            icon: Icon(Icons.menu),
                            onPressed: () {
                              // Open the sidebar when the menu button is clicked
                              Scaffold.of(context).openDrawer();
                            },
                          );
                        }),
                        SizedBox(
                          width: Dimensions.width20,
                        ),
                        BigText(
                          text: 'LiveScore',
                          color: AppColors.newMain,
                        ),
                        // Row(
                        //   mainAxisAlignment: MainAxisAlignment.center,
                        //   children: [
                        //     SmallText(text: 'Bhuj', color: Colors.white,),
                        //     Icon(Icons.arrow_drop_down_rounded, color: Colors.white,),
                        //   ],
                        // ),
                      ],
                    ),
                    Container(
                      width: 45,
                      height: 45,
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(15),
                          color: AppColors.newMain),
                      child: Icon(
                        Icons.search,
                        color: Colors.white,
                      ),
                    )
                  ],
                ),
              ),
            ),
            Expanded(child: FoodPageBody()),
          ],
        ),
      ),
    );
  }
}
