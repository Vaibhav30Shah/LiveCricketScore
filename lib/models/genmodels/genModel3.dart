class GenModel3 {
  String? status;
  int? totalResults;
  dynamic articles;

  GenModel3({this.status, this.totalResults, this.articles});

  GenModel3.fromJson(Map<String, dynamic> json) {
    status = json['status'];
    totalResults = json['totalResults'];
    articles = json['articles'];
    // if (json['articles'] != null) {
    //   articles = <dynamic>[];
    //   json['articles'].forEach((v) {
    //     articles!.add(new Articles.fromJson(v));
    //   });
    }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['status'] = this.status;
    data['totalResults'] = this.totalResults;
    data['articles']=this.articles;
    // if (this.articles != null) {
    //   data['articles'] = this.articles!.map((v) => v.toJson()).toList();
    // }
    return data;
  }
}