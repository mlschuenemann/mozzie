import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:music_education/constants/colors.dart';
import 'package:music_education/constants/positions.dart';
import 'package:provider/provider.dart';

import '../../provider/key_provider.dart';
class SingleNoteCard extends StatelessWidget {
   SingleNoteCard({required this.note, super.key,});

  final String note;



  List<String> sharp = ["Gis", "His", "Ais", "cis", "Fis", "Eis", "Dis", "Cis", "dis", "eis", "fis", "gis", "ais", "his", "cis'", "dis'"];
  List<String> flat = ["Ges", "B", "As", "ces", "Fes", "Es", "Des", "Ces", "des", "es", "fes", "ges", "as", "b", "ces'", "des'"];

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
        List<String> upNotes = ["F", "Fes", "G", "Gis", "A","Ais", "H","His", "c", "cis"];
        List<String> downNotes = ["d","dis", "e","eis", "f","fis", "g","gis", "a","ais", "h", "his"];

        if (upNotes.contains(note)) {
          return "assets/note_graphics/notes/note_up.svg";
        } else if (downNotes.contains(note)){
          return "assets/note_graphics/notes/note_down.svg";
        } else if (note=="C" || note=="Cis"){
          return "assets/note_graphics/notes/note_up_on_line_2.svg";
        } else if (note=="D" || note=="Dis"){
          return "assets/note_graphics/notes/note_up_below_line_1.svg";
        } else if (note=="E"|| note=="Eis"){
          return "assets/note_graphics/notes/note_up_on_line_1.svg";
        }

        else if (note=="c'"|| note=="cis'"){
          return "assets/note_graphics/notes/note_down_on_line_1.svg";
        } else if (note=="d'"|| note=="dis'"){
          return "assets/note_graphics/notes/note_down_above_line_1.svg";
        } else if (note=="e'" || note=="eis'"){
          return "assets/note_graphics/notes/note_down_on_line_2.svg";
        } else {
          return "";
        }
      }

      if(keyProvider.key=="violin"){
        List<String> upNotes = ["d'", "dis'", "e'", "eis'", "f'", "fis'", "g'", "gis'", "a'", "ais'"];
        List<String> downNotes = ["h'", "his'", "c''", "cis''", "d''", "dis''", "e''", "eis''", "f''", "fis''", "g''", "gis''"];

        if (upNotes.contains(note)) {
          return "assets/note_graphics/notes/note_up.svg";
        } else if (downNotes.contains(note)){
          return "assets/note_graphics/notes/note_down.svg";
        } else if (note=="a" || note=="ais"){
          return "assets/note_graphics/notes/note_up_on_line_2.svg";
        } else if (note=="h" || note=="his"){
          return "assets/note_graphics/notes/note_up_below_line_1.svg";
        } else if (note=="c'"|| note=="cis'"){
          return "assets/note_graphics/notes/note_up_on_line_1.svg";
        }

        else if (note=="a''"|| note=="ais''"){
          return "assets/note_graphics/notes/note_down_on_line_1.svg";
        } else if (note=="h''"|| note=="his''"){
          return "assets/note_graphics/notes/note_down_above_line_1.svg";
        } else if (note=="c'''" || note=="cis'''"){
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
            top: (getNotePosition(note)?? 0) - 9, // Adjust this value if needed
            left: 160, // Adjust this value if needed
            child: SvgPicture.asset(
              NotePath(),
              height: 140,
            ),
          ),
          Visibility(
            visible: sharp.contains(note) || flat.contains(note) ? true : false,
            child: Positioned(
              top: (bassPositionScaleCard[note] ?? 0) + 41, // Adjust this value if needed
              left: 150, // Adjust this value if needed
              child: SvgPicture.asset(
                getNoteAssetPath(note),
                height: 40,
              ),
            ),
          ),
        ],
      ),
    );
  }

}