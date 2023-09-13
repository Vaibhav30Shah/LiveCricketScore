import 'package:flutter/material.dart';

class BigText extends StatelessWidget {
  final Color? color;
  final String text;
  final double size;
  final TextOverflow overflow;
  const BigText({Key? key,
      this.color=const Color(0xFF332d2b),
      required this.text,
      this.overflow=TextOverflow.ellipsis,
      this.size=20
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Text(
      text,
      style: TextStyle(
        color: color,
        fontWeight: FontWeight.w400,
        fontFamily: 'Roboto',
        fontSize: size
      ),
      maxLines: 1,
      overflow: overflow,
    );
  }
}
