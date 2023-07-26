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

  String notePath(String note) {
    List<String> upNotes = ["F", "G", "A", "H", "c"];
    List<String> downNotes = ["d", "e", "f", "g", "a", "h"];

    switch (note) {
      case "empty":
        return "assets/note_graphics/notes/empty_note.svg";
      case "C":
        return "assets/note_graphics/notes/note_up_on_line_2.svg";
      case "D":
        return "assets/note_graphics/notes/note_up_below_line_1.svg";
      case "E":
        return "assets/note_graphics/notes/note_up_on_line_1.svg";
      case "c'":
        return "assets/note_graphics/notes/note_down_on_line_1.svg";
      case "d\'":
        return "assets/note_graphics/notes/note_down_above_line_1.svg";
      case "e\'":
        return "assets/note_graphics/notes/note_down_on_line_2.svg";
      default:
        if (upNotes.contains(note)) {
          return "assets/note_graphics/notes/note_up.svg";
        } else if (downNotes.contains(note)) {
          return "assets/note_graphics/notes/note_down.svg";
        } else {
          return "";
        }
    }
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      //alignment: Alignment.center,
      margin: const EdgeInsets.only(left: 15, right: 15),
      height: 240,
      decoration: ShapeDecoration(
        shape: RoundedRectangleBorder(
          side: const BorderSide(width: 1.50, color: SECONDARY),
          borderRadius: BorderRadius.circular(16),
        ),
      ),
      child: Stack(
        alignment: Alignment.center,
        children: [
          SvgPicture.asset(
            "assets/note_graphics/lines/bass_lines.svg",
            height: 130,
          ),
          Positioned(
            top: positionScaleCard[firstNote],
            left: firstNote == "empty" ? 130 : 110,
            child: SvgPicture.asset(
              notePath(firstNote),
              height: firstNote == "empty" ? 90: 140,
            ),
          ),
          Positioned(
            top: positionScaleCard[secondNote],
            left: secondNote == "empty" ? 180 : 160,
            child: SvgPicture.asset(
              notePath(secondNote),
              height: secondNote == "empty" ? 90: 140,
            ),
          ),
          Positioned(
            top: positionScaleCard[thirdNote],
            left: thirdNote == "empty" ? 230 : 210,
            child: SvgPicture.asset(
             notePath(thirdNote),
              height: thirdNote == "empty" ? 90: 140,
            ),
          ),
          Positioned(
            top: 205,
            left: 140,
            child: firstNote == "empty"
                ? SizedBox.shrink() // Hide the Text widget when the note is "C", "D", or "E"
                : Text(
              firstNote,
              style: PAR1,
            ),
          ),
          Positioned(
            top: 205,
            left: 190,
            child: secondNote == "empty"
                ? SizedBox.shrink() // Hide the Text widget when the note is "C", "D", or "E"
                : Text(
              secondNote,
              style: PAR1,
            ),
          ),
          Positioned(
            top: 205,
            left: 240,
            child: thirdNote == "empty"
                ? SizedBox.shrink() // Hide the Text widget when the note is "C", "D", or "E"
                : Text(
              thirdNote,
              style: PAR1,
            ),
          ),

        ],
      ),
    );
  }
}
