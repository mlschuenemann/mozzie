import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:music_education/constants/colors.dart';
import 'package:music_education/constants/textstyle.dart';
import 'package:music_education/components/main_cards/note_name_card.dart';
import 'package:music_education/components/choice_cards/note_choice_card.dart';
import 'package:music_education/screens/quizz.dart';
import 'package:music_education/provider/streak_provider.dart';
import 'package:provider/provider.dart';
import 'package:music_education/screens/result_page.dart';
import 'package:shared_preferences/shared_preferences.dart';
import '../components/streak_animation.dart';
import '../provider/score_provider.dart';
import 'package:music_education/provider/lecture_provider.dart';
import 'package:music_education/components/progress_point.dart';
import 'package:music_education/provider/question_provider.dart';
import 'package:music_education/provider/progress_point_provider.dart';
import 'package:music_education/components/level_card.dart';
import 'package:music_education/components/achievement_card.dart';

class Settings extends StatelessWidget {
  const Settings({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: BACKGROUND,
      appBar: AppBar(
        title: Text('Einstellungen'),
        elevation: 0.0,
        backgroundColor: BACKGROUND,// Remove the shadow from AppBar
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          Expanded(child: SizedBox()),
          Divider(color: Colors.white),
          InkWell(
            onTap: () {
              // Handle the 'Support' item click
              Navigator.pushNamed(context, "support");
            },
            child: ListTile(
              title: Text(
                'Support',
                style: PAR1,
              ),
              trailing: Icon(
                Icons.arrow_forward_ios,
                color: Colors.white,
              ),
            ),
          ),
          Divider(color: Colors.white), // Horizontal divider will be added here
          InkWell(
            onTap: () {
              Navigator.pushNamed(context, "privacy");
              // Handle the 'Datenschutz' item click
            },
            child: ListTile(
              title: Text(
                'Datenschutz',
                style: PAR1,
              ),
              trailing: Icon(
                Icons.arrow_forward_ios,
                color: Colors.white,
              ),
            ),
          ),
          Divider(color: Colors.white), // Another horizontal divider
          InkWell(
            onTap: () {
              // Handle the 'Impressum' item click
              Navigator.pushNamed(context, "impressum");
            },
            child: ListTile(
              title: Text(
                'Impressum',
                style: PAR1,
              ),
              trailing: Icon(
                Icons.arrow_forward_ios,
                color: Colors.white,
              ),
            ),
          ),
          Divider(color: Colors.white),
          Expanded(child: SizedBox()),
        ],
      ),
      bottomNavigationBar: Container(
        padding: EdgeInsets.only(left: 16, right: 16, top: 16 ,bottom: 40),
        color: Colors.grey[800],
        child: Text(
          '© ${DateTime.now().year} Martin Schünemann. All rights reserved.',
          textAlign: TextAlign.center,
          style: TextStyle(
            color: Colors.white,
          ),
        ),
      ),
    );
  }
}
