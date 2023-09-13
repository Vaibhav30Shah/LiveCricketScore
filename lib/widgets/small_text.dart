import 'package:flutter/material.dart';

class SmallText extends StatelessWidget {
  final Color? color;
  final String text;
  final double size;
  final double height;
  final TextOverflow? overflow;
  const  SmallText({Key? key,
    this.color=const Color(0xFFccc7c5),
    required this.text,
    this.height=1.2,
    this.overflow=TextOverflow.ellipsis,
    this.size=12
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Text(
      text,
      overflow: overflow,
      style: TextStyle(
          color: color,
          fontFamily: 'Roboto',
          height: height,
          fontSize: size,
      ),
    );
  }
}
