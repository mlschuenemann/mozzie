import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:music_education/constants/colors.dart';
import 'package:music_education/constants/positions.dart';
class SingleChoiceCard extends StatelessWidget {
  const SingleChoiceCard({required this.note, super.key,});

  final String note;

  @override
  Widget build(BuildContext context) {
    return Container(
      alignment: Alignment.center,
      margin: const EdgeInsets.only(left: 15, right: 15),
      height: 200,
      decoration: ShapeDecoration(
        shape: RoundedRectangleBorder(
          side: const BorderSide(width: 1.50, color: SECONDARY),
          borderRadius: BorderRadius.circular(16),
        ),
      ),
      child: Stack(
        children: [
          SvgPicture.asset(
            "assets/note_graphics/lines/bass_lines.svg",
          ),
          Positioned(
            top: positionCard[note],
            left: 120,
            child: SvgPicture.asset(
              "assets/note_graphics/notes/note_up.svg",
            ),
          ),
        ],
      ),
    );
  }
}