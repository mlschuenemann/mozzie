import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:music_education/constants/colors.dart';
import 'package:music_education/constants/textstyle.dart';

class AchievmentCard extends StatelessWidget {
  const AchievmentCard({
    required this.imagePath,
    required this.text,
    required this.border,
    super.key,
  });

  final String text;
  final String imagePath;
  final bool border;

  @override
  Widget build(BuildContext context) {
    return Container(
        padding: const EdgeInsets.only(right: 10, left: 10),
        height: 40,
        margin: const EdgeInsets.only(bottom: 10,),
        decoration: BoxDecoration(
            color: SECONDARY, borderRadius: BorderRadius.circular(10),
          border: border ? Border.all(
            color: LIGHTBLUE,
            width: 2,
          ) : null,

        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            SvgPicture.asset(imagePath),
            const SizedBox(
              width: 10,
            ),
            Text(
              text,
              style: PAR1,
            ),
          ],
        ),);
  }
}
