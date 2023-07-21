import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:music_education/constants/colors.dart';
import 'package:music_education/constants/textstyle.dart';



class NoteNameCard extends StatelessWidget {
  const NoteNameCard({required this.noteName, super.key,});

  final String noteName;

  @override
  Widget build(BuildContext context) {
    return Container(
        alignment: Alignment.center,
        margin: const EdgeInsets.only(left: 15, right: 15),
        height: 220,
        decoration: ShapeDecoration(
          shape: RoundedRectangleBorder(
            side: const BorderSide(width: 1.50, color: SECONDARY),
            borderRadius: BorderRadius.circular(16),
          ),
        ),
        child: Text(
          noteName, style: HEADING2,
        )
    );
  }
}