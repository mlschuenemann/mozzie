import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:music_education/constants/colors.dart';
import 'package:music_education/constants/textstyle.dart';
import 'package:music_education/components/main_cards/note_name_card.dart';
import 'package:music_education/components/choice_cards/note_choice_card.dart';
import 'package:music_education/screens/quizz.dart';
import 'package:music_education/provider/streak_provider.dart';
import 'package:music_education/screens/support.dart';
import 'package:provider/provider.dart';
import 'package:music_education/screens/result_page.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'provider/score_provider.dart';
import 'package:music_education/provider/lecture_provider.dart';
import 'package:music_education/components/progress_point.dart';
import 'package:music_education/provider/question_provider.dart';
import 'package:music_education/provider/progress_point_provider.dart';
import 'package:music_education/components/level_card.dart';
import 'package:music_education/components/achievement_card.dart';
import 'package:music_education/screens/settings_page.dart';
import 'package:music_education/screens/impressum.dart';
import 'package:music_education/screens/privacy.dart';

void main() async {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(
          create: (_) => QuestionProvider(),
        ),
        ChangeNotifierProvider(
          create: (_) => ScoreProvider(),
        ),
        ChangeNotifierProvider(
          create: (_) => LectureProvider(),
        ),
        ChangeNotifierProvider(
          create: (_) => ProgressPointProvider(),
        ),
        ChangeNotifierProvider(
          create: (_) => StreakProvider(),
        ),
      ],
      child: MaterialApp(
        title: 'Flutter Demo',
        theme: ThemeData(
          primarySwatch: Colors.blue,
        ),
        initialRoute: 'home',
        routes: {
          "home": (context) => MyHomePage(),
          "quizz": (context) => Quizz(),
          "result": (context) => ResultPage(),
          "settings": (context) => Settings(),
          "impressum": (context) => ImpressumPage(),
          "privacy" : (context) => PrivacyPage(),
          "support" : (context) => SupportPage(),
        },
        home: const MyHomePage(),
      ),
    );
  }
}

enum Point {
  first,
  second,
  third,
  fourth,
  fifth,
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({Key? key}) : super(key: key);

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  // Current status value (between 1 and 5)

  late ScoreProvider scoreProvider;
  late LectureProvider lectureProvider;
  late ProgressPointProvider progressPointProvider;

  @override
  void initState(){
    super.initState();
    Provider.of<StreakProvider>(context, listen: false).init();

    lectureProvider = Provider.of<LectureProvider>(context, listen: false);
    //lectureProvider.resetLectureNumber();

    progressPointProvider = Provider.of<ProgressPointProvider>(context, listen:false);
    //progressPointProvider.resetProgressPointNumber();
  }

  @override
  Widget build(BuildContext context) {
    final progressPointProvider = Provider.of<ProgressPointProvider>(context);
    progressPointProvider.retrieveProgressPointNumber();
    final progressPointNumber = progressPointProvider.progressPointNumber;

    lectureProvider = Provider.of<LectureProvider>(context);
    lectureProvider.retrieveLectureNumber();
    final lectureNumber = lectureProvider.lectureNumber;

    scoreProvider = Provider.of<ScoreProvider>(context);
    scoreProvider.retrieveScore();
    final int? currentScore = scoreProvider.xpPoints;

    final streakProvider = Provider.of<StreakProvider>(context);

    int statusBarValue = lectureNumber;

    return Scaffold(
      backgroundColor: BACKGROUND,
      appBar: PreferredSize(
        preferredSize: Size.fromHeight(kToolbarHeight),
        child: AppBar(
          backgroundColor: BACKGROUND,
          elevation: 0.0,
          title: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Row(
                children: [
                  Container(
                    margin: EdgeInsets.only(right: 20, left: 10),
                    child: SvgPicture.asset(
                      "assets/icons/mozart_icon.svg",
                    ),
                  ),
                  Text(
                    "Noten lesen",
                    style: HEADING2,
                    textAlign: TextAlign.left,
                  ),
                ],
              ),

              IconButton(
                icon: Icon(
                  Icons.settings,
                  color: Colors.white,
                ),
                onPressed: () {
                  Navigator.pushNamed(context, "settings");
                },
              ),
            ],
          ),
        ),
      ),

      body: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          SizedBox(height: 10,),
          Row(
            children: [
              AchievmentCard(
                imagePath: "assets/icons/flame_icon.svg",
                text: "${streakProvider.currentStreak} Tage",
                border: false,
              ),
              AchievmentCard(
                imagePath: "assets/icons/heart_icon.svg",
                text: "∞",
                border: false,
              ),
              AchievmentCard(
                imagePath: "assets/icons/XP_icon.svg",
                text: "$currentScore",
                border: false,
              ),

            ],
          ),
          Expanded(
            child: ListView(
              children: [

                LevelCard(
                  levelText: "Level 1",
                  subText: "Lerne deine ersten Noten (C bis c)",
                ),
                SizedBox(height: 20,),
                ProgressPoint(
                  number: 1,
                  marginLeft: 0,
                  marginRight: 220,
                  statusBarValue: statusBarValue,
                ),
                SvgPicture.asset(
                  "assets/graphics/vector_1.svg",
                  colorFilter: progressPointNumber <= 1
                      ? ColorFilter.mode(SECONDARY, BlendMode.srcIn)
                      : null,
                ),
                ProgressPoint(
                  number: 2,
                  marginLeft: 220,
                  marginRight: 0,
                  statusBarValue: statusBarValue,
                ),
                SvgPicture.asset(
                  "assets/graphics/vector_2.svg",
                  colorFilter: progressPointNumber <= 2
                      ? ColorFilter.mode(SECONDARY, BlendMode.srcIn)
                      : null,
                ),
                ProgressPoint(
                  number: 3,
                  marginLeft: 0,
                  marginRight: 220,
                  statusBarValue: statusBarValue,
                ),
                SizedBox(height: 20,),
                LevelCard(
                  levelText: "Level 2",
                  subText: "Lerne über zwei Oktaven und erste Vorzeichen",
                ),
                SizedBox(height: 20,),

                ProgressPoint(
                  number: 4,
                  marginLeft: 220,
                  marginRight: 0,
                  statusBarValue: statusBarValue,
                ),
                SvgPicture.asset(
                  "assets/graphics/vector_2.svg",
                  colorFilter: progressPointNumber <= 4
                      ? ColorFilter.mode(SECONDARY, BlendMode.srcIn)
                      : null,
                ),

                ProgressPoint(
                  number: 5,
                  marginLeft: 0,
                  marginRight: 220,
                  statusBarValue: statusBarValue,
                ),
                SvgPicture.asset(
                  "assets/graphics/vector_1.svg",
                  colorFilter: progressPointNumber <= 5
                      ? ColorFilter.mode(SECONDARY, BlendMode.srcIn)
                      : null,
                ),
                ProgressPoint(
                  number: 6,
                  marginLeft: 220,
                  marginRight: 0,
                  statusBarValue: statusBarValue,
                ),
                SvgPicture.asset(
                  "assets/graphics/vector_2.svg",
                  colorFilter: progressPointNumber <= 6
                      ? ColorFilter.mode(SECONDARY, BlendMode.srcIn)
                      : null,
                ),
                ProgressPoint(
                  number: 7,
                  marginLeft: 0,
                  marginRight: 220,
                  statusBarValue: statusBarValue,
                ),
                SvgPicture.asset(
                  "assets/graphics/vector_1.svg",
                  colorFilter: progressPointNumber <= 7
                      ? ColorFilter.mode(SECONDARY, BlendMode.srcIn)
                      : null,
                ),
                ProgressPoint(
                  number: 8,
                  marginLeft: 220,
                  marginRight: 0,
                  statusBarValue: statusBarValue,
                ),
                SizedBox(height: 20,),
                LevelCard(
                  levelText: "Level 3",
                  subText: "Lerne alle Vorzeichen",
                ),
                SizedBox(height: 20,),
                ProgressPoint(
                  number: 9,
                  marginLeft: 0,
                  marginRight: 220,
                  statusBarValue: statusBarValue,
                ),
                SvgPicture.asset(
                  "assets/graphics/vector_1.svg",
                  colorFilter: progressPointNumber <= 9
                      ? ColorFilter.mode(SECONDARY, BlendMode.srcIn)
                      : null,
                ),
                ProgressPoint(
                  number: 10,
                  marginLeft: 220,
                  marginRight: 0,
                  statusBarValue: statusBarValue,
                ),
                SvgPicture.asset(
                  "assets/graphics/vector_2.svg",
                  colorFilter: progressPointNumber <= 6
                      ? ColorFilter.mode(SECONDARY, BlendMode.srcIn)
                      : null,
                ),
                ProgressPoint(
                  number: 11,
                  marginLeft: 0,
                  marginRight: 220,
                  statusBarValue: statusBarValue,
                ),
                SvgPicture.asset(
                  "assets/graphics/vector_1.svg",
                  colorFilter: progressPointNumber <= 11
                      ? ColorFilter.mode(SECONDARY, BlendMode.srcIn)
                      : null,
                ),
                ProgressPoint(
                  number: 12,
                  marginLeft: 220,
                  marginRight: 0,
                  statusBarValue: statusBarValue,
                ),
                SizedBox(height: 20,),
                LevelCard(
                  levelText: "Level 4",
                  subText: "Trainiere bist du Profi bist",
                ),
                SizedBox(height: 20,),
                ProgressPoint(
                  number: 13,
                  marginLeft: 0,
                  marginRight: 220,
                  statusBarValue: statusBarValue,
                ),
                SvgPicture.asset(
                  "assets/graphics/vector_1.svg",
                  colorFilter: progressPointNumber <= 13
                      ? ColorFilter.mode(SECONDARY, BlendMode.srcIn)
                      : null,
                ),
                ProgressPoint(
                  number: 14,
                  marginLeft: 220,
                  marginRight: 0,
                  statusBarValue: statusBarValue,
                ),
                SvgPicture.asset(
                  "assets/graphics/vector_2.svg",
                  colorFilter: progressPointNumber <= 14
                      ? ColorFilter.mode(SECONDARY, BlendMode.srcIn)
                      : null,
                ),
                ProgressPoint(
                  number: 15,
                  marginLeft: 0,
                  marginRight: 220,
                  statusBarValue: statusBarValue,
                ),
                SvgPicture.asset(
                  "assets/graphics/vector_1.svg",
                  colorFilter: progressPointNumber <= 15
                      ? ColorFilter.mode(SECONDARY, BlendMode.srcIn)
                      : null,
                ),
                ProgressPoint(
                  number: 16,
                  marginLeft: 220,
                  marginRight: 0,
                  statusBarValue: statusBarValue,
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
