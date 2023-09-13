import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:food_delivery_app/models/livelineget_model.dart';
import 'package:food_delivery_app/models/match_model.dart';
import 'package:food_delivery_app/pages/details/card_details.dart';
import 'package:food_delivery_app/pages/details/live_match_details.dart';
import 'package:food_delivery_app/pages/details/scorecardscreen.dart';
import 'package:food_delivery_app/utils/colors.dart';
import 'package:food_delivery_app/utils/dimensions.dart';
import 'package:food_delivery_app/widgets/big_text.dart';
import 'package:food_delivery_app/widgets/icon_and_text_widget.dart';
import 'package:food_delivery_app/widgets/small_text.dart';
import 'package:provider/provider.dart';
import '../models/match_result_model.dart';

class MatchesWidget extends StatelessWidget {
  final LiveLineMatchModel match;

  MatchesWidget({Key? key, required this.match}) : super(key: key);

  final Map<String, Color> teamColors = {
    'India': Colors.blue,
    'Australia': Colors.yellow,
    'Pakistan': Colors.green,
    'West Indies': const Color(0xFF800000),
    'Ireland': const Color(0xFF006400),
    'Bangladesh': Colors.lightGreen,
    'Scotland': const Color(0xFF800080),
    'New Zealand': Colors.black54,
  };

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

  @override
  Widget build(BuildContext context) {
    print('Widget: $match');
    Color? startColor = teamColors[match.teamA];
    Color? endColor = teamColors[match.teamB];

    String? t1 = flags[match.teamA];
    String? t2 = flags[match.teamB];

    if (startColor == null || endColor == null || t1 == null || t2 == null) {
      startColor = Colors.grey;
      endColor = Colors.white;
    }
    if(match != null){
      return GestureDetector(
        onTap: () {
          //updateLiveMatchData();
          Navigator.push(
            context,
            MaterialPageRoute(
              // builder: (context) => CardDetail(title: match.title.toString(),
              //  teamA: match.teamA.toString(), teamB: match.teamB.toString(),
              // ),
              builder: (context) => LiveLineMatches(
                  match: match),
            ),
          );
        },
          child: Container(
            margin: EdgeInsets.only(bottom: 15),
            child: Stack(
                children:[ Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    //live upcoming
                    Container(
                      padding: EdgeInsets.only(left: 20, right: 20),
                      decoration: BoxDecoration(
                          color: Colors.redAccent,
                          borderRadius: BorderRadius.only(topRight: Radius.circular(10),topLeft: Radius.circular(10))
                      ),
                      child: Text("LIVE | ${match.matchType}", style: TextStyle(
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

                          //teams avatars, scores
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
                                      backgroundImage: NetworkImage("http://cricnet.co.in/ManagePlaying/TeamImages/${match.jsondata?.jsondata?.teamABanner}"),
                                    ),
                                    Column(
                                      crossAxisAlignment: CrossAxisAlignment.start,
                                      children: [
                                        Container(
                                          padding: EdgeInsets.only(left: 10),
                                          width: 82,
                                          decoration: BoxDecoration(
                                              gradient: LinearGradient(
                                                colors: [Colors.black87, Color(0xFF000080)],
                                              ),
                                              border: Border.all(color: Colors.blue[300]!, width: 2),
                                              borderRadius: BorderRadius.only(topRight: Radius.circular(10), bottomRight: Radius.circular(10), topLeft: Radius.circular(10))
                                          ),
                                          child: Text("${match.jsondata?.jsondata?.wicketA}", style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold, letterSpacing: 1.5),),
                                        ),
                                        Container(
                                          width: 60,
                                          padding: EdgeInsets.only(left: 10, right: 10),
                                          decoration: BoxDecoration(
                                              color: Colors.blue,
                                              border: Border.all(color: Colors.blue[300]!, width: 1),
                                              borderRadius: BorderRadius.only(bottomRight: Radius.circular(20), bottomLeft: Radius.circular(10))
                                          ),
                                          child: Text("(${match.jsondata?.jsondata?.oversA})", style: TextStyle(fontSize: 12, color: Colors.white),),
                                        ),
                                      ],
                                    ),
                                  ],
                                ),
                                Text('VS', style: TextStyle(color: Colors.redAccent, fontWeight: FontWeight.bold, letterSpacing: 1.2, fontSize: 16,height: 7,),),
                                //team 2
                                Row(
                                  children: [
                                    Column(
                                      crossAxisAlignment: CrossAxisAlignment.end,
                                      children: [
                                        Container(
                                          padding: EdgeInsets.only(right: 10),
                                          width: 82,
                                          decoration: BoxDecoration(
                                              gradient: LinearGradient(
                                                colors: [Color(0xFF006400), Colors.black],
                                              ),
                                              border: Border.all(color: Colors.green[300]!, width: 2),
                                              borderRadius: BorderRadius.only(topLeft: Radius.circular(10), bottomLeft: Radius.circular(10), topRight: Radius.circular(10))
                                          ),
                                          child: Text("${match.jsondata?.jsondata?.wicketB.toString().split("(")[0]}", style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold, letterSpacing: 1.5),textDirection: TextDirection.rtl),
                                        ),
                                        Container(
                                          width: 60,
                                          padding: EdgeInsets.only(left: 10, right: 10),
                                          decoration: BoxDecoration(
                                              color: Colors.green,
                                              border: Border.all(color: Colors.green[300]!, width: 1),
                                              borderRadius: BorderRadius.only(bottomLeft: Radius.circular(20), bottomRight: Radius.circular(10))
                                          ),
                                          child:
                                          Text(''),
                                        ),
                                      ],
                                    ),
                                    CircleAvatar(
                                      radius: 30,
                                      backgroundColor: Colors.grey,
                                      backgroundImage: NetworkImage("http://cricnet.co.in/ManagePlaying/TeamImages/${match.jsondata?.jsondata?.teamBBanner}"),
                                    ),
                                  ],
                                )

                              ],
                            ),
                          ),

                          //team names
                          Container(
                            padding: EdgeInsets.only(left: 10, right: 10),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                children: [
                                  Text("${match.jsondata?.jsondata?.teamA.toString().toUpperCase()}", style: TextStyle(color: Colors.black, fontSize: 12, fontWeight: FontWeight.bold, overflow: TextOverflow.ellipsis),),
                                  Text("${match.jsondata?.jsondata?.teamB.toString().toUpperCase()}", style: TextStyle(color: Colors.black, fontSize: 12, fontWeight: FontWeight.bold, overflow: TextOverflow.ellipsis),)
                                ],
                            ),
                          ),

                          //venue, desc
                          Container(
                            margin: EdgeInsets.only(top:10),
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

                    //2nd container
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
                            child: Center(child: Text("${match.jsondata?.jsondata?.teamA.toString().substring(0,3).toUpperCase()}", style: TextStyle(fontWeight: FontWeight.bold, overflow: TextOverflow.ellipsis),)),
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
                                Text("${match.jsondata?.jsondata?.rateA.toString().substring(0,2)}", style: TextStyle(color: Colors.blue, fontWeight: FontWeight.bold),),
                                Text(' | ', style: TextStyle(fontWeight: FontWeight.bold),),
                                Text("${match.jsondata?.jsondata?.rateA.toString().substring(5,7)}", style: TextStyle(color: Colors.red, fontWeight: FontWeight.bold),),
                              ],
                            ),
                          )
                        ],
                      ),
                    )
                  ],
                ),]
            ),
          )
        // child: Card(
        //   margin: EdgeInsets.only(left: 20, right: 20, bottom: 10),
        //   elevation: 0,
        //   color: Colors.transparent,
        //   shape: RoundedRectangleBorder(
        //     borderRadius: BorderRadius.circular(30),
        //   ),
        //   child: Container(
        //     decoration: BoxDecoration(
        //       borderRadius: BorderRadius.circular(30),
        //       border: Border.all(color: Colors.red),
        //       color: Colors.white,
        //
        //       // gradient: LinearGradient(
        //       //   colors: [startColor,endColor],
        //       //   begin: Alignment.topLeft,
        //       //   end: Alignment.bottomRight,
        //       // ),
        //     ),
        //     child: Padding(
        //         padding: const EdgeInsets.all(16.0),
        //         child: Column(
        //             crossAxisAlignment: CrossAxisAlignment.center,
        //             children: [
        //               Center(
        //                 child: SmallText(
        //                   text: match.title.toString(),
        //                 ),
        //               ),
        //               SizedBox(height: Dimensions.height15),
        //               Row(
        //                 mainAxisAlignment: MainAxisAlignment.spaceBetween,
        //                 children: [
        //                   Column(
        //                     children: [
        //                       CircleAvatar(
        //                         radius: 40,
        //                         backgroundImage: NetworkImage(
        //                             "http://cricnet.co.in/ManagePlaying/TeamImages/${match.teamAImage}"),
        //                       ),
        //                       SizedBox(height: Dimensions.height10,),
        //                       Text(match.teamA.toString())
        //                     ],
        //                   ),
        //                   Column(
        //                     children: [
        //                       CircleAvatar(
        //                         radius: 40,
        //                         backgroundImage: NetworkImage(
        //                             "http://cricnet.co.in/ManagePlaying/TeamImages/${match.teamBImage}"),
        //                       ),
        //                       SizedBox(height: Dimensions.height10,),
        //                       Text(match.teamB.toString())
        //                     ],
        //                   ),
        //                 ],
        //               ),
        //               SizedBox(height: Dimensions.height10,),
        //               Text(match.result.toString())
        //             ])),
        //   ),
        // ),
      );
    }
    else{
      return Container();
    }
  }
}
