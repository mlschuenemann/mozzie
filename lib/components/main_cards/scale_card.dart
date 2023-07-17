import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:music_education/constants/colors.dart';
import 'package:music_education/constants/positions.dart';
import 'package:music_education/constants/textstyle.dart';


class ScaleCard extends StatelessWidget {
  const ScaleCard({required this.firstNote, required this.secondNote, required this.thirdNote, super.key});

  final String firstNote;
  final String secondNote;
  final String thirdNote;

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
            top: positionCard[firstNote],
            left: firstNote == "empty" ? 70 : 50,
            child: SvgPicture.asset(
              firstNote == "empty" ? "assets/note_graphics/notes/empty_note.svg" : "assets/note_graphics/notes/note_up.svg",
            ),
          ),
          Positioned(
            top: positionCard[secondNote],
            left: secondNote == "empty" ? 140 : 120,
            child: SvgPicture.asset(
              secondNote == "empty" ? "assets/note_graphics/notes/empty_note.svg" : "assets/note_graphics/notes/note_up.svg",
            ),
          ),
          Positioned(
            top: positionCard[thirdNote],
            left: thirdNote == "empty" ? 210 : 190,
            child: SvgPicture.asset(
              thirdNote == "empty" ? "assets/note_graphics/notes/empty_note.svg" : "assets/note_graphics/notes/note_up.svg",
            ),
          ),
          Positioned(
            top: 150,
            left: 85,
            child: Text(
              firstNote == "empty" ? "" : firstNote,
              style: PAR1,
            ),
          ),
          Positioned(
            top: 150,
            left: 160,
            child: Text(
              secondNote == "empty" ? "" : secondNote,
              style: PAR1,
            ),
          ),
          Positioned(
            top: 150,
            left: 230,
            child: Text(
              thirdNote == "empty" ? "" : thirdNote,
              style: PAR1,
            ),
          ),
        ],
      ),
    );
  }
}
