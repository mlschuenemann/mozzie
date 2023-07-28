import 'package:flutter/material.dart';
import 'package:music_education/constants/colors.dart';
import 'package:flutter_svg/svg.dart';
import 'package:music_education/constants/textstyle.dart';
import 'package:music_education/constants/positions.dart';
import 'package:provider/provider.dart';

import '../../provider/key_provider.dart';

class NoteChoiceCard extends StatelessWidget {

  const NoteChoiceCard(
      {required this.noteChoice,
        required this.displayNoteName,
        required this.borderColor,
        super.key});

  final String noteChoice;
  final bool displayNoteName;
  final Color borderColor;



  @override
  Widget build(BuildContext context) {
    final keyProvider = Provider.of<KeyProvider>(context, listen: false);

    String notePath(String note) {
      if(keyProvider.key=="bass"){
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
          case "d'":
            return "assets/note_graphics/notes/small/note_down_small_above_line_1.svg";
          case "e'":
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
      if(keyProvider.key=="violin"){
        List<String> upNotes = ["d'","e'","f'","a'","g'"];
        List<String> downNotes = ["h'", "c''", "d''", "e''", "f''", "g''"];

        switch (note) {
          case "a":
            return "assets/note_graphics/notes/small/note_up_small_on_line_2.svg";
          case "h":
            return "assets/note_graphics/notes/small/note_up_small_below_line_1.svg";
          case "c'":
            return "assets/note_graphics/notes/small/note_up_small_on_line_1.svg";
          case "a''":
            return "assets/note_graphics/notes/small/note_down_small_on_line_1.svg";
          case "h''":
            return "assets/note_graphics/notes/small/note_down_small_above_line_1.svg";
          case "c'''":
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
      }else{
        return "";
      }
    }

    double? getNotePosition(noteNumber){
      if(keyProvider.key=="bass"){
        return bassPositionChoiceCard[noteNumber];
      }else if(keyProvider.key=="violin"){
        return violinPositionChoiceCard[noteNumber];
      }else if (keyProvider.key=="tenor"){
        return tenorPositionChoiceCard[noteNumber];
      }else{
        return 0;
      }
    }

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
              top: getNotePosition(noteChoice),
              child: SvgPicture.asset(
                notePath(noteChoice),
              ),
            ),
            Positioned(
                top: 90,
                child: Visibility(
                  visible: displayNoteName && !["C", "D", "E", "F"].contains(noteChoice) && (keyProvider.key=="violin" && !["a","h","c'","d'"].contains(noteChoice)),
                  child: Text(
                    noteChoice,
                    style: PAR2,
                  ),
                ),
            ),
          ],
        ),
      ),
    );
  }
}
