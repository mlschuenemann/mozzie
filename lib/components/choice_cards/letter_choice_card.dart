import 'package:flutter/material.dart';
import 'package:music_education/constants/colors.dart';
import 'package:music_education/constants/textstyle.dart';


class LetterChoiceCard extends StatelessWidget {
  const LetterChoiceCard({
    required this.letter,
    required this.borderColor,
    super.key,});

  final String letter;
  final Color borderColor;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 74,
      height: 115,
      alignment: Alignment.center,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(20),
        color: SECONDARY,
        border: Border.all(
          color: borderColor, // Border color
          width: 2, // Border width
        ),
      ),
      child: Text(
        letter,
        style: HEADING2,
      ),
    );
  }
}