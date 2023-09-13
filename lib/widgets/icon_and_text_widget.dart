import 'package:flutter/material.dart';
import 'package:food_delivery_app/utils/dimensions.dart';
import 'package:food_delivery_app/widgets/big_text.dart';
import 'package:food_delivery_app/widgets/small_text.dart';

class IconAndText extends StatelessWidget {
  final IconData icon;
  final String text;
  final Color color;
  final Color textColor;
  final TextOverflow? overflow;
  const IconAndText({Key? key, required this.icon, required this.text, required this.color, this.textColor=const Color(0xFFccc7c5), this.overflow=TextOverflow.ellipsis }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      // width: double.maxFinite,
      child: Row(
        children: [
          Icon(icon, color: color,),
          SizedBox(width: Dimensions.width10,),
          SmallText(text: text, size: 12.5, color: textColor, overflow: overflow,)
        ],
      ),
    );
  }
}
