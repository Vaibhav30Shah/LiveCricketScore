import 'dart:async';
import 'dart:convert';
import 'dart:math';
import 'package:animations/animations.dart';
import 'package:awesome_ripple_animation/awesome_ripple_animation.dart';
import 'package:flutter/material.dart';
import 'package:flutter/foundation.dart';
import 'package:http/http.dart' as http;
import 'package:food_delivery_app/models/livelineget_model.dart';
import 'package:food_delivery_app/utils/dimensions.dart';
import 'package:food_delivery_app/widgets/big_text.dart';
import 'package:food_delivery_app/widgets/small_text.dart';
import 'package:loading_animation_widget/loading_animation_widget.dart';

class LiveLineMatches extends StatefulWidget {
  final LiveLineMatchModel match;

  // final String title;
  // final String teamA;
  // final String teamB;
  // final String matchId;
  // final String teamAImage;
  // final String teamBImage;
  // const LiveLineMatches({Key? key, required this.title, required this.teamA, required this.teamB, required this.matchId, required this.teamAImage, required this.teamBImage, required this.match}) : super(key: key);
  const LiveLineMatches({Key? key, required this.match});

  @override
  State<LiveLineMatches> createState() => _LiveLineMatchesState();
}

class _LiveLineMatchesState extends State<LiveLineMatches>
    with TickerProviderStateMixin, ChangeNotifier {

  @override
  void initState() {
    super.initState();
    notifyListeners();
    loadLiveData();
    print(widget.match!.jsondata!.jsondata!.title.toString().split('|')[1]);
  }

  LiveLineMatchModel? liveMatches;
  get data => liveMatches;

  List<LiveLineMatchModel> liveMatchesNew = [];
  Future<List<LiveLineMatchModel>> fetchLiveData() async {
    var url = Uri.parse('http://cricpro.cricnet.co.in/api/values/LiveLine');
    var response = await http.get(url);
    if (response.statusCode == 200) {
      dynamic jsonData = json.decode(response.body);
      // log(jsonData.toString());
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

      return liveMatchesNew;
    } else {
      throw Exception('Failed to fetch data');
    }
  }

  List<LiveLineMatchModel> liveMatchesData = [];
  void loadLiveData() {
    Timer.periodic(Duration(seconds: 20), (timer) {
      fetchLiveData().then((data) {
        setState(() {
          liveMatchesData = data;
        });
      }).catchError((error) {
        print('Error: $error');
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    List<String> batsmanName=widget.match!.jsondata!.jsondata!.batsman.toString().split('|');

    List brun=widget.match!.jsondata!.jsondata!.oversB.toString().split('|');
    List bat1=brun[0].split(',');
    List bat2=brun[1].split(',');
    return Scaffold(
      appBar: AppBar(
        // leading: Icon(Icons.arrow_back_ios_new),
        title: Text(widget.match.title.toString()),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.all(15),
          child: Column(
            children: [
              //team names and team flag avatar
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Row(
                    children: [
                      SmallText(text: widget.match!.jsondata!.jsondata!.testTeamA.toString()),
                      SizedBox(
                        width: 5,
                      ),
                      CircleAvatar(
                        backgroundImage: NetworkImage(
                            'http://cricnet.co.in/ManagePlaying/TeamImages/thumb/${widget.match!.jsondata!.jsondata!.teamABanner}'),
                      ),
                    ],
                  ),
                  Row(
                    children: [
                      CircleAvatar(
                        backgroundImage: NetworkImage(
                            'http://cricnet.co.in/ManagePlaying/TeamImages/thumb/${widget.match!.jsondata!.jsondata!.teamBBanner}'),
                      ),
                      SizedBox(
                        width: 5,
                      ),
                      SmallText(text: widget.match!.jsondata!.jsondata!.teamB.toString()),
                    ],
                  )
                ],
              ),

              //runs, overs and revolving circle
              Padding(
                padding: const EdgeInsets.only(top: 10.0),
                child: Container(
                  padding: EdgeInsets.all(20),
                  decoration: BoxDecoration(
                    // color: Colors.grey[100],
                    borderRadius: BorderRadius.circular(10)
                  ),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      //team A score and over
                      Column(
                        children: [
                          BigText(
                              text: widget.match!.jsondata!.jsondata!.wicketA
                                  .toString()),
                          SmallText(
                              text: widget.match!.jsondata!.jsondata!.oversA
                                  .toString()),
                        ],
                      ),

                      //revolving circle
                      Stack(
                        alignment: Alignment.center,
                        // fit: StackFit.passthrough,
                        children: [
                        LoadingAnimationWidget.threeArchedCircle(
                          color: Colors.pink[200]!,
                          size: 130,
                        ),
                        Center(
                          child: Container(
                            padding: EdgeInsets.all(8),
                            alignment: Alignment.center,
                            transformAlignment: Alignment.center,
                              width: 90,
                              child: SmallText(text: widget.match!.jsondata!.jsondata!.score.toString(), color: Colors.black,overflow: TextOverflow.clip,)),
                        ),
                      ],
                      ),

                      //team B score and over
                      Column(
                        children: [
                          BigText(
                              text: widget.match!.jsondata!.jsondata!.wicketB
                                  .toString()),
                          SmallText(
                              text: ''),
                        ],
                      ),
                    ],
                  ),
                ),
              ),

              //last 6 balls
              Padding(
                padding: const EdgeInsets.only(top: 15.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    Container(
                      padding: EdgeInsets.all(10),
                      decoration: BoxDecoration(
                          color: Colors.grey[100],
                          borderRadius: BorderRadius.circular(5)
                      ),
                      child: SmallText(text: 'Last Over',),
                    ),
                  ],
                ),
              ),
              Container(
                width: double.maxFinite,
                padding: EdgeInsets.all(8),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(5),
                    color: Colors.pinkAccent
                ),
                child: Center(
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        BigText(
                          text: widget.match!.jsondata!.jsondata!.last6Balls.toString().split('-')[0],
                          color: Colors.white,
                        ),
                        BigText(
                          text: widget.match!.jsondata!.jsondata!.last6Balls.toString().split('-')[1],
                          color: Colors.white,
                        ),
                        BigText(
                          text: widget.match!.jsondata!.jsondata!.last6Balls.toString().split('-')[2],
                          color: Colors.white,
                        ),
                        BigText(
                          text: widget.match!.jsondata!.jsondata!.last6Balls.toString().split('-')[3],
                          color: Colors.white,
                        ),
                        BigText(
                          text: widget.match!.jsondata!.jsondata!.last6Balls.toString().split('-')[4],
                          color: Colors.white,
                        ),
                        BigText(
                          text: widget.match!.jsondata!.jsondata!.last6Balls.toString().split('-')[5],
                          color: Colors.white,
                        ),
                      ],
                    )
                ),
              ),

              //Chances
              Padding(
                padding: const EdgeInsets.only(top: 15.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    Container(
                      padding: EdgeInsets.all(10),
                      decoration: BoxDecoration(
                          color: Colors.grey[100],
                          borderRadius: BorderRadius.circular(5)
                      ),
                      child: SmallText(text: 'Chances',),
                    ),
                  ],
                ),
              ),
              Container(
                padding: EdgeInsets.all(15),
                width: double.maxFinite,
                decoration: BoxDecoration(
                  color: Colors.pinkAccent,
                  borderRadius: BorderRadius.circular(5)
                ),
                child: Column(
                  children: [
                    //team name and market odds
                    widget.match!.matchType.toString()!='Test'?
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        BigText(text: widget.match!.jsondata!.jsondata!.teamA.toString(), color: Colors.white, size: 16,),
                        Column(
                          children: [
                            BigText(text: 'Market Odds', color: Colors.white,size: 16,),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Container(
                                  padding: EdgeInsets.only(top: 8, bottom: 8, right: 15, left: 15),
                                  // width: double.minPositive,
                                  decoration: BoxDecoration(
                                    color: Colors.purple,
                                    borderRadius: BorderRadius.only(bottomLeft: Radius.circular(10), bottomRight: Radius.circular(10))
                                  ),
                                  child: SmallText(text: widget.match!.jsondata!.jsondata!.rateA.toString().substring(0,2),),
                                ),
                                Container(
                                  padding: EdgeInsets.only(top: 8, bottom: 8, right: 15, left: 15),
                                  // width: double.minPositive,
                                  decoration: BoxDecoration(
                                      color: Colors.amber,
                                      borderRadius: BorderRadius.only(bottomLeft: Radius.circular(10), bottomRight: Radius.circular(10))
                                  ),
                                  child: SmallText(text: widget.match!.jsondata!.jsondata!.rateA.toString().substring(5,7),color: Colors.black,),
                                ),
                              ],
                            )
                          ],
                        )
                      ],
                    )
                    :Container(),
                    //session, over and run x ball
                    SizedBox(height:Dimensions.height30,),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Column(
                          children: [
                            BigText(text: 'Session', color: Colors.white,size: 16,),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Container(
                                  padding: EdgeInsets.only(top: 8, bottom: 8, right: 15, left: 15),
                                  // width: double.minPositive,
                                  decoration: BoxDecoration(
                                      color: Colors.purple,
                                      borderRadius: BorderRadius.only(bottomLeft: Radius.circular(10), bottomRight: Radius.circular(10))
                                  ),
                                  child: SmallText(text: widget.match!.jsondata!.jsondata!.sessionA.toString()),
                                ),
                                Container(
                                  padding: EdgeInsets.only(top: 8, bottom: 8, right: 15, left: 15),
                                  // width: double.minPositive,
                                  decoration: BoxDecoration(
                                      color: Colors.amber,
                                      borderRadius: BorderRadius.only(bottomLeft: Radius.circular(10), bottomRight: Radius.circular(10))
                                  ),
                                  child: SmallText(text: widget.match!.jsondata!.jsondata!.sessionB.toString(),color: Colors.black,),
                                ),
                              ],
                            )
                          ],
                        ),
                        Column(
                          children: [
                            BigText(text: 'Over', size: 16, color: Colors.white,),
                            SizedBox(height: Dimensions.height10,),
                            BigText(text: widget.match!.jsondata!.jsondata!.sessionOver.toString(), color: Colors.white,)
                          ],
                        ),
                        Column(
                          children: [
                            BigText(text: 'Run x Ball', color: Colors.white,size: 16,),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Container(
                                  padding: EdgeInsets.only(top: 8, bottom: 8, right: 15, left: 15),
                                  // width: double.minPositive,
                                  decoration: BoxDecoration(
                                      color: Colors.purple,
                                      borderRadius: BorderRadius.only(bottomLeft: Radius.circular(10), bottomRight: Radius.circular(10))
                                  ),
                                  child: SmallText(text: widget.match!.jsonruns!.jsonruns!.runxa.toString()),
                                ),
                                Container(
                                  padding: EdgeInsets.only(top: 8, bottom: 8, right: 15, left: 15),
                                  // width: double.minPositive,
                                  decoration: BoxDecoration(
                                      color: Colors.amber,
                                      borderRadius: BorderRadius.only(bottomLeft: Radius.circular(10), bottomRight: Radius.circular(10))
                                  ),
                                  child: SmallText(text: widget.match!.jsonruns!.jsonruns!.runxb.toString(),color: Colors.black,),
                                ),
                              ],
                            )
                          ],
                        )
                      ],
                    ),
                  ],
                ),
              ),

              SizedBox(height: Dimensions.height15,),
              //if test match then team names and their rates
              widget.match!.jsondata!.jsondata!.matchtype.toString()=='Test'?
                  Container(
                    padding: EdgeInsets.all(15),
                    width: double.maxFinite,
                    decoration: BoxDecoration(
                      color: Colors.pinkAccent,
                      borderRadius: BorderRadius.circular(5)
                    ),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            BigText(text: widget.match!.jsondata!.jsondata!.testTeamA.toString(), color: Colors.white, size: 16,),
                            SizedBox(width: Dimensions.width50,),
                            BigText(text: widget.match!.jsondata!.jsondata!.testTeamARate1.toString(), color: Colors.white, size: 16,),
                            BigText(text: widget.match!.jsondata!.jsondata!.testTeamARate2.toString(), color: Colors.white, size: 16,)
                          ],
                        ),
                        SizedBox(height: Dimensions.height10,),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            BigText(text: widget.match!.jsondata!.jsondata!.testTeamB.toString(), color: Colors.white, size: 16,),
                            SizedBox(width: Dimensions.width50,),
                            BigText(text: widget.match!.jsondata!.jsondata!.testTeamBRate1.toString(), color: Colors.white, size: 16,),
                            BigText(text: widget.match!.jsondata!.jsondata!.testTeamBRate2.toString(), color: Colors.white, size: 16,)
                          ],
                        ),
                        SizedBox(height: Dimensions.height10,),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            BigText(text: 'Draw', color: Colors.white, size: 16,),
                            SizedBox(width: Dimensions.width50,),
                            BigText(text: widget.match!.jsondata!.jsondata!.testdrawRate1.toString(), color: Colors.white, size: 16,),
                            BigText(text: widget.match!.jsondata!.jsondata!.testdrawRate2.toString(), color: Colors.white, size: 16,)
                          ],
                        )
                      ],
                    ),
                  ):Container(),

              //Batsman
              Padding(
                padding: const EdgeInsets.only(top: 15.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    Container(
                      padding: EdgeInsets.all(10),
                      decoration: BoxDecoration(
                          color: Colors.grey[100],
                          borderRadius: BorderRadius.circular(5)
                      ),
                      child: SmallText(text: 'Batsman',),
                    ),
                  ],
                ),
              ),
              SingleChildScrollView(
                scrollDirection: Axis.horizontal,
                child: DataTable(
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(5)
                  ),
                  headingRowColor: MaterialStateColor.resolveWith((states) => Colors.pink[400]!),
                    columns: [
                  DataColumn(label: Text('Player', style: TextStyle(color: Colors.white),)),
                  DataColumn(label: Text('R', style: TextStyle(color: Colors.white),)),
                  DataColumn(label: Text('B', style: TextStyle(color: Colors.white),)),
                  DataColumn(label: Text('4s', style: TextStyle(color: Colors.white),)),
                  DataColumn(label: Text('6s', style: TextStyle(color: Colors.white),)),
                  DataColumn(label: Text('SR', style: TextStyle(color: Colors.white),)),
                ], rows: [
                  DataRow(
                    color: MaterialStateColor.resolveWith((states) =>  Colors.pink[200]!),
                      cells: [
                    DataCell(Text(batsmanName[0], style: TextStyle(color: Colors.white),)),
                    DataCell(Text(bat1[1], style: TextStyle(color: Colors.white),)),
                    DataCell(Text(bat2[1], style: TextStyle(color: Colors.white),)),
                    DataCell(Text(widget.match!.jsondata!.jsondata!.s4.toString(), style: TextStyle(color: Colors.white),)),
                    DataCell(Text(widget.match!.jsondata!.jsondata!.s6.toString(), style: TextStyle(color: Colors.white),)),
                    DataCell(Text(((int.parse(bat1[1])/int.parse(bat2[1]))*100).toStringAsFixed(2), style: TextStyle(color: Colors.white),)),
                  ]),
                  DataRow(
                      color: MaterialStateColor.resolveWith((states) => Colors.pink[200]!),
                      cells: [
                    DataCell(Text(batsmanName[1], style: TextStyle(color: Colors.white),)),
                    DataCell(Text(bat1[0], style: TextStyle(color: Colors.white),)),
                    DataCell(Text(bat2[0], style: TextStyle(color: Colors.white),)),
                    DataCell(Text(widget.match!.jsondata!.jsondata!.ns4.toString(), style: TextStyle(color: Colors.white),)),
                    DataCell(Text(widget.match!.jsondata!.jsondata!.ns6.toString(), style: TextStyle(color: Colors.white),)),
                    DataCell(Text(((int.parse(bat1[0])/int.parse(bat2[0]))*100).toStringAsFixed(2), style: TextStyle(color: Colors.white),)),
                  ])
                ]),
              ),
              Container(
                alignment: Alignment.center,
                width: double.maxFinite,
                padding: EdgeInsets.all(8),
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(5),
                    color: Colors.pinkAccent
                ),
                child: Center(
                    child: Text(
                      ('Bowler: ${widget.match!.jsondata!.jsondata!.bowler.toString()}'),
                      overflow: TextOverflow.visible,
                      style: TextStyle(color: Colors.white),
                    )
                ),
              ),

              //Summary
              Padding(
                padding: const EdgeInsets.only(top: 15.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    Container(
                      padding: EdgeInsets.all(10),
                      decoration: BoxDecoration(
                          color: Colors.grey[100],
                          borderRadius: BorderRadius.circular(5)
                      ),
                      child: SmallText(text: 'Summary',),

                    ),
                  ],
                ),
              ),
              Container(
                alignment: Alignment.center,
                width: double.maxFinite,
                padding: EdgeInsets.all(8),
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(5),
                    color: Colors.pinkAccent
                ),
                child: Center(
                    child: Text(
                      widget.match!.jsondata!.jsondata!.title.toString().split('|')[1],
                      overflow: TextOverflow.visible,
                      style: TextStyle(color: Colors.white),
                    )
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
