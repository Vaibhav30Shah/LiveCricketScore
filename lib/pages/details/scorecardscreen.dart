import 'dart:async';
import 'dart:convert';
import 'dart:developer';
import 'package:flutter/material.dart';
// import 'package:flutter_html/flutter_html.dart';
import 'package:food_delivery_app/models/genmodels/genModel.dart';
import 'package:food_delivery_app/models/genmodels/genModel2.dart';
import 'package:food_delivery_app/models/getallplayers_model.dart';
import 'package:food_delivery_app/models/match_odds_model.dart';
import 'package:food_delivery_app/models/matchst.dart';
import 'package:food_delivery_app/widgets/innings_widget.dart';
import 'package:food_delivery_app/widgets/playerScoreWidget.dart';
import 'package:http/http.dart' as http;
import '../../utils/colors.dart';
import '../../widgets/big_text.dart';

class ScorecardScreen extends StatefulWidget {
  final String title;
  final String teamA;
  final String teamB;
  final String matchId;

  const ScorecardScreen(
      {Key? key, required this.title, required this.teamA, required this.teamB, required this.matchId})
      : super(key: key);

  @override
  _ScorecardScreenState createState() => _ScorecardScreenState();
}

class _ScorecardScreenState extends State<ScorecardScreen>
    with TickerProviderStateMixin {
  var i;
  late TabController _outerTabController;
  late TabController _innerTabController;

  List<String> outerTabs = ['Scorecard', 'Match Odds', 'Match Stats'];
  List<String> teamTabs = [];
  List<String> inningsTabs = ['1st Innings', '2nd Innings'];

  List<GetAllPlayers> teamAPlayers = [];
  List<GetAllPlayers> teamBPlayers = [];
  bool isLoading = false;


  @override
  void initState() {
    super.initState();
    _outerTabController = TabController(length: outerTabs.length, vsync: this);
    _innerTabController = TabController(length: 2, vsync: this);
    // _innerTabController.addListener(_handleInnerTabChange);
    // fetchData();
    loadData();
    loadData1();
    loadHtmlData();
    fetchHtmlData();
  }

  @override
  void dispose() {
    _outerTabController.dispose();
    _innerTabController.dispose();
    super.dispose();
  }

  GetAllPlayers? getAllPlayers;
  List<GetAllPlayers> getAllNew = [];

  Future<List<GetAllPlayers>> fetchData() async {
    var url = Uri.parse('http://cricpro.cricnet.co.in/api/values/GetAllPlayers');
    var response = await http.post(url, body:  {"MatchId":widget.matchId});

    if (response.statusCode == 200) {
      var jsonData = jsonDecode(response.body);

      final matchResult1 = genModel.fromJson(jsonData);

      setState(() {
        // match=jsonData;
      });

      // matchResultNew = matchResult1.allMatch;
      getAllNew = matchResult1.playerslist
          .map<GetAllPlayers>(
              (data) => GetAllPlayers.fromJson(Map<String, dynamic>.from(data)))
          .toList();

      print("Match result : $getAllNew");

      return getAllNew;
    } else {
      throw Exception('Failed to fetch data');
    }
  }

  List<String> newTab=[];
  List<GetAllPlayers> playerData = [];
  void loadData() {
    fetchData().then((data) {
      setState(() {
        playerData = data;
        newTab = playerData.map((player) => player.teamName!).toList();
        // Update inner tab controller length
        _innerTabController =
            TabController(length: teamTabs.length, vsync: this); // Update inner tab controller length
      });
    }).catchError((error) {
      print('Error: $error');
    });
  }
  MatchSt? matchSt;
  String matchstnew = '';
  List m1=[];
  Future<String> fetchHtmlData() async {
    var url = Uri.parse('http://cricpro.cricnet.co.in/api/values/MatchStats');
    var response = await http.post(url, body:  {"MatchId":widget.matchId});

    if (response.statusCode == 200) {
      var jsonData = jsonDecode(response.body);

      final matchResult1 = genModel2.fromJson(jsonData);

      log('response: $matchResult1');
      setState(() {
        // match=jsonData;
      });

      // m1 = List<MatchSt>.from(
      //     jsonData.map((v) => MatchSt.fromJson(v)).toList());
      m1 = matchResult1.matchst;
      m1 = matchResult1.matchst
          .map<MatchSt>(
              (data) => MatchSt.fromJson(Map<String, dynamic>.from(data)))
          .toList();

      print("Match stats : $m1");

      return matchstnew;
    } else {
      throw Exception('Failed to fetch data');
    }
  }

  List<String> newHtml=[];
  String statData = '';
  void loadHtmlData() {
    fetchHtmlData().then((data) {
      setState(() {
        statData = data;
        // newHtml = statData.map((player) => player.teamName!).toList();
        // Update inner tab controller length
        // _innerTabController =
        //     TabController(length: teamTabs.length, vsync: this); // Update inner tab controller length
      });
    }).catchError((error) {
      print('Error: $error');
    });
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor:Colors.green,
      appBar: AppBar(
        backgroundColor: Color(0xC5006400),
        leading: IconButton(onPressed: (){Navigator.pop(context);},icon: Icon(Icons.arrow_back_outlined, color: Colors.white,),),
        title: Text(widget.title, style: TextStyle(color: Colors.white),),
        elevation: 0,
        bottom: TabBar(
          // padding: EdgeInsets.only(bottom: 10),
          labelColor: Colors.white,
          unselectedLabelColor: Colors.grey,
          indicatorColor: Colors.white,
          controller: _outerTabController,
          tabs: [
            for (String tab in outerTabs)
              Tab(text: tab),
          ],
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(10.0),
        child: TabBarView(
          physics: ClampingScrollPhysics(),
          controller: _outerTabController,
          children: [
            _buildScorecardTab(),
            _buildMatchOddsTab(),
            _buildMatchStatsTab(),
          ],
        ),
      ),
    );
  }

  Widget _buildScorecardTab() {
    return Column(
      children: [
        Container(
          margin: EdgeInsets.all(5),
          child: TabBar(
            dividerColor: Colors.green,
            // dividerColor: Colors.white,
            labelColor: Colors.white,
            unselectedLabelColor: Colors.grey[400],
            indicatorSize: TabBarIndicatorSize.tab,
            indicator: BoxDecoration(
                borderRadius: BorderRadius.circular(20),
                border: Border.all(width: 1, color: Colors.white)
            ),
            controller: _innerTabController,
            tabs: [
              for (String tab in teamTabs)
                Tab(text: tab),
            ],
          ),
        ),
        Expanded(
          child: TabBarView(
            controller: _innerTabController,
            children: [
              for (String team in teamTabs)
                _buildScoreTable(team),
            ],
          ),
        ),
      ],
    );
  }

  Widget _buildMatchOddsTab() {
    return Column(
      children: [
        TabBar(
          dividerColor: Colors.green,
          labelColor: Colors.white,
          unselectedLabelColor: Colors.grey[300],
          indicatorSize: TabBarIndicatorSize.tab,
          indicator: BoxDecoration(
              borderRadius: BorderRadius.circular(20),
              border: Border.all(width: 1, color: Colors.white)
          ),
          controller: _innerTabController,
          tabs: [
            for (String tab in inningsTabs)
              Tab(text: tab),
          ],
        ),
        Expanded(
          child: TabBarView(
            controller: _innerTabController,
            children: [
              for (String innings in inningsTabs)
                _buildInningsScoreTable(innings),
            ],
          ),
        ),
      ],
    );
  }

  Widget _buildMatchStatsTab() {
    return _buildMatchStats();
  }

  GetAllPlayers? pl;
  Widget _buildScoreTable(String teamName) {
    List<GetAllPlayers> players = teamName == widget.teamA ? teamAPlayers : teamBPlayers;
    double strikerate=123.4;
      return FutureBuilder<List<GetAllPlayers>>(
        // future: fetchData(),
        future: Future.value(playerData),
        builder: (BuildContext context,
            AsyncSnapshot<List<GetAllPlayers>> snapshot) {
          if (snapshot.hasData) {
            List<GetAllPlayers> filteredPlayers = snapshot.data!
                .where((player) => player.teamName == teamName)
                .toList();
            // return SingleChildScrollView(
            //   child: ListView.builder(
            //     physics: NeverScrollableScrollPhysics(),
            //     shrinkWrap: true,
            //     // itemCount: snapshot.data!.length,
            //     itemCount: filteredPlayers.length,
            //     itemBuilder: (context, position) {
            //       return Container(
            //         child: PlayerScoreWidget(
            //           batsman: filteredPlayers[position],
            //         ),
            //       );
            //     },
            //   ),
            // );
            return SingleChildScrollView(
              scrollDirection: Axis.vertical,
              child: SingleChildScrollView(
                scrollDirection: Axis.horizontal,
                child: DataTable(
                  columns: [
                    DataColumn(label: Text('Name', style: TextStyle(color: Colors.amber),)),
                    DataColumn(label: Text('Runs', style: TextStyle(color: Colors.amber),)),
                    DataColumn(label: Text('Balls', style: TextStyle(color: Colors.amber),)),
                    DataColumn(label: Text('4s', style: TextStyle(color: Colors.amber),)),
                    DataColumn(label: Text('6s', style: TextStyle(color: Colors.amber),)),
                    DataColumn(label: Text('SR', style: TextStyle(color: Colors.amber),)),
                  ],
                  rows: [
                    for (var batsman in filteredPlayers)
                      DataRow(
                        cells: [
                          DataCell(Text(batsman.playerName.toString(), style: TextStyle(color: Colors.white),)),
                          DataCell(Text(batsman.runs.toString(), style: TextStyle(color: Colors.white),)),
                          DataCell(Text(batsman.balls.toString(), style: TextStyle(color: Colors.white),)),
                          DataCell(Text(batsman.four.toString(), style: TextStyle(color: Colors.white),)),
                          DataCell(Text(batsman.six.toString(), style: TextStyle(color: Colors.white),)),
                          DataCell(Text((((batsman.runs!)/(batsman.balls!)) *100).toStringAsFixed(2), style: TextStyle(color: Colors.white),)),
                        ],
                      ),
                  ],
                ),
              ),
            );
          } else if (snapshot.hasError) {
            return Text('Error: ${snapshot.error}');
          } else {
            return CircularProgressIndicator();
          }
        },
      );
    // }else if(widget.teamB==teamName) {
    //   return FutureBuilder<List<GetAllPlayers>>(
    //     // future: fetchData(),
    //     future: Future.value(playerData),
    //     builder: (BuildContext context,
    //         AsyncSnapshot<List<GetAllPlayers>> snapshot) {
    //       if (snapshot.hasData) {
    //         return SingleChildScrollView(
    //           child: ListView.builder(
    //             physics: NeverScrollableScrollPhysics(),
    //             shrinkWrap: true,
    //             // itemCount: snapshot.data!.length,
    //             itemCount: playerData.length,
    //             itemBuilder: (context, position) {
    //               return Container(
    //                 child: PlayerScoreWidget(
    //                   batsman: playerData[position],
    //                 ),
    //               );
    //             },
    //           ),
    //         );
    //       } else if (snapshot.hasError) {
    //         return Text('Error: ${snapshot.error}');
    //       }
    //         else {
    //         return CircularProgressIndicator();
    //       }
    //     },
    //   );


  }

  MatchOdds? matchOdd;
  List<MatchOdds> matchOddsNew = [];

  Future<List<MatchOdds>> fetchDataOdds() async {
    var url = Uri.parse('http://cricpro.cricnet.co.in/api/values/MatchOdds');
    var response = await http.post(url, body: {"MatchId":widget.matchId});

    if (response.statusCode == 200) {
      var jsonData = jsonDecode(response.body);

      final matchResult1 = genModel2.fromJson(jsonData);

      setState(() {
        // match=jsonData;
      });

      // matchResultNew = matchResult1.allMatch;
      matchOddsNew = matchResult1.matchst
          .map<MatchOdds>(
              (data) => MatchOdds.fromJson(Map<String, dynamic>.from(data)))
          .toList();

      print("Match result : $matchOddsNew");

      return matchOddsNew;
    } else {
      throw Exception('Failed to fetch data');
    }
  }

  List<MatchOdds> matchOddsData = [];

  void loadData1() {
    fetchDataOdds().then((data) {
      setState(() {
        matchOddsData = data;
        newTab = matchOddsData.map((player) => player.isfirstinning!).toList();
        // Update inner tab controller length
        _innerTabController =
            TabController(length: teamTabs.length, vsync: this);
      });
    }).catchError((error) {
      print('Error: $error');
    });
  }

  Widget _buildInningsScoreTable(String inningsName) {
    return FutureBuilder<List<MatchOdds>>(
      // future: fetchData(),
      future: Future.value(matchOddsData),
      builder: (BuildContext context,
          AsyncSnapshot<List<MatchOdds>> snapshot) {
        if (snapshot.hasData) {
            List<MatchOdds> filteredPlayers = snapshot.data!
                .where((player) => player.isfirstinning == inningsName.substring(0,1))
                .toList();
          return SingleChildScrollView(
            child: ListView.builder(
              physics: NeverScrollableScrollPhysics(),
              shrinkWrap: true,
              // itemCount: snapshot.data!.length,
              itemCount: filteredPlayers.length,
              itemBuilder: (context, position) {
                return Container(
                  child: InningWidget(
                    match: filteredPlayers[position],
                  ),
                );
              },
            ),
          );
        } else if (snapshot.hasError) {
          return Text('Error: ${snapshot.error}');
        } else {
          return CircularProgressIndicator();
        }
      },
    );
  }

  Widget _buildMatchStats() {
    return FutureBuilder<String>(
      future: Future.value(matchstnew),
      builder: (context, snapshot) {
        if (snapshot.connectionState == ConnectionState.waiting) {
          return Scaffold(
            appBar: AppBar(
              title: Text('Loading'),
            ),
            body: Center(
              child: CircularProgressIndicator(),
            ),
          );
        } else if (snapshot.hasError) {
          return Scaffold(
            appBar: AppBar(
              title: Text('Error'),
            ),
            body: Center(
              child: Text('Error fetching data'),
            ),
          );
        } else {
          return Text(matchstnew);
        }
      },
    );
  }

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    // Update the teamTabs based on the received team1 and team2 values
    teamTabs = [widget.teamA, widget.teamB];
    _innerTabController = TabController(length: teamTabs.length, vsync: this);
    setState(() {}); // Trigger a rebuild to update the inner tab bar
  }

  // void _handleInnerTabChange() {
  //   setState(() {
  //     // Update the list of players based on the selected team tab
  //     String selectedTeam = teamTabs[_innerTabController.index];
  //     if (selectedTeam == widget.teamA) {
  //       // Display team A players
  //       // Set teamAPlayers as the active player list
  //       // Set teamBPlayers as an empty list
  //     } else if (selectedTeam == widget.teamB) {
  //       // Display team B players
  //       // Set teamBPlayers as the active player list
  //       // Set teamAPlayers as an empty list
  //     }
  //   });
  // }
}
class HtmlDisplayPage extends StatelessWidget {
  final String htmlContent;

  HtmlDisplayPage(this.htmlContent);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Text(htmlContent),
      ),
    );
  }
}