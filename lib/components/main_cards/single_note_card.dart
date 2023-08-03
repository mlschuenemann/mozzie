import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:music_education/constants/colors.dart';
import 'package:music_education/constants/positions.dart';
import 'package:provider/provider.dart';

import '../../provider/key_provider.dart';

class SingleNoteCard extends StatefulWidget {
   SingleNoteCard({required this.note, super.key,});

  final String note;

  @override
  State<SingleNoteCard> createState() => _SingleNoteCardState();
}

class _SingleNoteCardState extends State<SingleNoteCard> {
  List<String> sharp = ["Gis", "His", "Ais", "cis", "Fis", "Eis", "Dis", "Cis", "dis", "eis", "fis", "gis", "ais", "his", "cis'", "dis'", "eis'", "fis'", "gis'", "ais'", "his'"];

  List<String> flat = ["Ges", "B", "As", "ces", "Fes", "Es", "Des", "Ces", "des", "es", "fes", "ges", "as", "b", "ces'", "des'", "es'", "des'", "fes'", "ges'", "as'", "b'"];

   String getNoteAssetPath(String note) {
     if (sharp.contains(note)) {
       return "assets/note_graphics/signs/kreuz.svg";
     } else if (flat.contains(note)) {
       return "assets/note_graphics/signs/b.svg";
     } else {
       return ""; // Return an empty string or default asset path if needed
     }
   }

  @override
  Widget build(BuildContext context) {
    final keyProvider = Provider.of<KeyProvider>(context);

    String NotePath() {

      if(keyProvider.key=="bass"){
        List<String> upNotes = ["F", "Fis", "Fes", "G", "Gis", "Ges", "A","Ais","As", "H","His", "B", "c", "cis", "ces"];
        List<String> downNotes = ["d","dis", "des", "e","eis","es", "f","fis", "fes", "g","gis", "ges", "a","ais","as", "h", "his", "b"];

        if (upNotes.contains(widget.note)) {
          return "assets/note_graphics/notes/note_up.svg";
        } else if (downNotes.contains(widget.note)){
          return "assets/note_graphics/notes/note_down.svg";
        } else if (widget.note=="C" || widget.note=="Cis" || widget.note=="Ces"){
          return "assets/note_graphics/notes/note_up_on_line_2.svg";
        } else if (widget.note=="D" || widget.note=="Dis"|| widget.note=="Des"){
          return "assets/note_graphics/notes/note_up_below_line_1.svg";
        } else if (widget.note=="E"|| widget.note=="Eis"|| widget.note=="Es"){
          return "assets/note_graphics/notes/note_up_on_line_1.svg";
        }

        else if (widget.note=="c'"|| widget.note=="cis'" || widget.note=="ces'"){
          return "assets/note_graphics/notes/note_down_on_line_1.svg";
        } else if (widget.note=="d'"|| widget.note=="dis'" || widget.note=="des'"){
          return "assets/note_graphics/notes/note_down_above_line_1.svg";
        } else if (widget.note=="e'" || widget.note=="eis'" || widget.note=="es'"){
          return "assets/note_graphics/notes/note_down_on_line_2.svg";
        } else {
          return "";
        }
      }

      if(keyProvider.key=="violin"){
        List<String> upNotes = ["d'", "dis'", "des'","e'", "eis'","es'","f'", "fis'","fes'", "g'", "gis'","ges'", "a'", "ais'", "as'"];
        List<String> downNotes = ["h'", "his'", "b'", "c''", "cis''", "ces''", "d''", "dis''", "des''", "e''", "eis''", "es''","f''", "fis''", "fes''", "g''", "gis''", "ges''",];

        if (upNotes.contains(widget.note)) {
          return "assets/note_graphics/notes/note_up.svg";
        } else if (downNotes.contains(widget.note)){
          return "assets/note_graphics/notes/note_down.svg";
        } else if (widget.note=="a" || widget.note=="ais" || widget.note=="as"){
          return "assets/note_graphics/notes/note_up_on_line_2.svg";
        } else if (widget.note=="h" || widget.note=="his" || widget.note=="b"){
          return "assets/note_graphics/notes/note_up_below_line_1.svg";
        } else if (widget.note=="c'"|| widget.note=="cis'" || widget.note=="ces'"){
          return "assets/note_graphics/notes/note_up_on_line_1.svg";
        }

        else if (widget.note=="a''"|| widget.note=="ais''" || widget.note=="as''"){
          return "assets/note_graphics/notes/note_down_on_line_1.svg";
        } else if (widget.note=="h''"|| widget.note=="his''" || widget.note=="b''"){
          return "assets/note_graphics/notes/note_down_above_line_1.svg";
        } else if (widget.note=="c'''" || widget.note=="cis'''" || widget.note=="ces'''"){
          return "assets/note_graphics/notes/note_down_on_line_2.svg";
        } else {
          return "";
        }
      }

      if(keyProvider.key=="tenor"){
        List<String> upNotes = ["c","cis", "ces","d","dis","des","e","eis", "es","f","fis", "fes","g", "gis", "ges",];
        List<String> downNotes = ["a", "ais", "as", "h", "his", "b", "c'", "cis'", "ces'", "d'", "dis'", "des'","e'", "eis'", "es'", "f'", "fis'", "fes'",];

        if (upNotes.contains(widget.note)) {
          return "assets/note_graphics/notes/note_up.svg";
        } else if (downNotes.contains(widget.note)){
          return "assets/note_graphics/notes/note_down.svg";
        } else if (widget.note=="G" || widget.note=="Gis" || widget.note=="Ges"){
          return "assets/note_graphics/notes/note_up_on_line_2.svg";
        } else if (widget.note=="A" || widget.note=="Ais" || widget.note=="As"){
          return "assets/note_graphics/notes/note_up_below_line_1.svg";
        } else if (widget.note=="H"|| widget.note=="His" || widget.note=="B"){
          return "assets/note_graphics/notes/note_up_on_line_1.svg";
        }

        else if (widget.note=="g'"|| widget.note=="gis'" || widget.note=="ges'"){
          return "assets/note_graphics/notes/note_down_on_line_1.svg";
        } else if (widget.note=="a'"|| widget.note=="ais'" || widget.note=="as'"){
          return "assets/note_graphics/notes/note_down_above_line_1.svg";
        } else if (widget.note=="h'" || widget.note=="his'" || widget.note=="b'"){
          return "assets/note_graphics/notes/note_down_on_line_2.svg";
        } else {
          return "";
        }
      }

      else{
        return "";
      }

    }

    double? getNotePosition(note){
      if(keyProvider.key=="bass"){
        return bassPositionScaleCard[note];
      }else if(keyProvider.key=="violin"){
        return violinPositionScaleCard[note];
      }else if (keyProvider.key=="tenor"){
        return tenorPositionScaleCard[note];
      }else{
        return 0;
      }
    }


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
            "assets/note_graphics/lines/${keyProvider.key}_lines.svg",
            height: 130,
          ),
          // Make sure positionCard[note] is within the bounds of the Container
          Positioned(
            top: (getNotePosition(widget.note)?? 0) - 9, // Adjust this value if needed
            left: 180, // Adjust this value if needed
            child: SvgPicture.asset(
              NotePath(),
              height: 140,
            ),
          ),
          Visibility(
            visible: sharp.contains(widget.note) || flat.contains(widget.note) ? true : false,
            child: Positioned(
              top: sharp.contains(widget.note) ? ((getNotePosition(widget.note) ?? 0)+42) : ((getNotePosition(widget.note)?? 0)+35 ) , // Adjust this value if needed
              left: 170, // Adjust this value if needed
              child: SvgPicture.asset(
                getNoteAssetPath(widget.note),
                height: 40,
              ),
            ),
          ),
        ],
      ),
    );
  }
}