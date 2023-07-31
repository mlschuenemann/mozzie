import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:music_education/constants/colors.dart';
import 'package:music_education/constants/positions.dart';
import 'package:music_education/constants/textstyle.dart';
import 'package:provider/provider.dart';

import '../../provider/key_provider.dart';


class ScaleCard extends StatelessWidget {
  const ScaleCard({required this.firstNote, required this.secondNote, required this.thirdNote, super.key});

  final String firstNote;
  final String secondNote;
  final String thirdNote;

  @override
  Widget build(BuildContext context) {
    final keyProvider = Provider.of<KeyProvider>(context);

    String notePath(String note) {

      if (keyProvider.key=="bass"){
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
        case "d'":
          return "assets/note_graphics/notes/note_down_above_line_1.svg";
        case "e'":
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
      if (keyProvider.key=="violin"){
        List<String> upNotes = ["d'","e'","f'","a'","g'"];
        List<String> downNotes = ["h'", "c''", "d''", "e''", "f''", "g''"];

        switch (note) {
          case "empty":
            return "assets/note_graphics/notes/empty_note.svg";
          case "a":
            return "assets/note_graphics/notes/note_up_on_line_2.svg";
          case "h":
            return "assets/note_graphics/notes/note_up_below_line_1.svg";
          case "c'":
            return "assets/note_graphics/notes/note_up_on_line_1.svg";
          case "a''":
            return "assets/note_graphics/notes/note_down_on_line_1.svg";
          case "h''":
            return "assets/note_graphics/notes/note_down_above_line_1.svg";
          case "c'''":
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

      }if(keyProvider.key=="tenor"){
        List<String> upNotes = ["c","d","e","f","g"];
        List<String> downNotes = ["a", "h", "c'", "d'", "e'", "f'"];

        switch (note) {
          case "empty":
            return "assets/note_graphics/notes/empty_note.svg";
          case "G":
            return "assets/note_graphics/notes/note_up_on_line_2.svg";
          case "A":
            return "assets/note_graphics/notes/note_up_below_line_1.svg";
          case "H":
            return "assets/note_graphics/notes/note_up_on_line_1.svg";
          case "g'":
            return "assets/note_graphics/notes/note_down_on_line_1.svg";
          case "a'":
            return "assets/note_graphics/notes/note_down_above_line_1.svg";
          case "h'":
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
      }else{
        return "";
      }

    }

    double? getNotePosition(noteNumber){
      if(keyProvider.key=="bass"){
        return bassPositionScaleCard[noteNumber];
      }else if(keyProvider.key=="violin"){
        return violinPositionScaleCard[noteNumber];
      }else if (keyProvider.key=="tenor"){
        return tenorPositionScaleCard[noteNumber];
      }else{
        return 0;
      }
    }

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
            "assets/note_graphics/lines/${keyProvider.key}_lines.svg",
            height: 130,
          ),
          Positioned(
            top: getNotePosition(firstNote),
            left: firstNote == "empty" ? 140 : 120,
            child: SvgPicture.asset(
              notePath(firstNote),
              height: firstNote == "empty" ? 90: 140,
            ),
          ),
          Positioned(
            top: getNotePosition(secondNote),
            left: secondNote == "empty" ? 190 : 170,
            child: SvgPicture.asset(
              notePath(secondNote),
              height: secondNote == "empty" ? 90: 140,
            ),
          ),
          Positioned(
            top: getNotePosition(thirdNote),
            left: thirdNote == "empty" ? 240 : 220,
            child: SvgPicture.asset(
             notePath(thirdNote),
              height: thirdNote == "empty" ? 90: 140,
            ),
          ),
          Positioned(
            top: 205,
            left: 150,
            child: firstNote == "empty"
                ? SizedBox.shrink() // Hide the Text widget when the note is "C", "D", or "E"
                : Text(
              firstNote,
              style: PAR1,
            ),
          ),
          Positioned(
            top: 205,
            left: 200,
            child: secondNote == "empty"
                ? SizedBox.shrink() // Hide the Text widget when the note is "C", "D", or "E"
                : Text(
              secondNote,
              style: PAR1,
            ),
          ),
          Positioned(
            top: 205,
            left: 250,
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
