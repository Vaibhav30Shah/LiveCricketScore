import 'package:flutter/material.dart';
import 'package:food_delivery_app/models/news_model.dart';

class DetailedNews extends StatefulWidget {
  final NewsModel news;
  const DetailedNews({Key? key, required this.news}) : super(key: key);

  @override
  State<DetailedNews> createState() => _DetailedNewsState();
}

class _DetailedNewsState extends State<DetailedNews> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xFF000080),
      body: Stack(
        children: [
          SingleChildScrollView(
            child: Container(
              color: Color(0xFF000080),
              child: Column(
                children: [
                  Image.network(widget.news.urlToImage.toString()),
                  Padding(padding: EdgeInsets.all(10),
                    child: Text(widget.news.title.toString(), style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold, fontSize: 16),),
                  ),
                  Padding(padding: EdgeInsets.all(10),
                    child: Text(widget.news.content.toString(), style: TextStyle(color: Colors.white, fontSize: 11),),
                  ),
                  Padding(padding: EdgeInsets.all(10),
                    child: Text("Source: ${widget.news.source?.name.toString()}", style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold, fontSize: 11),),
                  ),
                  Padding(padding: EdgeInsets.all(10),
                    child: Text("Author: ${widget.news.author.toString()}", style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold, fontSize: 11),),
                  ),
                ],
              ),
            ),
          ),
          Positioned(
              top: 35,
              left: 10,
              child: Container(
                  decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    color: Colors.white38
                  ),
                  child: IconButton(onPressed: (){Navigator.pop(context);},icon: Icon(Icons.arrow_back_ios_new, color: Colors.white,)))),
        ],
      ),
    );
  }
}
