import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:music_education/constants/colors.dart';
import 'package:music_education/constants/textstyle.dart';
import 'package:music_education/components/main_cards/note_name_card.dart';
import 'package:music_education/components/choice_cards/note_choice_card.dart';
import 'package:music_education/screens/quizz.dart';
import 'package:provider/provider.dart';
import 'package:music_education/screens/result_page.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:music_education/provider/lecture_provider.dart';
import 'package:music_education/provider/progress_point_provider.dart';


class ProgressPoint extends StatelessWidget {
  const ProgressPoint({
    Key? key,
    required this.statusBarValue,
    required this.marginRight,
    required this.marginLeft,
    required this.number,
  }) : super(key: key);

  final int statusBarValue;
  final double marginRight;
  final double marginLeft;
  final int number;


  @override
  Widget build(BuildContext context) {

    final progressPointProvider = Provider.of<ProgressPointProvider>(context);
    final progressPointNumber = progressPointProvider.progressPointNumber;

    return Container(
      margin: EdgeInsets.only(right: marginRight, left: marginLeft),
      child: Stack(
        alignment: Alignment.center,
        children: [
          Container(
            alignment: Alignment.center,
            width: 75,
            height: 75,
            decoration: BoxDecoration(
              color: progressPointNumber >= number ? LILA : SECONDARY,
              shape: BoxShape.circle,
            ),
            child: Text(
              number.toString(),
              style: progressPointNumber >= number ? HEADING2 : INACTIVE,
            ),
          ),
          Offstage(
            offstage: progressPointNumber == number ? false : true,
            child: Container(
              width: 100,
              height: 100,
              child: CircularProgressIndicator(
                value: statusBarValue / 5 - 1 / 5,
                color: LILA,
                backgroundColor: SECONDARY,
                strokeWidth: 10,
              ),
            ),
          ),
        ],
      ),
    );
  }
}