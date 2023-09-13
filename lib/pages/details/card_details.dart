import 'package:flutter/material.dart';
import 'package:food_delivery_app/utils/colors.dart';
import 'package:food_delivery_app/utils/dimensions.dart';
import 'package:food_delivery_app/widgets/big_text.dart';

class CardDetail extends StatefulWidget {
  final String title;
  final String teamA;
  final String teamB;

  const CardDetail(
      {Key? key, required this.title, required this.teamA, required this.teamB})
      : super(key: key);

  @override
  State<CardDetail> createState() => _CardDetailState();
}

class _CardDetailState extends State<CardDetail> with TickerProviderStateMixin {

  @override
  Widget build(BuildContext context) {
    final List<String> outerTabs = ['Scorecard', 'Match Odds', 'Match Stats'];
    final Map<String, List<String>> innerTabs = {
      'Scorecard': [widget.teamA, widget.teamB],
      'Match Odds': ['1st Innings', '2nd Innings'],
      'Match Stats': [],
    };

    TabController tabController =
        TabController(length: outerTabs.length, vsync: this);
    TabController innerTab = TabController(length: 2, vsync: this);
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
      ),
      body: Padding(
        padding: const EdgeInsets.all(10),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            BigText(text: widget.title),
            Container(
              child: TabBar(
                //Scorecard, Match Odds, Match stats
                labelColor: AppColors.newMain,
                unselectedLabelColor: Colors.grey,
                indicatorColor: AppColors.newMain,
                controller: tabController,
                tabs: outerTabs.map((tab) => Tab(text: tab)).toList(),
              ),
            ),
            SizedBox(height: Dimensions.height10,),
            Expanded(
              child: TabBarView(
                //Scorecard, Match Odds, Match stats body
                controller: tabController,
                children: outerTabs.map((outerTab) {
                  final innerTabList = innerTabs[outerTab];
                  if (innerTabList != null && innerTabList.isNotEmpty) {
                    return Scaffold(
                      appBar: TabBar(
                          //inner tabbar->teamA,TeamB,etc
                            physics: ClampingScrollPhysics(),
                            // padding: EdgeInsets.all(10),
                            controller: innerTab,
                            dividerColor: Colors.white,
                            labelColor: AppColors.newMain,
                            unselectedLabelColor: Colors.grey,
                            tabs: innerTabList
                                .map((tab) => Padding(
                              padding: const EdgeInsets.all(13.0),
                              child: Tab(text: tab),
                            ))
                                .toList(),
                            indicatorSize: TabBarIndicatorSize.tab,
                            indicator: BoxDecoration(
                                borderRadius: BorderRadius.circular(20),
                                border: Border.all(width: 1, color: AppColors.newMain)
                            )
                        ),
                      body: TabBarView(
                        //innertabs body->tables and lists
                        controller: innerTab,
                        children: innerTabList.map((innerTab) {
                          return Container(
                            child: Center(
                              child: Text(
                                '$outerTab - $innerTab',
                                style: TextStyle(fontSize: 20),
                              ),
                            ),
                          );
                        }).toList(),
                      ),
                    );
                  } else {
                    return Container(
                      child: Center(
                        child: Text(
                          outerTab,
                          style: TextStyle(fontSize: 20),
                        ),
                      ),
                    );
                  }
                }).toList(),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
