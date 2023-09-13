import 'package:flutter/material.dart';
import 'package:food_delivery_app/models/getallplayers_model.dart';

class PlayerScoreWidget extends StatelessWidget {
  final GetAllPlayers batsman;
  const PlayerScoreWidget({Key? key, required this.batsman}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    double strikerate=123.4;
    // double strikeRate = (batsman.runs / parseDouble(batsman.balls)) * 100;
    // return ListTile(
    //       title: Text(batsman.playerName.toString()),
    //       subtitle: Column(
    //         crossAxisAlignment: CrossAxisAlignment.start,
    //         children: [
    //           Text('Runs: ${batsman.runs}'),
    //           Text('Balls: ${batsman.balls}'),
    //           Text('4s: ${batsman.four}'),
    //           Text('6s: ${batsman.six}'),
    //           Text('Strike Rate: ${strikerate.toStringAsFixed(2)}'),
    //         ],
    //       ),
    //     );
    return DataTable(
      columns: [
        DataColumn(label: Text('Name')),
        DataColumn(label: Text('Runs')),
        DataColumn(label: Text('Balls')),
        DataColumn(label: Text('4s')),
        DataColumn(label: Text('6s')),
        DataColumn(label: Text('SR')),
      ],
      rows: [
          DataRow(
            cells: [
              DataCell(Text(batsman.playerName.toString())),
              DataCell(Text(batsman.runs.toString())),
              DataCell(Text(batsman.balls.toString())),
              DataCell(Text(batsman.four.toString())),
              DataCell(Text(batsman.six.toString())),
              DataCell(Text(strikerate.toString())),
            ],
          ),
      ],
    );
  }
}
