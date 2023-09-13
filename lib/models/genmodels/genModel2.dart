class genModel2 {
  dynamic matchst;
  bool? success;
  String? msg;

  genModel2({this.matchst, this.success, this.msg});

  genModel2.fromJson(Map<String, dynamic> json) {
    // if (json['Matchst'] != null) {
    //   matchst = <Matchst>[];
    //   json['Matchst'].forEach((v) {
    //     matchst!.add(new Matchst.fromJson(v));
    //   });
    // }
    matchst=json['Matchst'];
    success = json['success'];
    msg = json['msg'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    // if (this.matchst != null) {
    //   data['Matchst'] = this.matchst!.map((v) => v.toJson()).toList();
    // }
    data['Matchst']=this.matchst;
    data['success'] = this.success;
    data['msg'] = this.msg;
    return data;
  }
}