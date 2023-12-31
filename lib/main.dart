import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:music_education/components/progress_list.dart';
import 'package:music_education/constants/colors.dart';
import 'package:music_education/constants/textstyle.dart';
import 'package:music_education/quizz.dart';
import 'package:music_education/provider/streak_provider.dart';
import 'package:music_education/screens/revision_page.dart';
import 'package:music_education/screens/support.dart';
import 'package:provider/provider.dart';
import 'package:music_education/screens/result_page.dart';
import 'components/key_choice_sheet.dart';
import 'provider/score_provider.dart';
import 'package:music_education/provider/lecture_provider.dart';
import 'package:music_education/provider/question_provider.dart';
import 'package:music_education/provider/progress_point_provider.dart';
import 'package:music_education/components/achievement_card.dart';
import 'package:music_education/screens/settings_page.dart';
import 'package:music_education/screens/impressum.dart';
import 'package:music_education/screens/privacy.dart';
import 'package:music_education/provider/key_provider.dart';

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
        ChangeNotifierProvider(
          create: (_) => KeyProvider(),
        ),
      ],
      child: MaterialApp(
        title: 'Flutter Demo',
        theme: ThemeData(
          primarySwatch: Colors.blue,
        ),
        initialRoute: 'home',
        routes: {
          "home": (context) => const MyHomePage(),
          "quizz": (context) => Quizz(),
          "result": (context) => const ResultPage(),
          "settings": (context) => const Settings(),
          "impressum": (context) => const ImpressumPage(),
          "privacy": (context) => const PrivacyPage(),
          "support": (context) => const SupportPage(),
          "revision": (context) => const RevisionPage(),
        },
        home: const MyHomePage(),
      ),
    );
  }
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
  void initState() {
    super.initState();

    Provider.of<StreakProvider>(context, listen: false).init();

    lectureProvider = Provider.of<LectureProvider>(context, listen: false);
    //lectureProvider.resetLectureNumber();

    progressPointProvider =
        Provider.of<ProgressPointProvider>(context, listen: false);
    //progressPointProvider.resetProgressPointNumber(1);
  }

  @override
  Widget build(BuildContext context) {
    final keyProvider = Provider.of<KeyProvider>(context);

    final progressPointProvider = Provider.of<ProgressPointProvider>(context);
    progressPointProvider.retrieveProgressPointNumber(keyProvider.key);
    final progressPointNumber = progressPointProvider.progressPointNumber;

    lectureProvider = Provider.of<LectureProvider>(context);
    lectureProvider.retrieveLectureNumber(keyProvider.key);
    final lectureNumber = lectureProvider.lectureNumber;

    scoreProvider = Provider.of<ScoreProvider>(context);
    scoreProvider.retrieveScore();
    final int currentScore = scoreProvider.xpPoints;

    final streakProvider = Provider.of<StreakProvider>(context);


    String iconPath(){
      if(keyProvider.key=="bass"){
        return "assets/icons/mozart_icon.svg";
      } else if(keyProvider.key=="violin"){
        return "assets/icons/turner_icon.svg";
      } else if(keyProvider.key=="tenor"){
        return "assets/icons/elton_icon.svg";
      } else{
        return "assets/icons/elton_icon.svg";
      }
    }

    int statusBarValue = lectureNumber;

    return Scaffold(
      backgroundColor: BACKGROUND,
      appBar: PreferredSize(
        preferredSize: const Size.fromHeight(kToolbarHeight),
        child: AppBar(
          backgroundColor: BACKGROUND,
          surfaceTintColor: Colors.white,
          elevation: 0.0,
          title: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Row(
                children: [
                  Container(
                    margin: const EdgeInsets.only(right: 20, left: 10),
                    child: SvgPicture.asset(
                      iconPath(),
                    ),
                  ),
                  const Text(
                    "Noten lesen",
                    style: HEADING2,
                    textAlign: TextAlign.left,
                  ),
                ],
              ),
              IconButton(
                icon: const Icon(
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
          const SizedBox(
            height: 10,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              GestureDetector(
                onTap: () {
                  key_choice_sheet(context);
                },
                child: Container(
                  padding: const EdgeInsets.only(right: 10, left: 10, top: 5, bottom: 5),
                  height: 40,
                  margin: const EdgeInsets.only(bottom: 10),
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(10),
                  ),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      SvgPicture.asset(
                          "assets/note_graphics/signs/${keyProvider.key}_key.svg"),
                      const SizedBox(
                        width: 5,
                      ),
                      const Icon(Icons.arrow_drop_down)
                    ],
                  ),
                ),
              ),
              AchievmentCard(
                imagePath: "assets/icons/flame_icon.svg",
                text: "${streakProvider.currentStreak} Tage",
                border: false,
              ),
              const AchievmentCard(
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
                buildLevelCard("Level 1", "Du lernst die wichtigsten Noten kennen"),
                const SizedBox(
                  height: 20,
                ),
                buildProgressPointList(
                    startPoint: 1,
                    statusBarValue: statusBarValue,
                    itemCount: 3,
                    progressPointNumber: progressPointNumber),
                const SizedBox(
                  height: 20,
                ),
                buildLevelCard(
                    "Level 2", "Lese alle Noten im Unfang von über zwei Oktaven"),
                const SizedBox(
                  height: 20,
                ),
                buildProgressPointList(
                    startPoint: 4,
                    statusBarValue: statusBarValue,
                    itemCount: 5,
                    progressPointNumber: progressPointNumber),
                const SizedBox(
                  height: 20,
                ),
                buildLevelCard("Level 3", "Lese Noten mit verschiedenen Vorzeichen"),
                const SizedBox(
                  height: 20,
                ),
                buildProgressPointList(
                    startPoint: 9,
                    statusBarValue: statusBarValue,
                    itemCount: 4,
                    progressPointNumber: progressPointNumber),
                const SizedBox(
                  height: 20,
                ),
                buildLevelCard("Level 4", "Trainiere bis du Profi bist"),
                const SizedBox(
                  height: 20,
                ),
                buildProgressPointList(
                    startPoint: 13,
                    statusBarValue: statusBarValue,
                    itemCount: 4,
                    progressPointNumber: progressPointNumber),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

