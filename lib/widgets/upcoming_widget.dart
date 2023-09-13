import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:food_delivery_app/models/match_model.dart';
import 'package:food_delivery_app/models/upcoming_model.dart';
import 'package:food_delivery_app/pages/details/card_details.dart';
import 'package:food_delivery_app/pages/details/scorecardscreen.dart';
import 'package:food_delivery_app/utils/colors.dart';
import 'package:food_delivery_app/utils/dimensions.dart';
import 'package:food_delivery_app/widgets/big_text.dart';
import 'package:food_delivery_app/widgets/icon_and_text_widget.dart';
import 'package:food_delivery_app/widgets/small_text.dart';

import '../models/match_result_model.dart';

class UpcomingMatchesWidget extends StatelessWidget {
  final UpcomingMatches match;

  UpcomingMatchesWidget({Key? key, required this.match}) : super(key: key);

  final Map<String, Color> teamColors = {
    'India': Colors.blue,
    'Australia': Colors.yellow,
    'Pakistan':Colors.green,
    'West Indies':const Color(0xFF800000),
    'Ireland':const Color(0xFF006400),
    'Bangladesh':Colors.lightGreen,
    'Scotland':const Color(0xFF800080),
    'New Zealand':Colors.black54,
  };

  final Map flags={
    'India':'bg_flag_india.png',
    'India W':'bg_flag_india.png',
    'Australia':'bg_flag_australia.png',
    'Australia W':'bg_flag_australia.png',
    'Pakistan':'bg_flag_pakistan.png',
    'Pakistan W':'bg_flag_pakistan.png',
    'Windies':'windies.jpg',
    'Windies W':'windies.jpg',
    'Ireland':'irelandpng.png',
    'Bangladesh':'bg_flag_bangladesh.png',
    'Bangladesh W':'bg_flag_bangladesh.png',
    'Sri Lanka':'bg_flag_sri_lanka.png',
    'New Zealand':'bg_flag_new_zealand.png',
    'Netherlands': 'netherlands.png',
    'England':'england.png',
    'England W':'england.png',
    'Afghanistan':'afg.png',
    'Afghanistan W':'afg.png',
    'Scotland':'scotland.jpg',
    'Scotland W':'scotland.jpg',
    'Oman':'oman.jpg',
    'Oman W':'oman.jpg',
    'Warwickshire':'warwick.png',
    'Essex':'essex.png',
    'Surrey':'surrey.png',
    'Lancashire':'lancashire.png',
    'Lyca Kovai Kings':'lyca.png',
    'Dindigul':'dindigul.jpg',
    'Nellai Royal Kings':'nellai.png',
    'Madurai Panthers':'madurai.jpg',
    'Somerest':'somerest.png',
    'Nottinghamshire':'notting.png',
    'Hampshire':'hampshire.png',
    'Worcestershire':'worcest.png',
    'Texas Super Kings':'texas.png',
    'MI New York':'mi_nyc.jpg',
    'Los Angeles KR':'la.png',
    'San Francisco U':'sf.png',
    'Washington Freedom':'washington.jpg',
    'Seattle Orcas':'seattle.png',
  };
  @override
  Widget build(BuildContext context) {
    String url="http://cricnet.co.in/ManagePlaying/TeamImages/";
    print('Widget: $match');
    Color? startColor = teamColors[match.teamA];
    Color? endColor = teamColors[match.teamB];

    String? t1=flags[match.teamA];
    String? t2=flags[match.teamB];

    if (startColor == null || endColor == null || t1==null || t2==null) {
      startColor = Colors.grey;
      endColor = Colors.white;
    }
      return Column(
        children: [
          //live upcoming
          Container(
            padding: EdgeInsets.only(left: 20, right: 20),
            decoration: BoxDecoration(
                color: Colors.blue,
                borderRadius: BorderRadius.only(topRight: Radius.circular(10),topLeft: Radius.circular(10))
            ),
            child: Text("UPCOMING | ${match.matchtype}", style: TextStyle(
                color: Colors.white,
                fontSize: 11
            ),),
          ),

          //main container
          Container(
            margin: EdgeInsets.only(left: 15, right: 15),
            decoration: BoxDecoration(
                borderRadius: BorderRadius.only(topLeft: Radius.circular(10),topRight: Radius.circular(10)),
                gradient: LinearGradient(
                begin: Alignment.centerLeft,
                end: Alignment.centerRight,
                  stops: [0.5, 0.5],
                  colors: [Colors.white, Colors.grey[100]!],
            )
            ),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                //title time
                Container(
                  padding: EdgeInsets.only(left: 10, right: 10, top:10),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(match.title.toString(), style: TextStyle(fontSize: 10),),
                      Text(match.matchtime.toString().substring(0,11),style: TextStyle(fontSize: 10, overflow: TextOverflow.ellipsis), overflow: TextOverflow.ellipsis,)
                    ],
                  ),
                ),

                //teams, scores
                Container(
                  padding: EdgeInsets.only(left: 10, right: 10),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      //team 1
                      Row(
                        children: [
                          CircleAvatar(
                            radius: 30,
                            backgroundColor: Colors.grey,
                            backgroundImage: NetworkImage("http://cricnet.co.in/ManagePlaying/TeamImages/${match.teamAImage}"),
                          ),
                          SizedBox(width: Dimensions.width10,),
                          Container(
                              width: 80,
                              child: Text(match.teamA.toString().toUpperCase(), style: TextStyle(color: Color(0xFF000080), fontWeight: FontWeight.bold, overflow: TextOverflow.ellipsis),))
                        ],
                      ),
                      Text('VS', style: TextStyle(color: Colors.blue, fontWeight: FontWeight.bold, letterSpacing: 1.2, fontSize: 16,height: 7,),),
                      //team 2
                      Row(
                        children: [
                          Container(
                            width: 80,
                              child: Text(match.teamB.toString().toUpperCase(), style: TextStyle(color: Color(0xFF006400), fontWeight: FontWeight.bold, overflow: TextOverflow.ellipsis), textAlign: TextAlign.end,)),
                          SizedBox(width: Dimensions.width10,),
                          CircleAvatar(
                            radius: 30,
                            backgroundColor: Colors.grey,
                            backgroundImage: NetworkImage("http://cricnet.co.in/ManagePlaying/TeamImages/${match.teamBImage}"),
                          ),
                        ],
                      )

                    ],
                  ),
                ),

                //desc and venue
                Container(
                  decoration: BoxDecoration(
                    color: Colors.grey[200]
                  ),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      Expanded(
                        child: SingleChildScrollView(
                            scrollDirection: Axis.horizontal,
                            child: Padding(
                              padding: const EdgeInsets.only(left: 7, right: 7),
                              child: Text("${match.venue.toString()} | ${match.matchtime}", style: TextStyle(color: Colors.red, fontSize: 12), textDirection: TextDirection.ltr,),
                            )),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),

          //2nd one
          Container(
            margin: EdgeInsets.only(left: 15, right: 15),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Container(
                  width: 80,
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.only(bottomRight: Radius.circular(20), bottomLeft: Radius.circular(10))
                  ),
                  child: Text(' '),
                ),
                Container(
                  width: 80,
                  decoration: BoxDecoration(
                    color: Colors.white,
                      borderRadius: BorderRadius.only(bottomRight: Radius.circular(10), bottomLeft: Radius.circular(20))
                  ),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text('0', style: TextStyle(color: Colors.blue, fontWeight: FontWeight.bold),),
                      Text(' | '),
                      Text('0', style: TextStyle(color: Colors.red, fontWeight: FontWeight.bold),),
                    ],
                  ),
                )
              ],
            ),
          )
        ],
      );
      //   Card(
      //   elevation: 0,
      //   color: Colors.transparent,
      //   shape: RoundedRectangleBorder(
      //     borderRadius: BorderRadius.circular(10),
      //   ),
      //   child: Container(
      //     decoration: BoxDecoration(
      //       borderRadius: BorderRadius.circular(10),
      //       color: Colors.white,
      //
      //       // gradient: LinearGradient(
      //       //   colors: [startColor,endColor],
      //       //   begin: Alignment.topLeft,
      //       //   end: Alignment.bottomRight,
      //       // ),
      //     ),
      //     child: Padding(
      //       padding: const EdgeInsets.all(16.0),
      //       child: Column(
      //         crossAxisAlignment: CrossAxisAlignment.center,
      //         children: [
      //           Center(
      //             child: SmallText(text: match.title.toString(),),
      //           ),
      //           SizedBox(height: Dimensions.height15),
      //           Row(
      //             mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      //             children: [
      //               Expanded(child: BigText(text: match.teamA.toString() ,color: Colors.black54)),
      //               // SizedBox(width: Dimensions.width10,),
      //               Flexible(
      //                 child: CircleAvatar(
      //                   backgroundImage: NetworkImage("http://cricnet.co.in/ManagePlaying/TeamImages/${match.teamAImage}"),
      //                 ),
      //               ),
      //               Flexible(
      //                 child: CircleAvatar(
      //                   backgroundImage: NetworkImage("http://cricnet.co.in/ManagePlaying/TeamImages/${match.teamBImage}"),
      //                 ),
      //               ),
      //               // SizedBox(width: Dimensions.width10,),
      //               Expanded(child: BigText(text: match.teamB.toString(),color: Colors.black54, overflow: TextOverflow.ellipsis,)),
      //             ],
      //           ),
      //           SizedBox(height: Dimensions.height15),
      //           SmallText(text: match.venue.toString()),
      //           SizedBox(height: Dimensions.height15),
      //           BigText(text: match.matchtime.toString())
      //           // BigText(text: '${match.result}', color: Colors.black54)
      //
      //         ],
      //       ),
      //     ),
      //   ),
      // );
    // );
  }
}