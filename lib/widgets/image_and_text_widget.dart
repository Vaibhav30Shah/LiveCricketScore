import 'package:flutter/material.dart';
import 'package:food_delivery_app/widgets/big_text.dart';

class ImageAndText extends StatelessWidget {
  final String image;
  final Color color;
  final String text;
  const ImageAndText({Key? key, required this.image, required this.text, required this.color}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(
        children: [
          CircleAvatar(
            backgroundImage: NetworkImage(image),
          ),
          SizedBox(height: 10,),
          BigText(text: text, size: 16, color: color,)
        ],
      ),
    );
  }
}
