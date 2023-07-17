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
              top: positionChoiceCard[noteChoice],
              child: SvgPicture.asset(
                "assets/note_graphics/notes/note_up_small.svg",
              ),
            ),
            Positioned(
                top: 90,
                child: Visibility(
                  visible: displayNoteName,
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
