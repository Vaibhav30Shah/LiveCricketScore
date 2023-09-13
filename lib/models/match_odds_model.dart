class MatchOdds {
  String? score;
  String? sessionA;
  String? sessionB;
  String? overs;
  int? matchId;
  String? battingteam;
  String? wickets;
  String? mrateA;
  String? mrateB;
  String? favourite;
  String? isfirstinning;
  String? subdate;
  String? teamruns;
  int? id;

  MatchOdds(
      {this.score,
        this.sessionA,
        this.sessionB,
        this.overs,
        this.matchId,
        this.battingteam,
        this.wickets,
        this.mrateA,
        this.mrateB,
        this.favourite,
        this.isfirstinning,
        this.subdate,
        this.teamruns,
        this.id});

  MatchOdds.fromJson(Map<String, dynamic> json) {
    score = json['Score'];
    sessionA = json['SessionA'];
    sessionB = json['SessionB'];
    overs = json['overs'];
    matchId = json['MatchId'];
    battingteam = json['Battingteam'];
    wickets = json['wickets'];
    mrateA = json['MrateA'];
    mrateB = json['MrateB'];
    favourite = json['favourite'];
    isfirstinning = json['isfirstinning'];
    subdate = json['subdate'];
    teamruns = json['Teamruns'];
    id = json['id'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['Score'] = this.score;
    data['SessionA'] = this.sessionA;
    data['SessionB'] = this.sessionB;
    data['overs'] = this.overs;
    data['MatchId'] = this.matchId;
    data['Battingteam'] = this.battingteam;
    data['wickets'] = this.wickets;
    data['MrateA'] = this.mrateA;
    data['MrateB'] = this.mrateB;
    data['favourite'] = this.favourite;
    data['isfirstinning'] = this.isfirstinning;
    data['subdate'] = this.subdate;
    data['Teamruns'] = this.teamruns;
    data['id'] = this.id;
    return data;
  }
}
