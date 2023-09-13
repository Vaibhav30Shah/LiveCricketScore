class GetAllPlayers {
  String? teamName;
  String? playerName;
  int? matchId;
  String? teamRuns;
  String? playerImage;
  int? runs;
  String? teamSide;
  int? balls;
  int? four;
  int? six;
  int? seqno;
  String? outby;
  int? inning;
  int? isnotout;

  GetAllPlayers(
      {this.teamName,
        this.playerName,
        this.matchId,
        this.teamRuns,
        this.playerImage,
        this.runs,
        this.teamSide,
        this.balls,
        this.four,
        this.six,
        this.seqno,
        this.outby,
        this.inning,
        this.isnotout});

  GetAllPlayers.fromJson(Map<String, dynamic> json) {
    teamName = json['TeamName'];
    playerName = json['PlayerName'];
    matchId = json['MatchId'];
    teamRuns = json['TeamRuns'];
    playerImage = json['PlayerImage'];
    runs = json['Runs'];
    teamSide = json['TeamSide'];
    balls = json['Balls'];
    four = json['four'];
    six = json['six'];
    seqno = json['seqno'];
    outby = json['outby'];
    inning = json['inning'];
    isnotout = json['isnotout'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['TeamName'] = this.teamName;
    data['PlayerName'] = this.playerName;
    data['MatchId'] = this.matchId;
    data['TeamRuns'] = this.teamRuns;
    data['PlayerImage'] = this.playerImage;
    data['Runs'] = this.runs;
    data['TeamSide'] = this.teamSide;
    data['Balls'] = this.balls;
    data['four'] = this.four;
    data['six'] = this.six;
    data['seqno'] = this.seqno;
    data['outby'] = this.outby;
    data['inning'] = this.inning;
    data['isnotout'] = this.isnotout;
    return data;
  }
}
