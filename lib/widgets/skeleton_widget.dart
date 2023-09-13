import 'package:flutter/material.dart';
import 'package:skeleton_text/skeleton_text.dart';

class SkeletonWidget extends StatelessWidget {
  final int count;
  const SkeletonWidget({Key? key, required this.count}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: count,
      itemBuilder:(BuildContext context, int index) {
        return SkeletonAnimation(
        child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          //live upcoming
          Container(
              margin: EdgeInsets.only(top: 15),
              padding: EdgeInsets.only(left: 20, right: 20),
            decoration: BoxDecoration(
                color: Colors.grey[300],
                borderRadius: BorderRadius.only(topRight: Radius.circular(10),topLeft: Radius.circular(10))
            ),
            child: Text(" ")
          // style: TextStyle(
          //       color: Colors.white,
          //       fontSize: 11
          //   ),),
          ),

          //main container
          Container(
            margin: EdgeInsets.only(left: 15, right: 15,),
            decoration: BoxDecoration(
                borderRadius: BorderRadius.only(topLeft: Radius.circular(10),topRight: Radius.circular(10)),
                gradient: LinearGradient(
                  begin: Alignment.centerLeft,
                  end: Alignment.centerRight,
                  stops: [0.5, 0.5],
                  colors: [Colors.white, Colors.grey[100]!],
                )
            ),
            child: Column(
              children: [
                //title time
                Container(
                  padding: EdgeInsets.only(left: 10, right: 10, top:10),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      // Text(match.title.toString(), style: TextStyle(fontSize: 10),),
                      // Text(match.matchtime.toString().substring(0,11),style: TextStyle(fontSize: 10, overflow: TextOverflow.ellipsis), overflow: TextOverflow.ellipsis,)
                    ],
                  ),
                ),

                //teams avatars, scores
                Container(
                  padding: EdgeInsets.only(left: 10, right: 10),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      //team 1
                      Row(
                        children: [
                          CircleAvatar(
                            radius: 30,
                            backgroundColor: Colors.grey,
                            // backgroundImage: NetworkImage("http://cricnet.co.in/ManagePlaying/TeamImages/${match.jsondata?.jsondata?.teamABanner}"),
                          ),
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Container(
                                padding: EdgeInsets.only(left: 10),
                                width: 82,
                                decoration: BoxDecoration(
                                    gradient: LinearGradient(
                                      colors: [Colors.grey, Colors.grey],
                                    ),
                                    // border: Border.all(color: Colors.blue[300]!, width: 2),
                                    borderRadius: BorderRadius.only(topRight: Radius.circular(10), bottomRight: Radius.circular(10), topLeft: Radius.circular(10))
                                ),
                                child: Text(" ", style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold, letterSpacing: 1.5),),
                              ),
                              Container(
                                width: 60,
                                padding: EdgeInsets.only(left: 10, right: 10),
                                decoration: BoxDecoration(
                                    gradient: LinearGradient(
                                      colors: [Colors.grey, Colors.grey],
                                    ),
                                    // color: Colors.blue,
                                    // border: Border.all(color: Colors.blue[300]!, width: 1),
                                    borderRadius: BorderRadius.only(bottomRight: Radius.circular(20), bottomLeft: Radius.circular(10))
                                ),
                                child: Text(" ", style: TextStyle(fontSize: 12, color: Colors.white),),
                              ),
                            ],
                          ),
                        ],
                      ),
                      Text('VS', style: TextStyle(color: Colors.grey, fontWeight: FontWeight.bold, letterSpacing: 1.2, fontSize: 16,height: 7,),),
                      //team 2
                      Row(
                        children: [
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.end,
                            children: [
                              Container(
                                padding: EdgeInsets.only(right: 10),
                                width: 82,
                                decoration: BoxDecoration(
                                    gradient: LinearGradient(
                                      colors: [Colors.grey, Colors.grey],
                                    ),
                                    // border: Border.all(color: Colors.green[300]!, width: 2),
                                    borderRadius: BorderRadius.only(topLeft: Radius.circular(10), bottomLeft: Radius.circular(10), topRight: Radius.circular(10))
                                ),
                                child: Text(" ", style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold, letterSpacing: 1.5),textDirection: TextDirection.rtl),
                              ),
                              Container(
                                width: 60,
                                padding: EdgeInsets.only(left: 10, right: 10),
                                decoration: BoxDecoration(
                                    gradient: LinearGradient(
                                      colors: [Colors.grey, Colors.grey],
                                    ),
                                    // color: Colors.green,
                                    // border: Border.all(color: Colors.green[300]!, width: 1),
                                    borderRadius: BorderRadius.only(bottomLeft: Radius.circular(20), bottomRight: Radius.circular(10))
                                ),
                                child:
                                Text(' '),
                              ),
                            ],
                          ),
                          CircleAvatar(
                            radius: 30,
                            backgroundColor: Colors.grey,
                            // backgroundImage: NetworkImage("http://cricnet.co.in/ManagePlaying/TeamImages/${match.jsondata?.jsondata?.teamBBanner}"),
                          ),
                        ],
                      )

                    ],
                  ),
                ),

                //team names
                Container(
                  padding: EdgeInsets.only(left: 10, right: 10),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      // Text("${match.jsondata?.jsondata?.teamA.toString().toUpperCase()}", style: TextStyle(color: Colors.black, fontSize: 12, fontWeight: FontWeight.bold, overflow: TextOverflow.ellipsis),),
                      // Text("${match.jsondata?.jsondata?.teamB.toString().toUpperCase()}", style: TextStyle(color: Colors.black, fontSize: 12, fontWeight: FontWeight.bold, overflow: TextOverflow.ellipsis),)
                    ],
                  ),
                ),

                //venue, desc
                Container(
                  margin: EdgeInsets.only(top:10),
                  decoration: BoxDecoration(
                      color: Colors.grey[200]
                  ),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      Expanded(
                        child: SingleChildScrollView(
                            scrollDirection: Axis.horizontal,
                            child: Padding(
                              padding: const EdgeInsets.only(left: 7, right: 7),
                              // child: Text("${match.venue.toString()} | ${match.matchtime}", style: TextStyle(color: Colors.red, fontSize: 12), textDirection: TextDirection.ltr,),
                            )),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),

          //2nd container
          Container(
            margin: EdgeInsets.only(left: 15, right: 15),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Container(
                  width: 80,
                  decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.only(bottomRight: Radius.circular(20), bottomLeft: Radius.circular(10))
                  ),
                  child: Center(child: Text(" ", style: TextStyle(fontWeight: FontWeight.bold, overflow: TextOverflow.ellipsis),)),
                ),
                Container(
                  width: 80,
                  decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.only(bottomRight: Radius.circular(10), bottomLeft: Radius.circular(20))
                  ),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      // Text("${match.jsondata?.jsondata?.rateA.toString().substring(0,2)}", style: TextStyle(color: Colors.blue, fontWeight: FontWeight.bold),),
                      Text(' ', style: TextStyle(fontWeight: FontWeight.bold),),
                      // Text("${match.jsondata?.jsondata?.rateA.toString().substring(5,7)}", style: TextStyle(color: Colors.red, fontWeight: FontWeight.bold),),
                    ],
                  ),
                )
              ],
            ),
          )
        ],
      ),);},
    );
  }
}
