import 'package:flutter/material.dart';
import 'dart:math' as math;

class HomeWidget extends StatefulWidget {
  @override
  _HomeWidgetState createState() => _HomeWidgetState();
}

class _HomeWidgetState extends State<HomeWidget> {
  @override
  Widget build(BuildContext context) {
    // Figma Flutter Generator HomeWidget - FRAME

    return Container(
        width: 414,
        height: 896,
        decoration: BoxDecoration(
          color : Color.fromRGBO(250, 250, 250, 1),
        ),
        child: Stack(
            children: <Widget>[
              Positioned(
                  top: 824,
                  left: 0,
                  child: Container(
                      width: 414,
                      height: 72,

                      child: Stack(
                          children: <Widget>[
                            Positioned(
                                top: 0,
                                left: 0,
                                child: Container(
                                    width: 414,
                                    height: 72,
                                    decoration: BoxDecoration(
                                      boxShadow : [BoxShadow(
                                          color: Color.fromRGBO(0, 0, 0, 0.11999999731779099),
                                          offset: Offset(0,2),
                                          blurRadius: 48
                                      )],
                                      color : Color.fromRGBO(255, 255, 255, 1),
                                    )
                                )
                            ),Positioned(
                                top: 25.22564125061035,
                                left: 348.1257019042969,
                                child: Container(
                                    width: 23.428571701049805,
                                    height: 21.430255889892578,

                                    child: Stack(
                                        children: <Widget>[
                                          Positioned(
                                              top: 0,
                                              left: 6,
                                              child: Text('')
                                          ),Positioned(
                                              top: 12.970074653625488,
                                              left: 0,
                                              child: Image.asset(
                                                  'assets/images/shape.svg',
                                              )
                                          ),
                                        ]
                                    )
                                )
                            ),Positioned(
                                top: 25,
                                left: 246,
                                child: Text('')
                            ),Positioned(
                                top: 26,
                                left: 145,
                                child: Container(
                                    width: 21,
                                    height: 21,

                                    child: Stack(
                                        children: <Widget>[
                                          Positioned(
                                              top: 0,
                                              left: 0,
                                              child: Container(
                                                  width: 18.66666603088379,
                                                  height: 18.66666603088379,
                                                  decoration: BoxDecoration(
                                                    border : Border.all(
                                                      color: Color.fromRGBO(214, 204, 203, 1),
                                                      width: 2,
                                                    ),
                                                    borderRadius : BorderRadius.all(Radius.elliptical(18.66666603088379, 18.66666603088379)),
                                                  )
                                              )
                                          ),Positioned(
                                              top: 15.9249849319458,
                                              left: 15.925041198730469,
                                              child: Image.asset(
                                                  'assets/images/path.svg',

                                              )
                                          ),
                                        ]
                                    )
                                )
                            ),Positioned(
                                top: 25,
                                left: 42,
                                child: Container(
                                    width: 23,
                                    height: 30,

                                    child: Stack(
                                        children: <Widget>[
                                          Positioned(
                                              top: 0,
                                              left: 0,
                                              child: Text('')
                                          ),Positioned(
                                              top: 29,
                                              left: 0,
                                              child: Image.asset(
                                                  'assets/images/line.svg',

                                              )
                                          ),
                                        ]
                                    )
                                )
                            ),
                          ]
                      )
                  )
              ),Positioned(
                  top: 495,
                  left: 14,
                  child: Container(
                      width: 386,
                      height: 307,

                      child: Stack(
                          children: <Widget>[
                            Positioned(
                                top: 0,
                                left: 0,
                                child: Container(
                                    width: 386,
                                    height: 19,
                                    decoration: BoxDecoration(
                                      color : Color.fromRGBO(255, 255, 255, 1),
                                    ),
                                    child: Stack(
                                        children: <Widget>[
                                          Positioned(
                                              top: 0,
                                              left: 0,
                                              child: Text(' Live Scores', textAlign: TextAlign.left, style: TextStyle(
                                                  color: Color.fromRGBO(46, 51, 51, 1),
                                                  fontFamily: 'Poppins',
                                                  fontSize: 16,
                                                  letterSpacing: 1,
                                                  fontWeight: FontWeight.normal,
                                                  height: 1
                                              ),)
                                          ),Positioned(
                                              top: 3,
                                              left: 323,
                                              child: Text('See More', textAlign: TextAlign.right, style: TextStyle(
                                                  color: Color.fromRGBO(46, 51, 51, 1),
                                                  fontFamily: 'Poppins',
                                                  fontSize: 12,
                                                  letterSpacing: 1,
                                                  fontWeight: FontWeight.normal,
                                                  height: 1
                                              ),)
                                          ),
                                        ]
                                    )
                                )
                            ),Positioned(
                                top: 39,
                                left: 0,
                                child: Container(
                                    width: 386,
                                    height: 127,
                                    decoration: BoxDecoration(
                                      color : Color.fromRGBO(255, 255, 255, 1),
                                    ),
                                    child: Stack(
                                        children: <Widget>[
                                          Positioned(
                                              top: 0,
                                              left: 0,
                                              child: Container(
                                                  width: 386,
                                                  height: 127,
                                                  decoration: BoxDecoration(
                                                    borderRadius : BorderRadius.only(
                                                      topLeft: Radius.circular(24),
                                                      topRight: Radius.circular(24),
                                                      bottomLeft: Radius.circular(24),
                                                      bottomRight: Radius.circular(24),
                                                    ),
                                                    boxShadow : [BoxShadow(
                                                        color: Color.fromRGBO(0, 0, 0, 0.03999999910593033),
                                                        offset: Offset(0,2),
                                                        blurRadius: 48
                                                    )],
                                                    color : Color.fromRGBO(255, 255, 255, 1),
                                                    border : Border.all(
                                                      color: Color.fromRGBO(242, 0, 14, 1),
                                                      width: 0.5,
                                                    ),
                                                  )
                                              )
                                          ),Positioned(
                                              top: 14,
                                              left: 20,
                                              child: Container(
                                                  width: 60,
                                                  height: 90,
                                                  decoration: BoxDecoration(
                                                    color : Color.fromRGBO(255, 255, 255, 1),
                                                  ),
                                                  child: Stack(
                                                      children: <Widget>[
                                                        Positioned(
                                                            top: 0,
                                                            left: 0,
                                                            child:  //Mask holder Template
                                                            Container(
                                                                width: 60,
                                                                height: 60,
                                                                child: null
                                                            )
                                                        ),Positioned(
                                                            top: 74,
                                                            left: 7.5,
                                                            child: Text('Spain', textAlign: TextAlign.center, style: TextStyle(
                                                                color: Color.fromRGBO(46, 51, 51, 1),
                                                                fontFamily: 'Poppins',
                                                                fontSize: 14,
                                                                letterSpacing: 1,
                                                                fontWeight: FontWeight.normal,
                                                                height: 1
                                                            ),)
                                                        ),
                                                      ]
                                                  )
                                              )
                                          ),Positioned(
                                              top: 29,
                                              left: 168,
                                              child: Text('1 : 0', textAlign: TextAlign.center, style: TextStyle(
                                                  color: Color.fromRGBO(46, 51, 51, 1),
                                                  fontFamily: 'Poppins',
                                                  fontSize: 26,
                                                  letterSpacing: 1,
                                                  fontWeight: FontWeight.normal,
                                                  height: 1
                                              ),)
                                          ),Positioned(
                                              top: 14,
                                              left: 308,
                                              child: Container(
                                                  width: 60,
                                                  height: 90,
                                                  decoration: BoxDecoration(
                                                    color : Color.fromRGBO(255, 255, 255, 1),
                                                  ),
                                                  child: Stack(
                                                      children: <Widget>[
                                                        Positioned(
                                                            top: 0,
                                                            left: 0,
                                                            child:  //Mask holder Template
                                                            Container(
                                                                width: 60,
                                                                height: 60,
                                                                child: null
                                                            )
                                                        ),Positioned(
                                                            top: 74,
                                                            left: 13,
                                                            child: Text('Italy', textAlign: TextAlign.center, style: TextStyle(
                                                                color: Color.fromRGBO(46, 51, 51, 1),
                                                                fontFamily: 'Poppins',
                                                                fontSize: 14,
                                                                letterSpacing: 1,
                                                                fontWeight: FontWeight.normal,
                                                                height: 1
                                                            ),)
                                                        ),
                                                      ]
                                                  )
                                              )
                                          ),Positioned(
                                              top: 79,
                                              left: 152,
                                              child: Container(
                                                  width: 82,
                                                  height: 34,
                                                  decoration: BoxDecoration(
                                                    color : Color.fromRGBO(255, 255, 255, 1),
                                                  ),
                                                  child: Stack(
                                                      children: <Widget>[
                                                        Positioned(
                                                            top: 0,
                                                            left: 0,
                                                            child: Container(
                                                                width: 82,
                                                                height: 34,
                                                                decoration: BoxDecoration(
                                                                  borderRadius : BorderRadius.only(
                                                                    topLeft: Radius.circular(10),
                                                                    topRight: Radius.circular(10),
                                                                    bottomLeft: Radius.circular(10),
                                                                    bottomRight: Radius.circular(10),
                                                                  ),
                                                                  color : Color.fromRGBO(246, 246, 246, 1),
                                                                )
                                                            )
                                                        ),Positioned(
                                                            top: 10,
                                                            left: 10,
                                                            child: Container(
                                                                width: 14,
                                                                height: 14,

                                                                child: Stack(
                                                                    children: <Widget>[
                                                                      Positioned(
                                                                          top: 0,
                                                                          left: 0,
                                                                          child: Container(
                                                                              width: 14,
                                                                              height: 14,
                                                                              decoration: BoxDecoration(
                                                                                border : Border.all(
                                                                                  color: Color.fromRGBO(204, 213, 212, 1),
                                                                                  width: 1.399999976158142,
                                                                                ),
                                                                                borderRadius : BorderRadius.all(Radius.elliptical(14, 14)),
                                                                              )
                                                                          )
                                                                      ),Positioned(
                                                                          top: 2.799999952316284,
                                                                          left: 7,
                                                                          child: Image.asset(
                                                                              'assets/images/path.svg',

                                                                          )
                                                                      ),
                                                                    ]
                                                                )
                                                            )
                                                        ),Positioned(
                                                            top: 10,
                                                            left: 32,
                                                            child: Text('82:15', textAlign: TextAlign.left, style: TextStyle(
                                                                color: Color.fromRGBO(128, 134, 133, 1),
                                                                fontFamily: 'Poppins',
                                                                fontSize: 12,
                                                                letterSpacing: 1,
                                                                fontWeight: FontWeight.normal,
                                                                height: 1
                                                            ),)
                                                        ),
                                                      ]
                                                  )
                                              )
                                          ),
                                        ]
                                    )
                                )
                            ),Positioned(
                                top: 180,
                                left: 0,
                                child: Container(
                                    width: 386,
                                    height: 127,
                                    decoration: BoxDecoration(
                                      color : Color.fromRGBO(255, 255, 255, 1),
                                    ),
                                    child: Stack(
                                        children: <Widget>[
                                          Positioned(
                                              top: 0,
                                              left: 0,
                                              child: Container(
                                                  width: 386,
                                                  height: 127,
                                                  decoration: BoxDecoration(
                                                    borderRadius : BorderRadius.only(
                                                      topLeft: Radius.circular(24),
                                                      topRight: Radius.circular(24),
                                                      bottomLeft: Radius.circular(24),
                                                      bottomRight: Radius.circular(24),
                                                    ),
                                                    boxShadow : [BoxShadow(
                                                        color: Color.fromRGBO(0, 0, 0, 0.03999999910593033),
                                                        offset: Offset(0,2),
                                                        blurRadius: 48
                                                    )],
                                                    color : Color.fromRGBO(255, 255, 255, 1),
                                                    border : Border.all(
                                                      color: Color.fromRGBO(242, 0, 14, 1),
                                                      width: 0.5,
                                                    ),
                                                  )
                                              )
                                          ),Positioned(
                                              top: 15,
                                              left: 18,
                                              child: Container(
                                                  width: 67,
                                                  height: 90,
                                                  decoration: BoxDecoration(
                                                    color : Color.fromRGBO(255, 255, 255, 1),
                                                  ),
                                                  child: Stack(
                                                      children: <Widget>[
                                                        Positioned(
                                                            top: 0,
                                                            left: 3,
                                                            child:  //Mask holder Template
                                                            Container(
                                                                width: 60,
                                                                height: 60,
                                                                child: null
                                                            )
                                                        ),Positioned(
                                                            top: 74,
                                                            left: 6,
                                                            child: Text('France', textAlign: TextAlign.center, style: TextStyle(
                                                                color: Color.fromRGBO(46, 51, 51, 1),
                                                                fontFamily: 'Poppins',
                                                                fontSize: 14,
                                                                letterSpacing: 1,
                                                                fontWeight: FontWeight.normal,
                                                                height: 1
                                                            ),)
                                                        ),
                                                      ]
                                                  )
                                              )
                                          ),Positioned(
                                              top: 29,
                                              left: 165,
                                              child: Text('2 : 4', textAlign: TextAlign.center, style: TextStyle(
                                                  color: Color.fromRGBO(46, 51, 51, 1),
                                                  fontFamily: 'Poppins',
                                                  fontSize: 26,
                                                  letterSpacing: 1,
                                                  fontWeight: FontWeight.normal,
                                                  height: 1
                                              ),)
                                          ),Positioned(
                                              top: 15,
                                              left: 309,
                                              child: Container(
                                                  width: 60,
                                                  height: 90,
                                                  decoration: BoxDecoration(
                                                    color : Color.fromRGBO(255, 255, 255, 1),
                                                  ),
                                                  child: Stack(
                                                      children: <Widget>[
                                                        Positioned(
                                                            top: 0,
                                                            left: 0,
                                                            child:  //Mask holder Template
                                                            Container(
                                                                width: 60,
                                                                height: 60,
                                                                child: null
                                                            )
                                                        ),Positioned(
                                                            top: 74,
                                                            left: 9.5,
                                                            child: Text('Brazil', textAlign: TextAlign.center, style: TextStyle(
                                                                color: Color.fromRGBO(46, 51, 51, 1),
                                                                fontFamily: 'Poppins',
                                                                fontSize: 14,
                                                                letterSpacing: 1,
                                                                fontWeight: FontWeight.normal,
                                                                height: 1
                                                            ),)
                                                        ),
                                                      ]
                                                  )
                                              )
                                          ),Positioned(
                                              top: 79,
                                              left: 152,
                                              child: Container(
                                                  width: 82,
                                                  height: 34,
                                                  decoration: BoxDecoration(
                                                    color : Color.fromRGBO(255, 255, 255, 1),
                                                  ),
                                                  child: Stack(
                                                      children: <Widget>[
                                                        Positioned(
                                                            top: 0,
                                                            left: 0,
                                                            child: Container(
                                                                width: 82,
                                                                height: 34,
                                                                decoration: BoxDecoration(
                                                                  borderRadius : BorderRadius.only(
                                                                    topLeft: Radius.circular(10),
                                                                    topRight: Radius.circular(10),
                                                                    bottomLeft: Radius.circular(10),
                                                                    bottomRight: Radius.circular(10),
                                                                  ),
                                                                  color : Color.fromRGBO(246, 246, 246, 1),
                                                                )
                                                            )
                                                        ),Positioned(
                                                            top: 10,
                                                            left: 10,
                                                            child: Container(
                                                                width: 14,
                                                                height: 14,

                                                                child: Stack(
                                                                    children: <Widget>[
                                                                      Positioned(
                                                                          top: 0,
                                                                          left: 0,
                                                                          child: Container(
                                                                              width: 14,
                                                                              height: 14,
                                                                              decoration: BoxDecoration(
                                                                                border : Border.all(
                                                                                  color: Color.fromRGBO(204, 213, 212, 1),
                                                                                  width: 1.399999976158142,
                                                                                ),
                                                                                borderRadius : BorderRadius.all(Radius.elliptical(14, 14)),
                                                                              )
                                                                          )
                                                                      ),Positioned(
                                                                          top: 2.799999952316284,
                                                                          left: 7,
                                                                          child: Image.asset(
                                                                              'assets/images/path.svg',

                                                                          )
                                                                      ),
                                                                    ]
                                                                )
                                                            )
                                                        ),Positioned(
                                                            top: 10,
                                                            left: 32,
                                                            child: Text('84:23', textAlign: TextAlign.left, style: TextStyle(
                                                                color: Color.fromRGBO(128, 134, 133, 1),
                                                                fontFamily: 'Poppins',
                                                                fontSize: 12,
                                                                letterSpacing: 1,
                                                                fontWeight: FontWeight.normal,
                                                                height: 1
                                                            ),)
                                                        ),
                                                      ]
                                                  )
                                              )
                                          ),
                                        ]
                                    )
                                )
                            ),
                          ]
                      )
                  )
              ),Positioned(
                  top: 268,
                  left: 14,
                  child: Container(
                      width: 386,
                      height: 193,

                      child: Stack(
                          children: <Widget>[
                            Positioned(
                                top: 0,
                                left: 0,
                                child: Container(
                                    width: 386,
                                    height: 193,
                                    decoration: BoxDecoration(
                                      borderRadius : BorderRadius.only(
                                        topLeft: Radius.circular(24),
                                        topRight: Radius.circular(24),
                                        bottomLeft: Radius.circular(24),
                                        bottomRight: Radius.circular(24),
                                      ),
                                      color : Color.fromRGBO(242, 0, 15, 1),
                                    )
                                )
                            ),Positioned(
                                top: 28,
                                left: 50,
                                child: Container(
                                    width: 286,
                                    height: 139,

                                    child: Stack(
                                        children: <Widget>[
                                          Positioned(
                                              top: 0,
                                              left: 0,
                                              child: Container(
                                                  width: 84,
                                                  height: 139,

                                                  child: Stack(
                                                      children: <Widget>[
                                                        Positioned(
                                                            top: 0,
                                                            left: 0,
                                                            child:  //Mask holder Template
                                                            Container(
                                                              width: 84,
                                                              height: 84,
                                                              child: ClipOval(
                                                                child: Stack(
                                                                    children: <Widget>[
                                                                      Positioned(
                                                                          top: 0,
                                                                          left: 0,
                                                                          child: Container(
                                                                              width: 84,
                                                                              height: 84,
                                                                              decoration: BoxDecoration(
                                                                                color : Color.fromRGBO(216, 216, 216, 1),
                                                                                borderRadius : BorderRadius.all(Radius.elliptical(84, 84)),
                                                                              )
                                                                          )
                                                                      ),Positioned(
                                                                          top: 0,
                                                                          left: -11,
                                                                          child: Container(
                                                                              width: 107,
                                                                              height: 84,
                                                                              decoration: BoxDecoration(
                                                                                image : DecorationImage(
                                                                                    image: AssetImage('assets/images/Capturadepantalla20221114alas11042.png'),
                                                                                    fit: BoxFit.fitWidth
                                                                                ),
                                                                              )
                                                                          )
                                                                      ),
                                                                    ]
                                                                ),
                                                              ),
                                                            )
                                                        ),Positioned(
                                                            top: 96,
                                                            left: 2,
                                                            child: Container(
                                                                width: 81,
                                                                height: 43,
                                                                decoration: BoxDecoration(
                                                                  color : Color.fromRGBO(255, 255, 255, 1),
                                                                ),
                                                                child: Stack(
                                                                    children: <Widget>[
                                                                      Positioned(
                                                                          top: 0,
                                                                          left: -1,
                                                                          child: Text('Barcelona', textAlign: TextAlign.center, style: TextStyle(
                                                                              color: Color.fromRGBO(255, 255, 255, 1),
                                                                              fontFamily: 'Poppins',
                                                                              fontSize: 14,
                                                                              letterSpacing: 1,
                                                                              fontWeight: FontWeight.normal,
                                                                              height: 1
                                                                          ),)
                                                                      ),Positioned(
                                                                          top: 26,
                                                                          left: 21,
                                                                          child: Text('Spain', textAlign: TextAlign.center, style: TextStyle(
                                                                              color: Color.fromRGBO(234, 234, 234, 1),
                                                                              fontFamily: 'Poppins',
                                                                              fontSize: 12,
                                                                              letterSpacing: 1,
                                                                              fontWeight: FontWeight.normal,
                                                                              height: 1
                                                                          ),)
                                                                      ),
                                                                    ]
                                                                )
                                                            )
                                                        ),
                                                      ]
                                                  )
                                              )
                                          ),Positioned(
                                              top: 12,
                                              left: 114,
                                              child: Container(
                                                  width: 58,
                                                  height: 60,
                                                  decoration: BoxDecoration(
                                                    color : Color.fromRGBO(255, 255, 255, 1),
                                                  ),
                                                  child: Stack(
                                                      children: <Widget>[
                                                        Positioned(
                                                            top: 29,
                                                            left: 6,
                                                            child: Text('2 - 1', textAlign: TextAlign.center, style: TextStyle(
                                                                color: Color.fromRGBO(240, 240, 240, 1),
                                                                fontFamily: 'Poppins',
                                                                fontSize: 22,
                                                                letterSpacing: 1,
                                                                fontWeight: FontWeight.normal,
                                                                height: 1
                                                            ),)
                                                        ),
                                                      ]
                                                  )
                                              )
                                          ),Positioned(
                                              top: 12,
                                              left: 111,
                                              child: Text('14 Nov 22', textAlign: TextAlign.center, style: TextStyle(
                                                  color: Color.fromRGBO(243, 243, 243, 1),
                                                  fontFamily: 'Poppins',
                                                  fontSize: 12,
                                                  letterSpacing: 1,
                                                  fontWeight: FontWeight.normal,
                                                  height: 1
                                              ),)
                                          ),Positioned(
                                              top: 0,
                                              left: 202,
                                              child: Container(
                                                  width: 84,
                                                  height: 139,

                                                  child: Stack(
                                                      children: <Widget>[
                                                        Positioned(
                                                            top: 0,
                                                            left: 0,
                                                            child:  //Mask holder Template
                                                            Container(
                                                              width: 84,
                                                              height: 84,
                                                              child: ClipOval(
                                                                child: Stack(
                                                                    children: <Widget>[
                                                                      Positioned(
                                                                          top: 0,
                                                                          left: 0,
                                                                          child: Container(
                                                                              width: 84,
                                                                              height: 84,
                                                                              decoration: BoxDecoration(
                                                                                color : Color.fromRGBO(216, 216, 216, 1),
                                                                                borderRadius : BorderRadius.all(Radius.elliptical(84, 84)),
                                                                              )
                                                                          )
                                                                      ),Positioned(
                                                                          top: -10,
                                                                          left: -36,
                                                                          child: Container(
                                                                              width: 147,
                                                                              height: 107,
                                                                              decoration: BoxDecoration(
                                                                                image : DecorationImage(
                                                                                    image: AssetImage('assets/images/Capturadepantalla20221114alas11041.png'),
                                                                                    fit: BoxFit.fitWidth
                                                                                ),
                                                                              )
                                                                          )
                                                                      ),
                                                                    ]
                                                                ),
                                                              ),
                                                            )
                                                        ),Positioned(
                                                            top: 96,
                                                            left: 6,
                                                            child: Container(
                                                                width: 73,
                                                                height: 43,
                                                                decoration: BoxDecoration(
                                                                  color : Color.fromRGBO(255, 255, 255, 1),
                                                                ),
                                                                child: Stack(
                                                                    children: <Widget>[
                                                                      Positioned(
                                                                          top: 0,
                                                                          left: -2,
                                                                          child: Text('Juventus', textAlign: TextAlign.center, style: TextStyle(
                                                                              color: Color.fromRGBO(255, 255, 255, 1),
                                                                              fontFamily: 'Poppins',
                                                                              fontSize: 14,
                                                                              letterSpacing: 1,
                                                                              fontWeight: FontWeight.normal,
                                                                              height: 1
                                                                          ),)
                                                                      ),Positioned(
                                                                          top: 26,
                                                                          left: 21,
                                                                          child: Text('Italy', textAlign: TextAlign.center, style: TextStyle(
                                                                              color: Color.fromRGBO(234, 234, 234, 1),
                                                                              fontFamily: 'Poppins',
                                                                              fontSize: 12,
                                                                              letterSpacing: 1,
                                                                              fontWeight: FontWeight.normal,
                                                                              height: 1
                                                                          ),)
                                                                      ),
                                                                    ]
                                                                )
                                                            )
                                                        ),
                                                      ]
                                                  )
                                              )
                                          ),
                                        ]
                                    )
                                )
                            ),Positioned(
                                top: 113,
                                left: 170,
                                child: Container(
                                    width: 53,
                                    height: 29.000003814697266,

                                    child: Stack(
                                        children: <Widget>[
                                          Positioned(
                                              top: 0.000002316703557880828,
                                              left: 53,
                                              child: Transform.rotate(
                                                angle: -90.00000250447808 * (math.pi / 180),
                                                child: Container(
                                                    width: 29.000001907348633,
                                                    height: 53,
                                                    decoration: BoxDecoration(
                                                      borderRadius : BorderRadius.only(
                                                        topLeft: Radius.circular(24),
                                                        topRight: Radius.circular(24),
                                                        bottomLeft: Radius.circular(24),
                                                        bottomRight: Radius.circular(24),
                                                      ),
                                                      color : Color.fromRGBO(255, 255, 255, 1),
                                                    )
                                                ),
                                              )
                                          ),Positioned(
                                              top: 3.0000038146972656,
                                              left: 14,
                                              child: Text('35’', textAlign: TextAlign.center, style: TextStyle(
                                                  color: Color.fromRGBO(54, 54, 54, 1),
                                                  fontFamily: 'Poppins',
                                                  fontSize: 15,
                                                  letterSpacing: 1,
                                                  fontWeight: FontWeight.normal,
                                                  height: 1
                                              ),)
                                          ),
                                        ]
                                    )
                                )
                            ),
                          ]
                      )
                  )
              ),Positioned(
                  top: 189,
                  left: 14,
                  child: Container(
                      width: 386,
                      height: 44,

                      child: Stack(
                          children: <Widget>[
                            Positioned(
                                top: 0,
                                left: 0,
                                child: Container(
                                    width: 328,
                                    height: 44,
                                    decoration: BoxDecoration(
                                      color : Color.fromRGBO(255, 255, 255, 1),
                                    ),
                                    child: Stack(
                                        children: <Widget>[
                                          Positioned(
                                              top: 0,
                                              left: 0,
                                              child: Container(
                                                  width: 328,
                                                  height: 44,
                                                  decoration: BoxDecoration(
                                                    borderRadius : BorderRadius.only(
                                                      topLeft: Radius.circular(24),
                                                      topRight: Radius.circular(24),
                                                      bottomLeft: Radius.circular(24),
                                                      bottomRight: Radius.circular(24),
                                                    ),
                                                    color : Color.fromRGBO(255, 255, 255, 1),
                                                    border : Border.all(
                                                      color: Color.fromRGBO(221, 221, 221, 1),
                                                      width: 1,
                                                    ),
                                                  )
                                              )
                                          ),Positioned(
                                              top: 14,
                                              left: 14,
                                              child: Container(
                                                  width: 16,
                                                  height: 16,

                                                  child: Stack(
                                                      children: <Widget>[
                                                        Positioned(
                                                            top: 0,
                                                            left: 0,
                                                            child: Container(
                                                                width: 14.222222328186035,
                                                                height: 14.222222328186035,
                                                                decoration: BoxDecoration(
                                                                  border : Border.all(
                                                                    color: Color.fromRGBO(129, 129, 129, 1),
                                                                    width: 1.600000023841858,
                                                                  ),
                                                                  borderRadius : BorderRadius.all(Radius.elliptical(14.222222328186035, 14.222222328186035)),
                                                                )
                                                            )
                                                        ),Positioned(
                                                            top: 12.133333206176758,
                                                            left: 12.133333206176758,
                                                            child: Image.asset(
                                                                'assets/images/path.svg',
                                                            )
                                                        ),
                                                      ]
                                                  )
                                              )
                                          ),Positioned(
                                              top: 12,
                                              left: 44,
                                              child: Text('Search', textAlign: TextAlign.left, style: TextStyle(
                                                  color: Color.fromRGBO(128, 128, 128, 1),
                                                  fontFamily: 'Poppins',
                                                  fontSize: 14,
                                                  letterSpacing: 1,
                                                  fontWeight: FontWeight.normal,
                                                  height: 1
                                              ),)
                                          ),
                                        ]
                                    )
                                )
                            ),Positioned(
                                top: 0,
                                left: 342,
                                child: Container(
                                    width: 44,
                                    height: 44,

                                    child: Stack(
                                        children: <Widget>[
                                          Positioned(
                                              top: 0,
                                              left: 0,
                                              child: Container(
                                                  width: 44,
                                                  height: 44,
                                                  decoration: BoxDecoration(
                                                    borderRadius : BorderRadius.only(
                                                      topLeft: Radius.circular(24),
                                                      topRight: Radius.circular(24),
                                                      bottomLeft: Radius.circular(24),
                                                      bottomRight: Radius.circular(24),
                                                    ),
                                                    color : Color.fromRGBO(255, 240, 240, 1),
                                                  )
                                              )
                                          ),Positioned(
                                              top: 13,
                                              left: 13,
                                              child: Container(
                                                  width: 18,
                                                  height: 18,

                                                  child: Stack(
                                                      children: <Widget>[
                                                        Positioned(
                                                            top: 2.930232524871826,
                                                            left: 14.823529243469238,
                                                            child: Container(
                                                                width: 3.1764705181121826,
                                                                height: 2.5116279125213623,
                                                                decoration: BoxDecoration(
                                                                  border : Border.all(
                                                                    color: Color.fromRGBO(242, 0, 14, 1),
                                                                    width: 1.399999976158142,
                                                                  ),
                                                                  borderRadius : BorderRadius.all(Radius.elliptical(3.1764705181121826, 2.5116279125213623)),
                                                                )
                                                            )
                                                        ),Positioned(
                                                            top: 12.55813980102539,
                                                            left: 7.411764621734619,
                                                            child: Container(
                                                                width: 3.1764705181121826,
                                                                height: 2.5116279125213623,
                                                                decoration: BoxDecoration(
                                                                  border : Border.all(
                                                                    color: Color.fromRGBO(242, 0, 14, 1),
                                                                    width: 1.399999976158142,
                                                                  ),
                                                                  borderRadius : BorderRadius.all(Radius.elliptical(3.1764705181121826, 2.5116279125213623)),
                                                                )
                                                            )
                                                        ),Positioned(
                                                            top: 7.116279125213623,
                                                            left: 0,
                                                            child: Container(
                                                                width: 3.1764705181121826,
                                                                height: 2.5116279125213623,
                                                                decoration: BoxDecoration(
                                                                  border : Border.all(
                                                                    color: Color.fromRGBO(242, 0, 14, 1),
                                                                    width: 1.399999976158142,
                                                                  ),
                                                                  borderRadius : BorderRadius.all(Radius.elliptical(3.1764705181121826, 2.5116279125213623)),
                                                                )
                                                            )
                                                        ),Positioned(
                                                            top: 5.441860675811768,
                                                            left: 16.147058486938477,
                                                            child: Image.asset(
                                                                'assets/images/path.svg',

                                                            )
                                                        ),Positioned(
                                                            top: 0,
                                                            left: 16.147058486938477,
                                                            child: Image.asset(
                                                                'assets/images/path.svg',

                                                            )
                                                        ),Positioned(
                                                            top: 9.627906799316406,
                                                            left: 1.3235293626785278,
                                                            child: Image.asset(
                                                                'assets/images/path.svg',
                                                            )
                                                        ),Positioned(
                                                            top: 0,
                                                            left: 1.3235293626785278,
                                                            child: Image.asset(
                                                                'assets/images/path.svg',
                                                            )
                                                        ),Positioned(
                                                            top: 15.069766998291016,
                                                            left: 8.735294342041016,
                                                            child: Image.asset(
                                                                'assets/images/path.svg',
                                                            )
                                                        ),Positioned(
                                                            top: 0,
                                                            left: 8.735294342041016,
                                                            child: Image.asset(
                                                                'assets/images/path.svg',
                                                            )
                                                        ),
                                                      ]
                                                  )
                                              )
                                          ),
                                        ]
                                    )
                                )
                            ),
                          ]
                      )
                  )
              ),Positioned(
                  top: 96,
                  left: 18,
                  child: Container(
                      width: 382,
                      height: 72,
                      decoration: BoxDecoration(
                        color : Color.fromRGBO(255, 255, 255, 1),
                      ),
                      child: Stack(
                          children: <Widget>[
                            Positioned(
                                top: 0,
                                left: 0,
                                child: Container(
                                    width: 382,
                                    height: 72,

                                    child: Stack(
                                        children: <Widget>[
                                          Positioned(
                                              top: 16,
                                              left: 358,
                                              child: Container(
                                                  width: 24,
                                                  height: 40,

                                                  child: Stack(
                                                      children: <Widget>[
                                                        Positioned(
                                                            top: 0,
                                                            left: 0,
                                                            child: Text('19', textAlign: TextAlign.center, style: TextStyle(
                                                                color: Color.fromRGBO(51, 51, 51, 1),
                                                                fontFamily: 'Poppins',
                                                                fontSize: 16,
                                                                letterSpacing: 0 /*percentages not used in flutter. defaulting to zero*/,
                                                                fontWeight: FontWeight.normal,
                                                                height: 1.5 /*PERCENT not supported*/
                                                            ),)
                                                        ),Positioned(
                                                            top: 26,
                                                            left: 0,
                                                            child: Text('Mo', textAlign: TextAlign.center, style: TextStyle(
                                                                color: Color.fromRGBO(141, 143, 141, 1),
                                                                fontFamily: 'Poppins',
                                                                fontSize: 12,
                                                                letterSpacing: 0 /*percentages not used in flutter. defaulting to zero*/,
                                                                fontWeight: FontWeight.normal,
                                                                height: 1.5 /*PERCENT not supported*/
                                                            ),)
                                                        ),
                                                      ]
                                                  )
                                              )
                                          ),Positioned(
                                              top: 16,
                                              left: 308,
                                              child: Container(
                                                  width: 24,
                                                  height: 40,

                                                  child: Stack(
                                                      children: <Widget>[
                                                        Positioned(
                                                            top: 0,
                                                            left: 0,
                                                            child: Text('18', textAlign: TextAlign.center, style: TextStyle(
                                                                color: Color.fromRGBO(51, 51, 51, 1),
                                                                fontFamily: 'Poppins',
                                                                fontSize: 16,
                                                                letterSpacing: 0 /*percentages not used in flutter. defaulting to zero*/,
                                                                fontWeight: FontWeight.normal,
                                                                height: 1.5 /*PERCENT not supported*/
                                                            ),)
                                                        ),Positioned(
                                                            top: 26,
                                                            left: 0,
                                                            child: Text('Su', textAlign: TextAlign.center, style: TextStyle(
                                                                color: Color.fromRGBO(141, 143, 141, 1),
                                                                fontFamily: 'Poppins',
                                                                fontSize: 12,
                                                                letterSpacing: 0 /*percentages not used in flutter. defaulting to zero*/,
                                                                fontWeight: FontWeight.normal,
                                                                height: 1.5 /*PERCENT not supported*/
                                                            ),)
                                                        ),
                                                      ]
                                                  )
                                              )
                                          ),Positioned(
                                              top: 16,
                                              left: 258,
                                              child: Container(
                                                  width: 24,
                                                  height: 40,

                                                  child: Stack(
                                                      children: <Widget>[
                                                        Positioned(
                                                            top: 0,
                                                            left: 0,
                                                            child: Text('17', textAlign: TextAlign.center, style: TextStyle(
                                                                color: Color.fromRGBO(51, 51, 51, 1),
                                                                fontFamily: 'Poppins',
                                                                fontSize: 16,
                                                                letterSpacing: 0 /*percentages not used in flutter. defaulting to zero*/,
                                                                fontWeight: FontWeight.normal,
                                                                height: 1.5 /*PERCENT not supported*/
                                                            ),)
                                                        ),Positioned(
                                                            top: 26,
                                                            left: 0,
                                                            child: Text('Sa', textAlign: TextAlign.center, style: TextStyle(
                                                                color: Color.fromRGBO(141, 143, 141, 1),
                                                                fontFamily: 'Poppins',
                                                                fontSize: 12,
                                                                letterSpacing: 0 /*percentages not used in flutter. defaulting to zero*/,
                                                                fontWeight: FontWeight.normal,
                                                                height: 1.5 /*PERCENT not supported*/
                                                            ),)
                                                        ),
                                                      ]
                                                  )
                                              )
                                          ),Positioned(
                                              top: 16,
                                              left: 208,
                                              child: Container(
                                                  width: 24,
                                                  height: 40,

                                                  child: Stack(
                                                      children: <Widget>[
                                                        Positioned(
                                                            top: 0,
                                                            left: 0,
                                                            child: Text('16', textAlign: TextAlign.center, style: TextStyle(
                                                                color: Color.fromRGBO(51, 51, 51, 1),
                                                                fontFamily: 'Poppins',
                                                                fontSize: 16,
                                                                letterSpacing: 0 /*percentages not used in flutter. defaulting to zero*/,
                                                                fontWeight: FontWeight.normal,
                                                                height: 1.5 /*PERCENT not supported*/
                                                            ),)
                                                        ),Positioned(
                                                            top: 26,
                                                            left: 0,
                                                            child: Text('Fr', textAlign: TextAlign.center, style: TextStyle(
                                                                color: Color.fromRGBO(141, 143, 141, 1),
                                                                fontFamily: 'Poppins',
                                                                fontSize: 12,
                                                                letterSpacing: 0 /*percentages not used in flutter. defaulting to zero*/,
                                                                fontWeight: FontWeight.normal,
                                                                height: 1.5 /*PERCENT not supported*/
                                                            ),)
                                                        ),
                                                      ]
                                                  )
                                              )
                                          ),Positioned(
                                              top: 0,
                                              left: 142,
                                              child: Container(
                                                  width: 56,
                                                  height: 72,

                                                  child: Stack(
                                                      children: <Widget>[
                                                        Positioned(
                                                            top: 0,
                                                            left: 0,
                                                            child: Container(
                                                                width: 56,
                                                                height: 72,
                                                                decoration: BoxDecoration(
                                                                  borderRadius : BorderRadius.only(
                                                                    topLeft: Radius.circular(24),
                                                                    topRight: Radius.circular(24),
                                                                    bottomLeft: Radius.circular(24),
                                                                    bottomRight: Radius.circular(24),
                                                                  ),
                                                                  color : Color.fromRGBO(242, 0, 15, 1),
                                                                )
                                                            )
                                                        ),Positioned(
                                                            top: 15,
                                                            left: 16,
                                                            child: Text('15', textAlign: TextAlign.center, style: TextStyle(
                                                                color: Color.fromRGBO(255, 255, 255, 1),
                                                                fontFamily: 'Poppins',
                                                                fontSize: 20,
                                                                letterSpacing: 0 /*percentages not used in flutter. defaulting to zero*/,
                                                                fontWeight: FontWeight.normal,
                                                                height: 1.5 /*PERCENT not supported*/
                                                            ),)
                                                        ),Positioned(
                                                            top: 42,
                                                            left: 16,
                                                            child: Text('Th', textAlign: TextAlign.center, style: TextStyle(
                                                                color: Color.fromRGBO(255, 255, 255, 1),
                                                                fontFamily: 'Poppins',
                                                                fontSize: 14,
                                                                letterSpacing: 0 /*percentages not used in flutter. defaulting to zero*/,
                                                                fontWeight: FontWeight.normal,
                                                                height: 1.5 /*PERCENT not supported*/
                                                            ),)
                                                        ),
                                                      ]
                                                  )
                                              )
                                          ),Positioned(
                                              top: 16,
                                              left: 100,
                                              child: Container(
                                                  width: 32,
                                                  height: 40,

                                                  child: Stack(
                                                      children: <Widget>[
                                                        Positioned(
                                                            top: 0,
                                                            left: 0,
                                                            child: Text('14', textAlign: TextAlign.center, style: TextStyle(
                                                                color: Color.fromRGBO(51, 51, 51, 1),
                                                                fontFamily: 'Poppins',
                                                                fontSize: 16,
                                                                letterSpacing: 0 /*percentages not used in flutter. defaulting to zero*/,
                                                                fontWeight: FontWeight.normal,
                                                                height: 1.5 /*PERCENT not supported*/
                                                            ),)
                                                        ),Positioned(
                                                            top: 26,
                                                            left: 0,
                                                            child: Text('Wed', textAlign: TextAlign.center, style: TextStyle(
                                                                color: Color.fromRGBO(141, 143, 141, 1),
                                                                fontFamily: 'Poppins',
                                                                fontSize: 12,
                                                                letterSpacing: 0 /*percentages not used in flutter. defaulting to zero*/,
                                                                fontWeight: FontWeight.normal,
                                                                height: 1.5 /*PERCENT not supported*/
                                                            ),)
                                                        ),
                                                      ]
                                                  )
                                              )
                                          ),Positioned(
                                              top: 16,
                                              left: 50,
                                              child: Container(
                                                  width: 24,
                                                  height: 40,

                                                  child: Stack(
                                                      children: <Widget>[
                                                        Positioned(
                                                            top: 0,
                                                            left: 0,
                                                            child: Text('13', textAlign: TextAlign.center, style: TextStyle(
                                                                color: Color.fromRGBO(51, 51, 51, 1),
                                                                fontFamily: 'Poppins',
                                                                fontSize: 16,
                                                                letterSpacing: 0 /*percentages not used in flutter. defaulting to zero*/,
                                                                fontWeight: FontWeight.normal,
                                                                height: 1.5 /*PERCENT not supported*/
                                                            ),)
                                                        ),Positioned(
                                                            top: 26,
                                                            left: 0,
                                                            child: Text('Tu', textAlign: TextAlign.center, style: TextStyle(
                                                                color: Color.fromRGBO(141, 143, 141, 1),
                                                                fontFamily: 'Poppins',
                                                                fontSize: 12,
                                                                letterSpacing: 0 /*percentages not used in flutter. defaulting to zero*/,
                                                                fontWeight: FontWeight.normal,
                                                                height: 1.5 /*PERCENT not supported*/
                                                            ),)
                                                        ),
                                                      ]
                                                  )
                                              )
                                          ),Positioned(
                                              top: 16,
                                              left: 0,
                                              child: Container(
                                                  width: 24,
                                                  height: 40,

                                                  child: Stack(
                                                      children: <Widget>[
                                                        Positioned(
                                                            top: 0,
                                                            left: 0,
                                                            child: Text('12', textAlign: TextAlign.center, style: TextStyle(
                                                                color: Color.fromRGBO(51, 51, 51, 1),
                                                                fontFamily: 'Poppins',
                                                                fontSize: 16,
                                                                letterSpacing: 0 /*percentages not used in flutter. defaulting to zero*/,
                                                                fontWeight: FontWeight.normal,
                                                                height: 1.5 /*PERCENT not supported*/
                                                            ),)
                                                        ),Positioned(
                                                            top: 26,
                                                            left: 0,
                                                            child: Text('Mo', textAlign: TextAlign.center, style: TextStyle(
                                                                color: Color.fromRGBO(141, 143, 141, 1),
                                                                fontFamily: 'Poppins',
                                                                fontSize: 12,
                                                                letterSpacing: 0 /*percentages not used in flutter. defaulting to zero*/,
                                                                fontWeight: FontWeight.normal,
                                                                height: 1.5 /*PERCENT not supported*/
                                                            ),)
                                                        ),
                                                      ]
                                                  )
                                              )
                                          ),
                                        ]
                                    )
                                )
                            ),
                          ]
                      )
                  )
              ),Positioned(
                  top: 39,
                  left: 14,
                  child: Container(
                      width: 386,
                      height: 40,
                      decoration: BoxDecoration(
                        color : Color.fromRGBO(255, 255, 255, 1),
                      ),
                      child: Stack(
                          children: <Widget>[
                            Positioned(
                                top: 11,
                                left: 0,
                                child: Container(
                                    width: 24,
                                    height: 18,

                                    child: Stack(
                                        children: <Widget>[
                                          Positioned(
                                              top: 8.307692527770996,
                                              left: 0,
                                              child: Image.asset(
                                                  'assets/images/path.svg',
                                              )
                                          ),Positioned(
                                              top: 0,
                                              left: 0,
                                              child: Image.asset(
                                                  'assets/images/path.svg',
                                              )
                                          ),Positioned(
                                              top: 16.615385055541992,
                                              left: 0,
                                              child: Image.asset(
                                                  'assets/images/path.svg',
                                              )
                                          ),
                                        ]
                                    )
                                )
                            ),Positioned(
                                top: 11,
                                left: 167,
                                child: Text('Home', textAlign: TextAlign.center, style: TextStyle(
                                    color: Color.fromRGBO(63, 58, 58, 1),
                                    fontFamily: 'Poppins',
                                    fontSize: 16,
                                    letterSpacing: 1,
                                    fontWeight: FontWeight.normal,
                                    height: 1
                                ),)
                            ),Positioned(
                                top: 11,
                                left: 370,
                                child: Container(
                                    width: 16,
                                    height: 18,

                                    child: Stack(
                                        children: <Widget>[
                                          Positioned(
                                              top: 0,
                                              left: 0,
                                              child: Text('')
                                          ),
                                        ]
                                    )
                                )
                            ),
                          ]
                      )
                  )
              ),Positioned(
                  top: 0,
                  left: 0,
                  child: Container(
                      width: 414,
                      height: 44,
                      decoration: BoxDecoration(

                      ),
                      child: Stack(
                          children: <Widget>[
                            Positioned(
                                top: 17.33333396911621,
                                left: 375.33331298828125,
                                child: Container(
                                    width: 24.32803726196289,
                                    height: 11.333333015441895,

                                    child: Stack(
                                        children: <Widget>[
                                          Positioned(
                                              top: 0,
                                              left: 0,
                                              child: Container(
                                                  width: 22,
                                                  height: 11.333333015441895,
                                                  decoration: BoxDecoration(
                                                    borderRadius : BorderRadius.only(
                                                      topLeft: Radius.circular(2.6666667461395264),
                                                      topRight: Radius.circular(2.6666667461395264),
                                                      bottomLeft: Radius.circular(2.6666667461395264),
                                                      bottomRight: Radius.circular(2.6666667461395264),
                                                    ),
                                                    border : Border.all(
                                                      color: Color.fromRGBO(60, 60, 60, 1),
                                                      width: 1,
                                                    ),
                                                  )
                                              )
                                          ),Positioned(
                                              top: 3.6666667461395264,
                                              left: 23,
                                              child: Image.asset(
                                                  'assets/images/cap.svg',
                                              )
                                          ),Positioned(
                                              top: 1.9999998807907104,
                                              left: 2,
                                              child: Container(
                                                  width: 18,
                                                  height: 7.333333492279053,
                                                  decoration: BoxDecoration(
                                                    borderRadius : BorderRadius.only(
                                                      topLeft: Radius.circular(1.3333333730697632),
                                                      topRight: Radius.circular(1.3333333730697632),
                                                      bottomLeft: Radius.circular(1.3333333730697632),
                                                      bottomRight: Radius.circular(1.3333333730697632),
                                                    ),
                                                    color : Color.fromRGBO(60, 60, 60, 1),
                                                  )
                                              )
                                          ),
                                        ]
                                    )
                                )
                            ),Positioned(
                                top: 17.330673217773438,
                                left: 348.864013671875,
                                child: Text('')
                            ),Positioned(
                                top: 17.666667938232422,
                                left: 324.57598876953125,
                                child: Text('')
                            ),Positioned(
                                top: 7.33331298828125,
                                left: 3,
                                child: Container(
                                    width: 54,
                                    height: 21,
                                    decoration: BoxDecoration(

                                    ),
                                    child: Stack(
                                        children: <Widget>[
                                          Positioned(
                                              top: 7,
                                              left: 0,
                                              child: Text('9:41', textAlign: TextAlign.center, style: TextStyle(
                                                  color: Color.fromRGBO(60, 60, 60, 1),
                                                  fontFamily: 'Poppins',
                                                  fontSize: 15,
                                                  letterSpacing: -0.30000001192092896,
                                                  fontWeight: FontWeight.normal,
                                                  height: 1
                                              ),)
                                          ),
                                        ]
                                    )
                                )
                            ),
                          ]
                      )
                  )
              ),
            ]
        )
    );
  }
}
