class MatchSt {
  String? matchname;
  String? stat1name;
  String? stat2name;
  String? stat3name;
  String? stat1descr;
  String? stat2descr;
  String? stat3descr;
  int? matchId;

  MatchSt(
      {this.matchname,
        this.stat1name,
        this.stat2name,
        this.stat3name,
        this.stat1descr,
        this.stat2descr,
        this.stat3descr,
        this.matchId});

  MatchSt.fromJson(Map<String, dynamic> json) {
    matchname = json['matchname'];
    stat1name = json['stat1name'];
    stat2name = json['stat2name'];
    stat3name = json['stat3name'];
    stat1descr = json['stat1descr'];
    stat2descr = json['stat2descr'];
    stat3descr = json['stat3descr'];
    matchId = json['MatchId'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['matchname'] = this.matchname;
    data['stat1name'] = this.stat1name;
    data['stat2name'] = this.stat2name;
    data['stat3name'] = this.stat3name;
    data['stat1descr'] = this.stat1descr;
    data['stat2descr'] = this.stat2descr;
    data['stat3descr'] = this.stat3descr;
    data['MatchId'] = this.matchId;
    return data;
  }
}
