class CricketMatch {
  String team1;
  String team2;
  final String winner;
  final String date;
  final String venue;
  final String startTime;

  CricketMatch({
    required this.team1,
    required this.team2,
    required this.date,
    required this.venue,
    required this.startTime,
    required this.winner
  });
}