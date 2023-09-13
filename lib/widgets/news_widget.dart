import 'package:flutter/material.dart';
import 'package:food_delivery_app/models/news_model.dart';
import 'package:food_delivery_app/pages/news/detailed_news.dart';

class NewsItemWidget extends StatelessWidget {
  final NewsModel news;

  NewsItemWidget({required this.news});

  @override
  Widget build(BuildContext context) {
    return
      news.title!=null && news.content!=null?
      GestureDetector(
      onTap: (){
        Navigator.push(
          context,
          MaterialPageRoute(
            // builder: (context) => CardDetail(title: match.title.toString(),
            //  teamA: match.teamA.toString(), teamB: match.teamB.toString(),
            // ),
            builder: (context) =>
                DetailedNews(news: news,),
          ),
        );
      },
      child: Container(
        margin: EdgeInsets.only(top: 10),
        // padding: EdgeInsets.all(10),
        child: Card(

          color: Colors.blue,
          child: Row(
            children: [
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: CircleAvatar(
                  backgroundImage: NetworkImage(news.urlToImage.toString()),
                ),
              ),
              SizedBox(width: 10,),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  Container(
                    width: 330,
                    child: Text(
                      news.title.toString(),
                      style: TextStyle(
                        overflow: TextOverflow.ellipsis,
                        // fontSize: 18.0,
                        fontWeight: FontWeight.bold,
                        color: Colors.white
                      ),
                    ),
                  ),
                  SizedBox(height: 5.0),
                  Container(
                    width: 330,
                    child: Text(
                      overflow: TextOverflow.ellipsis,
                      news.description.toString(),
                      style: TextStyle(
                        fontSize: 11.0,
                        color: Colors.white
                      ),
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    ) :Container();
  }
}
