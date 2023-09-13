class MatchResult {
  String? title;
  String? matchtime;
  String? venue;
  int? matchId;
  String? teamA;
  String? teamB;
  String? teamAImage;
  String? matchtype;
  String? teamBImage;
  String? result;
  String? imageUrl;

  MatchResult(
      {this.title,
        this.matchtime,
        this.venue,
        this.matchId,
        this.teamA,
        this.teamB,
        this.teamAImage,
        this.matchtype,
        this.teamBImage,
        this.result,
        this.imageUrl});

  MatchResult.fromJson(Map<String, dynamic> json) {
    title = json['Title'];
    matchtime = json['Matchtime'];
    venue = json['Venue'];
    matchId = json['MatchId'];
    teamA = json['TeamA'];
    teamB = json['TeamB'];
    teamAImage = json['TeamAImage'];
    matchtype = json['Matchtype'];
    teamBImage = json['TeamBImage'];
    result = json['Result'];
    imageUrl = json['ImageUrl'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['Title'] = this.title;
    data['Matchtime'] = this.matchtime;
    data['Venue'] = this.venue;
    data['MatchId'] = this.matchId;
    data['TeamA'] = this.teamA;
    data['TeamB'] = this.teamB;
    data['TeamAImage'] = this.teamAImage;
    data['Matchtype'] = this.matchtype;
    data['TeamBImage'] = this.teamBImage;
    data['Result'] = this.result;
    data['ImageUrl'] = this.imageUrl;
    return data;
  }
}
