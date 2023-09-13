import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:food_delivery_app/models/livelineget_model.dart';
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

class LiveLineWidget extends StatelessWidget {
  final LiveLineMatchModel match;

  LiveLineWidget({Key? key, required this.match}) : super(key: key);

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
    // return GestureDetector(
    //   onTap: (){
    //     Navigator.push(
    //       context,
    //       MaterialPageRoute(
    //         // builder: (context) => CardDetail(title: match.title.toString(),
    //         //  teamA: match.teamA.toString(), teamB: match.teamB.toString(),
    //         // ),
    //         builder: (context)=>ScorecardScreen(title: match.title.toString(),
    //             teamA: match.teamA.toString(), teamB: match.teamB.toString(),matchId: match.matchId.toString()),
    //       ),
    //     );
    //   },
    return Card(
      elevation: 0,
      color: Colors.transparent,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(10),
      ),
      child: Container(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10),
          color: Colors.white,

          // gradient: LinearGradient(
          //   colors: [startColor,endColor],
          //   begin: Alignment.topLeft,
          //   end: Alignment.bottomRight,
          // ),
        ),
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Center(
                child: SmallText(text: match.title.toString(),),
              ),
              SizedBox(height: Dimensions.height15),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  Expanded(child: BigText(text: match.teamA.toString() ,color: Colors.black54)),
                  // SizedBox(width: Dimensions.width10,),
                  Flexible(
                    child: CircleAvatar(
                      backgroundImage: NetworkImage("http://cricnet.co.in/ManagePlaying/TeamImages/${match.teamAImage}"),
                    ),
                  ),
                  Flexible(
                    child: CircleAvatar(
                      backgroundImage: NetworkImage("http://cricnet.co.in/ManagePlaying/TeamImages/${match.teamBImage}"),
                    ),
                  ),
                  // SizedBox(width: Dimensions.width10,),
                  Expanded(child: BigText(text: match.teamB.toString(),color: Colors.black54, overflow: TextOverflow.ellipsis,)),
                ],
              ),
              SizedBox(height: Dimensions.height15),
              SmallText(text: match.venue.toString()),
              SizedBox(height: Dimensions.height15),
              BigText(text: match.matchtime.toString())
              // BigText(text: '${match.result}', color: Colors.black54)

            ],
          ),
        ),
      ),
    );
    // );
  }
}