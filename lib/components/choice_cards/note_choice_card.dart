import 'package:flutter/material.dart';
import 'package:music_education/constants/colors.dart';
import 'package:flutter_svg/svg.dart';
import 'package:music_education/constants/textstyle.dart';
import 'package:music_education/constants/positions.dart';

class NoteChoiceCard extends StatelessWidget {

  const NoteChoiceCard(
      {required this.noteChoice,
        required this.displayNoteName,
        required this.borderColor,
        super.key});

  final String noteChoice;
  final bool displayNoteName;
  final Color borderColor;

  String notePath(String note) {
    List<String> upNotes = ["F", "G", "A", "H", "c"];
    List<String> downNotes = ["d", "e", "f", "g", "a", "h"];

    switch (note) {
      case "C":
        return "assets/note_graphics/notes/small/note_up_small_on_line_2.svg";
      case "D":
        return "assets/note_graphics/notes/small/note_up_small_below_line_1.svg";
      case "E":
        return "assets/note_graphics/notes/small/note_up_small_on_line_1.svg";
      case "c'":
        return "assets/note_graphics/notes/small/note_down_small_on_line_1.svg";
      case "d\'":
        return "assets/note_graphics/notes/small/note_down_small_above_line_1.svg";
      case "e\'":
        return "assets/note_graphics/notes/small/note_down_small_on_line_2.svg";
      default:
        if (upNotes.contains(note)) {
          return "assets/note_graphics/notes/small/note_up_small.svg";
        } else if (downNotes.contains(note)) {
          return "assets/note_graphics/notes/small/note_down_small.svg";
        } else {
          return "";
        }
    }
  }

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
      child: OverflowBox(
        minWidth: 74,
        minHeight: 115,
        maxHeight: double.infinity,
        maxWidth: double.infinity,
        child: Stack(
          alignment: Alignment.center,
          children: [
            SvgPicture.asset(
              "assets/note_graphics/lines/note_lines_small.svg",
            ),
            Positioned(
              top: bassPositionChoiceCard[noteChoice],
              child: SvgPicture.asset(
                notePath(noteChoice),
              ),
            ),
            Positioned(
                top: 90,
                child: Visibility(
                  visible: displayNoteName && !["C", "D", "E", "F"].contains(noteChoice),
                  child: Text(
                    noteChoice,
                    style: PAR2,
                  ),
                )),
          ],
        ),
      ),
    );
  }
}
