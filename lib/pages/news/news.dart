import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:food_delivery_app/models/genmodels/genModel.dart';
import 'package:food_delivery_app/models/genmodels/genModel3.dart';
import 'package:food_delivery_app/models/match_result_model.dart';
import 'package:food_delivery_app/models/news_model.dart';
import 'package:food_delivery_app/widgets/news_widget.dart';
import 'package:http/http.dart' as http;

class NewsPage extends StatefulWidget {
  const NewsPage({Key? key}) : super(key: key);

  @override
  State<NewsPage> createState() => _NewsPageState();
}

class _NewsPageState extends State<NewsPage> {
  PageController controller=PageController();
  @override
  void initState() {
    fetchData();
    fetchPageData();
  }

  //https://newsapi.org/v2/top-headlines?country=in&category=sports&apiKey=0e616f1090ae42c2a138fcc2b707e500


  NewsModel? newsRes;
  List<NewsModel> newsResNew = [];
  Future<List<NewsModel>> fetchData() async {
    var url = Uri.parse('https://newsapi.org/v2/everything?q=cricket&apiKey=0e616f1090ae42c2a138fcc2b707e500');
    var response = await http.get(url);

    if (response.statusCode == 200) {
      var jsonData = jsonDecode(response.body);

      final news1 = GenModel3.fromJson(jsonData);

      setState(() {
        // match=jsonData;
      });

      // matchResultNew = matchResult1.allMatch;
      newsResNew = news1.articles
          .map<NewsModel>(
              (data) => NewsModel.fromJson(Map<String, dynamic>.from(data)))
          .toList();

      print("Match result : $newsResNew");

      return newsResNew;
    } else {
      throw Exception('Failed to fetch data');
    }
  }

  NewsModel? pageNewsRes;
  List<NewsModel> pageNewsResNew = [];
  Future<List<NewsModel>> fetchPageData() async {
    var url = Uri.parse('https://newsapi.org/v2/top-headlines?country=in&category=sports&apiKey=0e616f1090ae42c2a138fcc2b707e500');
    var response = await http.get(url);

    if (response.statusCode == 200) {
      var jsonData = jsonDecode(response.body);

      final news1 = GenModel3.fromJson(jsonData);

      setState(() {
        // match=jsonData;
      });

      // matchResultNew = matchResult1.allMatch;
      pageNewsResNew = news1.articles
          .map<NewsModel>(
              (data) => NewsModel.fromJson(Map<String, dynamic>.from(data)))
          .toList();

      print("Match result : $pageNewsResNew");

      return pageNewsResNew;
    } else {
      throw Exception('Failed to fetch data');
    }
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xFF000080),
      appBar: AppBar(
        backgroundColor: Color(0xFF000080),
        title: Text('News', style: TextStyle(color: Colors.white),),
      ),
      body: 
        Column(
          children: [
            //page view
            pageNewsResNew.length!=0?
            Container(
              height: 200,
              width: 340,
              child: PageView.builder(
                  controller: controller,
                  itemCount: 10,
                  itemBuilder: (context, position){
                    return _buildPageItem(pageNewsResNew[position], position);
                  }),
            ): CircularProgressIndicator(),

            //list view
            newsResNew.length != 0
                ? Expanded(
                  child: Container(
              decoration: BoxDecoration(
                  gradient: LinearGradient(
                    colors: [Color(0xFF000080), Color(0xFF006400)], // Define your colors here
                    begin: Alignment.topCenter,
                    end: Alignment.bottomCenter,
                  ),
              ),
              child: ListView.builder(
                  // physics: AlwaysScrollableScrollPhysics(),
                  shrinkWrap: true,
                  itemCount: newsResNew.length,
                  itemBuilder: (context, position) {
                    return NewsItemWidget(
                      news: newsResNew[position],
                    );
                  },
              ),
            ),
                )
                : Center(
              child: CircularProgressIndicator(
                valueColor: AlwaysStoppedAnimation<Color>(Colors.white),
                strokeWidth: 5.0,
                semanticsLabel: 'Loading...',
              ),
            ),
          ],
        )
    );
  }

  Widget _buildPageItem(NewsModel news, int index) {
    Matrix4 matrix = new Matrix4.identity();
    // if (index == _currPageValue.floor()) {
    //   var currScale = 1 - (_currPageValue - index) * (1 - scaleFactor);
    //   var currTrans = height * (1 - currScale) / 2;
    //   matrix = Matrix4.diagonal3Values(1, currScale, 1)
    //     ..setTranslationRaw(0, currTrans, 0);
    // } else if (index == _currPageValue.floor() + 1) {
    //   var currScale =
    //       scaleFactor + (_currPageValue - index + 1) * (1 - scaleFactor);
    //   var currTrans = height * (1 - currScale) / 2;
    //   matrix = Matrix4.diagonal3Values(1, currScale, 1);
    //   matrix = Matrix4.diagonal3Values(1, currScale, 1)
    //     ..setTranslationRaw(0, currTrans, 0);
    //   ;
    // } else if (index == _currPageValue.floor() - 1) {
    //   var currScale = 1 - (_currPageValue - index) * (1 - scaleFactor);
    //   var currTrans = height * (1 - currScale) / 2;
    //   matrix = Matrix4.diagonal3Values(1, currScale, 1);
    //   matrix = Matrix4.diagonal3Values(1, currScale, 1)
    //     ..setTranslationRaw(0, currTrans, 0);
    // } else {
    //   var currScale = 0.8;
    //   matrix = Matrix4.diagonal3Values(1, currScale, 1)
    //     ..setTranslationRaw(0, height * (1 - scaleFactor) / 2, 1);
    // }
    // String? t1 = flags[match.teamA];
    // String? t2 = flags[match.teamB];
    return GestureDetector(
      onTap: () {
        //   Navigator.push(
        //       context
        //       // MaterialPageRoute(
        //       //     builder: (context) => LiveLineMatches(
        //       //       // title: match.title.toString(),
        //       //       // teamA: match.teamA.toString(),
        //       //       // teamB: match.teamB.toString(),
        //       //       // matchId: match.matchId.toString(),
        //       //       // teamAImage: match.,
        //       //       match: match,
        //       //     )));
      },
      child: Transform(
          alignment: Alignment.center,
          transform: matrix,
          child: Container(
            margin: EdgeInsets.all(10),
            // color: Colors.red,
            width: 350,
            height: 200,
            decoration: BoxDecoration(
              color: Color(0xFF000080),
              borderRadius: BorderRadius.circular(30),
            ),
            child: Stack(children: [
              Image.network(news.urlToImage.toString(), fit: BoxFit.fill),
              Positioned(
                  bottom: 20,
                  child: Padding(
                    padding: const EdgeInsets.only(left: 8.0),
                    child: Container(
                        width: 300,
                        child: Text(news.content.toString(), style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold),overflow: TextOverflow.ellipsis,)),
                  ))
            ]),

          )
        // child: Column(
        //   children: [
        //     Expanded(
        //       child: Container(
        //         height: Dimensions.pageViewContainer,
        //         margin: EdgeInsets.only(
        //             left: Dimensions.height10, right: Dimensions.height10),
        //         decoration: BoxDecoration(
        //           borderRadius: BorderRadius.circular(30),
        //           color: Colors.red,
        //           // color: Colors.pink[200]!,
        //           boxShadow: [
        //             BoxShadow(
        //               color: Colors.white60,
        //               blurRadius: 5.0,
        //               offset: Offset(0, 5),
        //             )
        //           ],
        //         ),
        //         child: Container(
        //           width: double.maxFinite,
        //           padding: EdgeInsets.only(
        //               top: Dimensions.height10,
        //               left: Dimensions.height20,
        //               right: Dimensions.height20),
        //           child: Column(
        //             children: [
        //               SmallText(
        //                 text: match.title.toString(),
        //                 color: AppColors.paraColor,
        //               ),
        //               BigText(
        //                 text: match.matchType.toString(),
        //                 color: Colors.white,
        //               ),
        //               SizedBox(
        //                 height: Dimensions.height10,
        //               ),
        //               match.jsondata.toString()!=''?
        //               Row(
        //                 mainAxisAlignment: MainAxisAlignment.spaceBetween,
        //                 children: [
        //                   match.jsondata.toString()!=""?
        //                   ImageAndText(
        //                     image:
        //                     match.jsondata.toString()!=''?
        //                         'http://cricnet.co.in/ManagePlaying/TeamImages/thumb/${match.jsondata!.jsondata!.teamABanner.toString()}':'',
        //                     text: match.jsondata!.jsondata!.teamA.toString(),
        //                     color: Colors.white,
        //                   ):BigText(text: 'Unavailable'),
        //                   match.jsondata.toString()!=""?
        //                   ImageAndText(
        //                     image:
        //                         'http://cricnet.co.in/ManagePlaying/TeamImages/thumb/${match.jsondata!.jsondata!.teamBBanner.toString()}',
        //                     text: match.jsondata!.jsondata!.teamB.toString(),
        //                     color: Colors.white,
        //                   ):BigText(text: 'Unavailable')
        //                 ],
        //               ):BigText(text: 'Match Details Unavailable at the moment'),
        //               SizedBox(
        //                 height: Dimensions.height10,
        //               ),
        //               // Row(
        //               //   children: [
        //               //     Icon(Icons.location_on, color: AppColors.iconColor1,),
        //               //     SizedBox(width: Dimensions.width10,),
        //               //     Text(match.venue.toString(), overflow: TextOverflow.ellipsis,),
        //               //   ],
        //               // ),
        //               Row(
        //                 mainAxisAlignment: MainAxisAlignment.spaceBetween,
        //                 children: [
        //                   Text(
        //                     match.jsondata!.jsondata!.wicketA.toString(),
        //                     style: TextStyle(
        //                       color: Colors.white,
        //                       fontSize: 16,
        //                     ),
        //                   ),
        //                   Text(
        //                     match.jsondata!.jsondata!.wicketB.toString(),
        //                     style: TextStyle(
        //                       color: Colors.white,
        //                       fontSize: 16,
        //                     ),
        //                   ),
        //                 ],
        //               ),
        //               SizedBox(
        //                 height: Dimensions.height10,
        //               ),
        //               Row(
        //                 mainAxisAlignment: MainAxisAlignment.spaceBetween,
        //                 children: [
        //                   match.jsondata!.jsondata!.oversA!.length <= 5
        //                       ? Text(
        //                           'Overs: (${match.jsondata!.jsondata!.oversA.toString()})',
        //                           style: TextStyle(
        //                             color: Colors.grey,
        //                             fontSize: 12,
        //                           ),
        //                         )
        //                       : Text(''),
        //                   match.jsondata!.jsondata!.oversB!.length <= 5
        //                       ? Text(
        //                           'Overs: ${match.jsondata!.jsondata!.oversB.toString()}',
        //                           style: TextStyle(
        //                             color: Colors.grey,
        //                             fontSize: 16,
        //                           ),
        //                         )
        //                       : Text(''),
        //                 ],
        //               ),
        //               SizedBox(
        //                 height: Dimensions.height20,
        //               ),
        //               Row(
        //                 mainAxisSize: MainAxisSize.min,
        //                 children: [
        //                   IconAndText(
        //                     icon: Icons.location_on,
        //                     text: match.venue.toString(),
        //                     color: AppColors.iconColor1,
        //                     textColor: Colors.white,
        //                     overflow: TextOverflow.ellipsis,
        //                   ),
        //                 ],
        //               ),
        //               SizedBox(
        //                 height: Dimensions.height15,
        //               ),
        //               Row(
        //                 mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        //                 children: [
        //                   IconAndText(
        //                     icon: Icons.date_range,
        //                     text: match.matchtime.toString().substring(0, 11),
        //                     color: AppColors.mainColor,
        //                     textColor: Colors.white,
        //                   ),
        //                   IconAndText(
        //                     icon: Icons.access_time_rounded,
        //                     text: match.title.toString().substring(4) ==
        //                             'Test Match'
        //                         ? match.matchtime.toString().substring(28)
        //                         : match.matchtime.toString().substring(15),
        //                     color: AppColors.iconColor2,
        //                     textColor: Colors.white,
        //                   )
        //                 ],
        //               ),
        //               SizedBox(
        //                 height: Dimensions.height10,
        //               ),
        //               Text(
        //                 match.result.toString(),
        //                 style: TextStyle(
        //                   color: Colors.white,
        //                   fontSize: 16,
        //                 ),
        //               ),
        //             ],
        //           ),
        //         ),
        //       ),
        //     ),
        //   ],
        // ),
      ),
    );
  }
}
