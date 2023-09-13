import 'dart:convert';
import 'package:food_delivery_app/models/upcoming_model.dart';
import 'package:food_delivery_app/widgets/skeleton_widget.dart';
import 'package:http/http.dart' as http;
import 'package:flutter/material.dart';
import '../../models/genmodels/genModel.dart';
import '../../widgets/match_list_widget.dart';
import '../../widgets/upcoming_widget.dart';

class Upcoming extends StatefulWidget {
  const Upcoming({Key? key}) : super(key: key);

  @override
  State<Upcoming> createState() => _UpcomingState();
}

class _UpcomingState extends State<Upcoming> {
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

  Upcoming? upcomingMatches;
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

  List<UpcomingMatches> upcomingMatchesData = [];

  void loadData1() {
    fetchUpcomingData().then((data) {
      setState(() {
        upcomingMatchesData = data;
      });
    }).catchError((error) {
      print('Error: $error');
    });
  }

  @override
  void initState() {
    super.initState();
    // fetchUpcomingData();
    loadData1();
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xFF000080),
      appBar: AppBar(
        backgroundColor: Color(0xFF000080),
        title: Center(child: Text('UPCOMING MATCHES', style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold),)),
      ),
      body: Container(
        decoration: BoxDecoration(
          gradient: LinearGradient(
            colors: [Color(0xFF000080), Color(0xFF006400)], // Define your colors here
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
          ),
        ),
        child: upcomingMatchesData.length!=0?SingleChildScrollView(
          child: FutureBuilder<List<UpcomingMatches>>(
            // future: fetchData(),
            future: Future.value(upcomingMatchesData),
            builder: (BuildContext context,
                AsyncSnapshot<List<UpcomingMatches>> snapshot) {
              if (snapshot.hasData) {
                return ListView.builder(
                  physics: NeverScrollableScrollPhysics(),
                  shrinkWrap: true,
                  // itemCount: snapshot.data!.length,
                  itemCount: upcomingMatchesData.length,
                  itemBuilder: (context, position) {
                    return Container(
                      child: UpcomingMatchesWidget(
                        match: upcomingMatchesData[position],
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
        ):SkeletonWidget(count: 10,),
      ),
    );
  }
}
