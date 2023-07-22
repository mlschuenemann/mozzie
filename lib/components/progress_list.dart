import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:music_education/components/fast_forward_button.dart';
import 'package:music_education/constants/colors.dart';
import 'package:music_education/components/progress_point.dart';
import 'package:music_education/components/level_card.dart';


Widget buildProgressPointList({
  required int startPoint,
  required int statusBarValue,
  required int itemCount,
  required int progressPointNumber,
}) {
  return ListView.builder(
    shrinkWrap: true,
    physics: const NeverScrollableScrollPhysics(),
    itemCount: itemCount,
    itemBuilder: (context, index) {
      final point = startPoint + index;
      return Column(
        children: [
          if (point == startPoint && startPoint != 1)
            Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                ProgressPoint(
                  number: point,
                  marginLeft: progressPointNumber == point ? 36 : 46,
                  marginRight: 30,
                  statusBarValue: statusBarValue,
                ),
                Visibility(
                  visible: point == progressPointNumber ? false : true,
                  child: FastForwardButton(
                    resetValue: startPoint,
                    icon: point > progressPointNumber
                        ? Icons.fast_forward_rounded
                        : Icons.arrow_back_ios_rounded,
                    text: point > progressPointNumber
                        ? "Hierhin springen"
                        : "Zurück springen",
                    borderColor: point > progressPointNumber ? LILA : SECONDARY,
                  ),
                ),
              ],
            ),
          if (point != startPoint || startPoint == 1)
            ProgressPoint(
              number: point,
              marginLeft: index % 2 == 0 ? 0 : 220,
              marginRight: index % 2 == 0 ? 220 : 0,
              statusBarValue: statusBarValue,
            ),
          if (index < itemCount - 1)
            SvgPicture.asset(
              index % 2 == 0
                  ? "assets/graphics/vector_1.svg"
                  : "assets/graphics/vector_2.svg",
              colorFilter: progressPointNumber <= point
                  ? const ColorFilter.mode(SECONDARY, BlendMode.srcIn)
                  : null,
            ),
        ],
      );
    },
  );
}

Widget buildLevelCard(String levelText, String subText) {
  return LevelCard(
    levelText: levelText,
    subText: subText,
  );
}

