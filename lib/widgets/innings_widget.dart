import 'package:flutter/material.dart';
import 'package:food_delivery_app/models/match_odds_model.dart';

import '../utils/dimensions.dart';

class InningWidget extends StatelessWidget {
  final MatchOdds match;
  const InningWidget({Key? key, required this.match}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Card(
      child: Padding(
        padding: const EdgeInsets.all(12.0),
        child: Row(
          children: [
            Text(match.score.toString()),
            SizedBox(width: Dimensions.width10,),
            Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                Text(match.overs.toString()),
                // new SizedBox(height: 10,child: new Center(
                //   child: new Container(
                //     margin: new EdgeInsetsDirectional.only(start: 1.0, end: 1.0),
                //     height: 5.0,
                //     color: Colors.black,
                //   ),
                // ),),
                const Divider(height: 10,thickness: 2, indent: 5, endIndent: 5, color: Colors.black,),

                Text(match.subdate.toString().substring(11,16))
              ],
            ),
            // Divider(height: 10,),
            VerticalDivider(width: 10, color: Colors.black,),
            Column(
              children: [
                Text(match.sessionA.toString()),
                Divider(height: 10,),
                Text(match.sessionB.toString()),
              ],
            ),
            SizedBox(width: Dimensions.width15,),
            Expanded(child: Text(match.battingteam.toString())),
            Text(match.mrateA.toString()),
            SizedBox(width: Dimensions.width20,),
            Text(match.mrateB.toString()),
          ],
        ),
      ),
    );
  }
}
