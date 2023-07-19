import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:music_education/constants/colors.dart';
import 'package:music_education/constants/positions.dart';
class SingleNoteCard extends StatelessWidget {
  const SingleNoteCard({required this.note, super.key,});

  final String note;

  String NotePath() {
    List<String> upNotes = ["F", "G", "A", "H", "c"];
    List<String> downNotes = ["d", "e", "f", "g", "a", "h"];

    if (upNotes.contains(note)) {
      return "assets/note_graphics/notes/note_up.svg";
    } else if (downNotes.contains(note)){
      return "assets/note_graphics/notes/note_down.svg";
    } else if (note=="C"){
      return "assets/note_graphics/notes/note_up_on_line_2.svg";
    } else if (note=="D"){
      return "assets/note_graphics/notes/note_up_below_line_1.svg";
    } else if (note=="E"){
      return "assets/note_graphics/notes/note_up_on_line_1.svg";
    }

    else if (note=="c\'"){
      return "assets/note_graphics/notes/note_down_on_line_1.svg";
    } else if (note=="d\'"){
      return "assets/note_graphics/notes/note_down_above_line_1.svg";
    } else if (note=="e\'"){
      return "assets/note_graphics/notes/note_down_on_line_2.svg";
    } else {
      return "";
    }
  }


  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(left: 15, right: 15),
      height: 220,
      decoration: ShapeDecoration(
        shape: RoundedRectangleBorder(
          side: const BorderSide(width: 1.50, color: SECONDARY),
          borderRadius: BorderRadius.circular(16),
        ),
      ),
      child: Stack(
        alignment: Alignment.center,
        children: [
          // Positioned.fill() ensures the SVG takes up the entire container
          SvgPicture.asset(
            "assets/note_graphics/lines/bass_lines.svg",
          ),
          // Make sure positionCard[note] is within the bounds of the Container
          Positioned(
            top: positionCard[note], // Adjust this value if needed
            left: 160, // Adjust this value if needed
            child: SvgPicture.asset(
              NotePath(),
            ),
          ),
        ],
      ),
    );
  }

}