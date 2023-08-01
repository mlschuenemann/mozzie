import 'package:flutter/material.dart';
import 'package:music_education/constants/colors.dart';




class LevelCard extends StatelessWidget {
  const LevelCard({
    required this.levelText,
    required this.subText,
    super.key,
  });

  final String levelText;
  final String subText;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.only(left: 15, right: 15),
      margin: const EdgeInsets.only(top: 10, bottom: 10),
      height: 80,
      decoration: const BoxDecoration(
        color: SECONDARY,
        border: Border(
          top: BorderSide(width: 2, color: SECONDARY),
          bottom: BorderSide(width: 2, color: SECONDARY),
        ),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(
            levelText,
            style: const TextStyle(
                color: Colors.white,
                fontFamily: 'Sofia Sans',
                fontSize: 22,
                fontWeight: FontWeight.w700
            ),
          ),
          Text(
            subText,//,
            style: const TextStyle(
                color: Colors.white,
                fontFamily: 'Sofia Sans',
                fontSize: 15,
                fontWeight: FontWeight.w500
            ),
          ),
        ],
      ),
    );
  }
}
