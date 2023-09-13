import 'dart:async';
import 'dart:convert';
import 'dart:developer';

import 'package:dots_indicator/dots_indicator.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:food_delivery_app/models/upcoming_model.dart';
import 'package:food_delivery_app/pages/details/live_match_details.dart';
import 'package:food_delivery_app/utils/colors.dart';
import 'package:food_delivery_app/utils/dimensions.dart';
import 'package:food_delivery_app/utils/provider_file.dart';
import 'package:food_delivery_app/utils/strings.dart';
import 'package:food_delivery_app/widgets/big_text.dart';
import 'package:food_delivery_app/widgets/icon_and_text_widget.dart';
import 'package:food_delivery_app/widgets/image_and_text_widget.dart';
import 'package:food_delivery_app/widgets/skeleton_widget.dart';
import 'package:food_delivery_app/widgets/small_text.dart';
import 'package:http/http.dart' as http;
import 'package:food_delivery_app/models/match_model.dart';
import 'package:food_delivery_app/widgets/match_list_widget.dart';
import 'package:provider/provider.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../../models/genmodels/genModel.dart';
import '../../models/livelineget_model.dart';
import '../../models/match_result_model.dart';
import '../../widgets/ResultWidget.dart';
import '../../widgets/upcoming_widget.dart';

class FoodPageBody extends StatefulWidget {
  const FoodPageBody({Key? key}) : super(key: key);

  @override
  State<FoodPageBody> createState() => _FoodPageBodyState();
}

class _FoodPageBodyState extends State<FoodPageBody> {
  LiveLineMatchModel? liveMatches2;
  String url = AppStrings.imageUrl;
  PageController controller = PageController(viewportFraction: 0.9);
  var _currPageValue = 0.0;
  var height = Dimensions.pageViewContainer;
  double scaleFactor = 0.8;
  List<MatchResult> cricketMatches = [];
  Map match = {};

  final Map flags = {
    'India': 'bg_flag_india.png',
    'India W': 'bg_flag_india.png',
    'Australia': 'bg_flag_australia.png',
    'Australia W': 'bg_flag_australia.png',
    'Pakistan': 'bg_flag_pakistan.png',
    'Pakistan W': 'bg_flag_pakistan.png',
    'Windies': 'windies.jpg',
    'Windies W': 'windies.jpg',
    'Ireland': 'irelandpng.png',
    'Bangladesh': 'bg_flag_bangladesh.png',
    'Bangladesh W': 'bg_flag_bangladesh.png',
    'Sri Lanka': 'bg_flag_sri_lanka.png',
    'New Zealand': 'bg_flag_new_zealand.png',
    'Netherlands': 'netherlands.png',
    'England': 'england.png',
    'England W': 'england.png',
    'Afghanistan': 'afg.png',
    'Afghanistan W': 'afg.png',
    'Scotland': 'scotland.jpg',
    'Scotland W': 'scotland.jpg',
    'Oman': 'oman.jpg',
    'Oman W': 'oman.jpg',
    'Warwickshire': 'warwick.png',
    'Essex': 'essex.png',
    'Surrey': 'surrey.png',
    'Lancashire': 'lancashire.png',
    'Lyca Kovai Kings': 'lyca.png',
    'Dindigul': 'dindigul.jpg',
    'Nellai Royal Kings': 'nellai.png',
    'Madurai Panthers': 'madurai.jpg',
    'Somerest': 'somerest.png',
    'Nottinghamshire': 'notting.png',
    'Hampshire': 'hampshire.png',
    'Worcestershire': 'worcest.png',
  };
  int _currentPageIndex = 0;

  @override
  void initState() {
    super.initState();
    loadData1();
    loadData2();
    // fetchData();
    // fetchUpcomingData();
    loadLiveData();
    fetchLiveData();
    controller.addListener(() {
      setState(() {
        _currPageValue = controller.page!;
      });
    });
  }

  @override
  void dispose() {
    super.dispose();
    controller.dispose();
  }

  MatchResult? matchResult;
  List<MatchResult> matchResultNew = [];

  Future<List<MatchResult>> fetchData() async {
    var url = Uri.parse('http://cricpro.cricnet.co.in/api/values/MatchResults');
    var response = await http.post(url, body: {"start": "1", "end": "15"});

    if (response.statusCode == 200) {
      var jsonData = jsonDecode(response.body);

      final matchResult1 = genModel.fromJson(jsonData);

      setState(() {
        // match=jsonData;
      });

      // matchResultNew = matchResult1.allMatch;
      matchResultNew = matchResult1.allMatch
          .map<MatchResult>(
              (data) => MatchResult.fromJson(Map<String, dynamic>.from(data)))
          .toList();

      print("Match result : $matchResultNew");

      return matchResultNew;
    } else {
      throw Exception('Failed to fetch data');
    }
  }

  UpcomingMatches? upcomingMatches;
  List<UpcomingMatches> upcomingMatchesNew = [];

  Future<List<UpcomingMatches>> fetchUpcomingData() async {
    var url =
        Uri.parse('http://cricpro.cricnet.co.in/api/values/upcomingMatches');
    var response = await http.get(url);

    if (response.statusCode == 200) {
      var jsonData = jsonDecode(response.body);

      final up = genModel.fromJson(jsonData);

      setState(() {
        // match=jsonData;
      });

      // matchResultNew = matchResult1.allMatch;
      upcomingMatchesNew = up.allMatch
          .map<UpcomingMatches>((data) =>
              UpcomingMatches.fromJson(Map<String, dynamic>.from(data)))
          .toList();

      print("Upcoming result : $upcomingMatchesNew");

      return upcomingMatchesNew;
    } else {
      throw Exception('Failed to fetch data');
    }
  }

  LiveLineMatchModel? liveMatches;
  List<LiveLineMatchModel> liveMatchesNew = [];

  Future<List<LiveLineMatchModel>> fetchLiveData() async {
    var url = Uri.parse('http://cricpro.cricnet.co.in/api/values/LiveLine');
    var response = await http.get(url);

    if (response.statusCode == 200) {
      try {
        dynamic jsonData = json.decode(response.body);
        log(jsonData.toString());

        // final up = LiveLineMatchModel.fromJson(jsonData);
// hot restart
        setState(() {
          // match=jsonData;
        });
        // print(up);

        liveMatchesNew = List<LiveLineMatchModel>.from(
            jsonData.map((v) => LiveLineMatchModel.fromJson(v)).toList());
        // print(gameMatches);
        // // matchResultNew = matchResult1.allMatch;

        // liveMatchesNew = jsonData.jsonruns
        //     .map<LiveLineMatchModel>((data) =>
        //     LiveLineMatchModel.fromJson(Map<String, dynamic>.from(data)))
        //     .toList();

        print("Upcoming live : $liveMatchesNew");
      } catch (e) {
        log('$e');
      }
      return liveMatchesNew;
    } else {
      throw Exception('Failed to fetch data');
    }
  }

  List<UpcomingMatches> upcomingMatchesData = [];
  List<MatchResult> resultMatchesData = [];

  void loadData1() {
    fetchUpcomingData().then((data) {
      if (mounted) {
        setState(() {
          upcomingMatchesData = data;
        });
      }
    }).catchError((error) {
      print('Error: $error');
    });
  }

  void loadData2() {
    fetchData().then((data) {
      if (mounted) {
        setState(() {
          resultMatchesData = data;
        });
      }
    }).catchError((error) {
      print('Error: $error');
    });
  }

  List<LiveLineMatchModel> liveMatchesData = [];

  void loadLiveData() {
    if (mounted) {
      Timer.periodic(Duration(seconds: 20), (timer) {
        fetchLiveData().then((data) {
          if (mounted) {
            setState(() {
              liveMatchesData = data;
            });
          }
        }).catchError((error) {
          print('Error: $error');
        });
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    print('height ' + MediaQuery.of(context).size.height.toString());
    print('width ' + MediaQuery.of(context).size.width.toString());
    return Container(
      decoration: BoxDecoration(
        gradient: LinearGradient(
          colors: [Color(0xFF000080), Color(0xFF006400)],
          // Define your colors here
          begin: Alignment.topCenter,
          end: Alignment.bottomCenter,
        ),
      ),
      child: ListView(
        // mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        // mainAxisSize: MainAxisSize.max,
        children: [
          //Live text
          Container(
            margin: EdgeInsets.only(left: Dimensions.width20),
            child: Row(
              children: [BigText(text: 'LIVE', color: Colors.white)],
            ),
          ),
          if (liveMatchesNew.length != 0) Consumer<LiveMatchDataProvider>(
            builder:(context, provider, child) { return ListView.builder(
                    physics: NeverScrollableScrollPhysics(),
                    shrinkWrap: true,
                    // itemCount: snapshot.data!.length,
                    itemCount: liveMatchesNew.length,
                    itemBuilder: (context, position) {
                      return MatchesWidget(
                        match: liveMatchesNew[position],
                      );
                    },
                  );},
          ) else Text("Loading..."),
          SizedBox(
            height: Dimensions.height30,
          ),
          Container(
            margin: EdgeInsets.only(left: Dimensions.width20),
            child: Row(
              children: [
                BigText(text: 'UPCOMING MATCHES', color: Colors.white)
              ],
            ),
          ),
          upcomingMatchesData.length != 0
              ? ListView.builder(
                  physics: NeverScrollableScrollPhysics(),
                  shrinkWrap: true,
                  itemCount: 4,
                  itemBuilder: (context, position) {
                    return UpcomingMatchesWidget(
                      match: upcomingMatchesData[position],
                    );
                  },
                )
              : Text("Loading..."),
          SizedBox(
            height: Dimensions.height15,
          ),
          Container(
            margin: EdgeInsets.only(left: Dimensions.width20),
            child: Row(
              children: [
                BigText(text: 'FINISHED MATCHES', color: Colors.white)
              ],
            ),
          ),
          resultMatchesData.length != 0
              ? ListView.builder(
                  physics: NeverScrollableScrollPhysics(),
                  shrinkWrap: true,
                  itemCount: 4,
                  itemBuilder: (context, position) {
                    return ResultWidget(
                      match: resultMatchesData[position],
                    );
                  },
                )
              : Text("Loading..."),
        ],
      ),
    );
  }

  Widget _buildPageItem(LiveLineMatchModel match, int index) {
    Matrix4 matrix = new Matrix4.identity();
    if (index == _currPageValue.floor()) {
      var currScale = 1 - (_currPageValue - index) * (1 - scaleFactor);
      var currTrans = height * (1 - currScale) / 2;
      matrix = Matrix4.diagonal3Values(1, currScale, 1)
        ..setTranslationRaw(0, currTrans, 0);
    } else if (index == _currPageValue.floor() + 1) {
      var currScale =
          scaleFactor + (_currPageValue - index + 1) * (1 - scaleFactor);
      var currTrans = height * (1 - currScale) / 2;
      matrix = Matrix4.diagonal3Values(1, currScale, 1);
      matrix = Matrix4.diagonal3Values(1, currScale, 1)
        ..setTranslationRaw(0, currTrans, 0);
      ;
    } else if (index == _currPageValue.floor() - 1) {
      var currScale = 1 - (_currPageValue - index) * (1 - scaleFactor);
      var currTrans = height * (1 - currScale) / 2;
      matrix = Matrix4.diagonal3Values(1, currScale, 1);
      matrix = Matrix4.diagonal3Values(1, currScale, 1)
        ..setTranslationRaw(0, currTrans, 0);
    } else {
      var currScale = 0.8;
      matrix = Matrix4.diagonal3Values(1, currScale, 1)
        ..setTranslationRaw(0, height * (1 - scaleFactor) / 2, 1);
    }
    String? t1 = flags[match.teamA];
    String? t2 = flags[match.teamB];
    return GestureDetector(
      onTap: () {
        Navigator.push(
            context,
            MaterialPageRoute(
                builder: (context) => LiveLineMatches(
                      // title: match.title.toString(),
                      // teamA: match.teamA.toString(),
                      // teamB: match.teamB.toString(),
                      // matchId: match.matchId.toString(),
                      // teamAImage: match.,
                      match: match,
                    )));
      },
      child: Transform(
          alignment: Alignment.center,
          transform: matrix,
          child: Container(
            margin: EdgeInsets.all(10),
            // color: Colors.red,
            width: 400,
            height: 193,
            decoration: BoxDecoration(
              color: Colors.red,
              borderRadius: BorderRadius.circular(30),
            ),
            child: Center(
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      CircleAvatar(
                        backgroundImage: NetworkImage(
                            "http://cricnet.co.in/ManagePlaying/TeamImages/${match.jsondata!.jsondata!.teamABanner.toString()}"),
                        radius: 40,
                      ),
                      Text(
                        match.jsondata!.jsondata!.teamA!.toString(),
                        style: TextStyle(
                            fontFamily: 'Poppins',
                            fontWeight: FontWeight.normal,
                            letterSpacing: 2,
                            color: Colors.white),
                        overflow: TextOverflow.ellipsis,
                      )
                    ],
                  ),
                  Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        match.matchtime
                            .toString()
                            .substring(0, 11)
                            .replaceAll('-', ' '),
                        style: TextStyle(color: Colors.white, letterSpacing: 1),
                      ),
                      Text(
                        "${match.jsondata!.jsondata!.wicketA.toString()} - ${match.jsondata!.jsondata!.wicketB.toString()}",
                        style: TextStyle(color: Colors.white, letterSpacing: 1),
                      )
                    ],
                  ),
                  Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      CircleAvatar(
                        backgroundImage: NetworkImage(
                            "http://cricnet.co.in/ManagePlaying/TeamImages/${match.jsondata!.jsondata!.teamBBanner.toString()}"),
                        radius: 40,
                      ),
                      Text(
                        match.jsondata!.jsondata!.teamB!.toString(),
                        style: TextStyle(
                            fontFamily: 'Poppins',
                            fontWeight: FontWeight.normal,
                            letterSpacing: 2,
                            color: Colors.white),
                        overflow: TextOverflow.ellipsis,
                      )
                    ],
                  ),
                ],
              ),
            ),
          )
          // child: Column(
          //   children: [
          //     Expanded(
          //       child: Container(
          //         height: Dimensions.pageViewContainer,
          //         margin: EdgeInsets.only(
          //             left: Dimensions.height10, right: Dimensions.height10),
          //         decoration: BoxDecoration(
          //           borderRadius: BorderRadius.circular(30),
          //           color: Colors.red,
          //           // color: Colors.pink[200]!,
          //           boxShadow: [
          //             BoxShadow(
          //               color: Colors.white60,
          //               blurRadius: 5.0,
          //               offset: Offset(0, 5),
          //             )
          //           ],
          //         ),
          //         child: Container(
          //           width: double.maxFinite,
          //           padding: EdgeInsets.only(
          //               top: Dimensions.height10,
          //               left: Dimensions.height20,
          //               right: Dimensions.height20),
          //           child: Column(
          //             children: [
          //               SmallText(
          //                 text: match.title.toString(),
          //                 color: AppColors.paraColor,
          //               ),
          //               BigText(
          //                 text: match.matchType.toString(),
          //                 color: Colors.white,
          //               ),
          //               SizedBox(
          //                 height: Dimensions.height10,
          //               ),
          //               match.jsondata.toString()!=''?
          //               Row(
          //                 mainAxisAlignment: MainAxisAlignment.spaceBetween,
          //                 children: [
          //                   match.jsondata.toString()!=""?
          //                   ImageAndText(
          //                     image:
          //                     match.jsondata.toString()!=''?
          //                         'http://cricnet.co.in/ManagePlaying/TeamImages/thumb/${match.jsondata!.jsondata!.teamABanner.toString()}':'',
          //                     text: match.jsondata!.jsondata!.teamA.toString(),
          //                     color: Colors.white,
          //                   ):BigText(text: 'Unavailable'),
          //                   match.jsondata.toString()!=""?
          //                   ImageAndText(
          //                     image:
          //                         'http://cricnet.co.in/ManagePlaying/TeamImages/thumb/${match.jsondata!.jsondata!.teamBBanner.toString()}',
          //                     text: match.jsondata!.jsondata!.teamB.toString(),
          //                     color: Colors.white,
          //                   ):BigText(text: 'Unavailable')
          //                 ],
          //               ):BigText(text: 'Match Details Unavailable at the moment'),
          //               SizedBox(
          //                 height: Dimensions.height10,
          //               ),
          //               // Row(
          //               //   children: [
          //               //     Icon(Icons.location_on, color: AppColors.iconColor1,),
          //               //     SizedBox(width: Dimensions.width10,),
          //               //     Text(match.venue.toString(), overflow: TextOverflow.ellipsis,),
          //               //   ],
          //               // ),
          //               Row(
          //                 mainAxisAlignment: MainAxisAlignment.spaceBetween,
          //                 children: [
          //                   Text(
          //                     match.jsondata!.jsondata!.wicketA.toString(),
          //                     style: TextStyle(
          //                       color: Colors.white,
          //                       fontSize: 16,
          //                     ),
          //                   ),
          //                   Text(
          //                     match.jsondata!.jsondata!.wicketB.toString(),
          //                     style: TextStyle(
          //                       color: Colors.white,
          //                       fontSize: 16,
          //                     ),
          //                   ),
          //                 ],
          //               ),
          //               SizedBox(
          //                 height: Dimensions.height10,
          //               ),
          //               Row(
          //                 mainAxisAlignment: MainAxisAlignment.spaceBetween,
          //                 children: [
          //                   match.jsondata!.jsondata!.oversA!.length <= 5
          //                       ? Text(
          //                           'Overs: (${match.jsondata!.jsondata!.oversA.toString()})',
          //                           style: TextStyle(
          //                             color: Colors.grey,
          //                             fontSize: 12,
          //                           ),
          //                         )
          //                       : Text(''),
          //                   match.jsondata!.jsondata!.oversB!.length <= 5
          //                       ? Text(
          //                           'Overs: ${match.jsondata!.jsondata!.oversB.toString()}',
          //                           style: TextStyle(
          //                             color: Colors.grey,
          //                             fontSize: 16,
          //                           ),
          //                         )
          //                       : Text(''),
          //                 ],
          //               ),
          //               SizedBox(
          //                 height: Dimensions.height20,
          //               ),
          //               Row(
          //                 mainAxisSize: MainAxisSize.min,
          //                 children: [
          //                   IconAndText(
          //                     icon: Icons.location_on,
          //                     text: match.venue.toString(),
          //                     color: AppColors.iconColor1,
          //                     textColor: Colors.white,
          //                     overflow: TextOverflow.ellipsis,
          //                   ),
          //                 ],
          //               ),
          //               SizedBox(
          //                 height: Dimensions.height15,
          //               ),
          //               Row(
          //                 mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          //                 children: [
          //                   IconAndText(
          //                     icon: Icons.date_range,
          //                     text: match.matchtime.toString().substring(0, 11),
          //                     color: AppColors.mainColor,
          //                     textColor: Colors.white,
          //                   ),
          //                   IconAndText(
          //                     icon: Icons.access_time_rounded,
          //                     text: match.title.toString().substring(4) ==
          //                             'Test Match'
          //                         ? match.matchtime.toString().substring(28)
          //                         : match.matchtime.toString().substring(15),
          //                     color: AppColors.iconColor2,
          //                     textColor: Colors.white,
          //                   )
          //                 ],
          //               ),
          //               SizedBox(
          //                 height: Dimensions.height10,
          //               ),
          //               Text(
          //                 match.result.toString(),
          //                 style: TextStyle(
          //                   color: Colors.white,
          //                   fontSize: 16,
          //                 ),
          //               ),
          //             ],
          //           ),
          //         ),
          //       ),
          //     ),
          //   ],
          // ),
          ),
    );
  }
}
