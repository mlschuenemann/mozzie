import 'package:flutter/material.dart';
import 'package:music_education/constants/colors.dart';
import 'package:music_education/constants/textstyle.dart';
import 'package:provider/provider.dart';
import 'package:music_education/provider/progress_point_provider.dart';

import '../provider/key_provider.dart';


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
    final keyProvider = Provider.of<KeyProvider>(context);



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
              color: progressPointNumber >= number ? keyProvider.getKeyColor() : SECONDARY,
              shape: BoxShape.circle,
            ),
            child: Text(
              number.toString(),
              style: progressPointNumber >= number ? HEADING2 : INACTIVE,
            ),
          ),
          Offstage(
            offstage: progressPointNumber == number ? false : true,
            child: SizedBox(
              width: 100,
              height: 100,
              child: CircularProgressIndicator(
                value: statusBarValue / 5 - 1 / 5,
                color: keyProvider.getKeyColor(),
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