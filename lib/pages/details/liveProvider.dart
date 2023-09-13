import 'dart:convert';
import 'dart:developer';

import 'package:flutter/cupertino.dart';

import '../../models/livelineget_model.dart';
import 'package:http/http.dart' as http;

class LiveProvider extends ChangeNotifier{
  LiveLineMatchModel? liveMatches;
  List<LiveLineMatchModel> liveMatchesNew = [];

  Future<List<LiveLineMatchModel>> fetchLiveData() async {
    var url = Uri.parse('http://cricpro.cricnet.co.in/api/values/LiveLine');
    var response = await http.get(url);

    if (response.statusCode == 200) {
      dynamic jsonData = json.decode(response.body);
      log(jsonData.toString());
      // final up = LiveLineMatchModel.fromJson(jsonData);
// hot restart
//       setState(() {
//         // match=jsonData;
//       });
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
  notifyListeners();

}