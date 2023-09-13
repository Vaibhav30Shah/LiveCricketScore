import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:food_delivery_app/widgets/ResultWidget.dart';
import 'package:food_delivery_app/widgets/skeleton_widget.dart';
import 'package:http/http.dart' as http;
import '../../models/genmodels/genModel.dart';
import '../../models/match_result_model.dart';
import '../../widgets/match_list_widget.dart';

class Results extends StatefulWidget {
  const Results({Key? key}) : super(key: key);

  @override
  State<Results> createState() => _ResultsState();
}

class _ResultsState extends State<Results> {

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

  List<MatchResult> resultMatchesData = [];
  void loadData2() {
    fetchData().then((data) {
      setState(() {
        resultMatchesData = data;
      });
    }).catchError((error) {
      print('Error: $error');
    });
  }

  @override
  void initState() {
    super.initState();
    loadData2();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xFF000080),
      appBar: AppBar(
        backgroundColor: Color(0xFF000080),
        title: Center(child: Text('FINISHED MATCHES', style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold),)),
      ),
      body: Container(
        decoration: BoxDecoration(
          gradient: LinearGradient(
            colors: [Color(0xFF000080), Color(0xFF006400)], // Define your colors here
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
          ),
        ),
        child: resultMatchesData.length!=0?
        SingleChildScrollView(
          child: FutureBuilder<List<MatchResult>>(
            // future: fetchData(),
            future: Future.value(resultMatchesData),
            builder: (BuildContext context,
                AsyncSnapshot<List<MatchResult>> snapshot) {
              if (snapshot.hasData) {
                return ListView.builder(
                  physics: NeverScrollableScrollPhysics(),
                  shrinkWrap: true,
                  // itemCount: snapshot.data!.length,
                  itemCount: resultMatchesData.length,
                  itemBuilder: (context, position) {
                    return Container(
                      child: ResultWidget(
                        match: resultMatchesData[position],
                      ),
                    );
                  },
                );
              } else if (snapshot.hasError) {
                return Text('Error: ${snapshot.error}');
              } else {
                return CircularProgressIndicator();
              }
            },
          ),
        ):SkeletonWidget(count: 10),
      ),
    );
  }
}
