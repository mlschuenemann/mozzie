import 'package:music_education/provider/question_provider.dart';
import 'package:flutter/material.dart';
import 'package:music_education/constants/colors.dart';
import 'package:music_education/constants/textstyle.dart';
import 'package:provider/provider.dart';

class RevisionPage extends StatelessWidget {
  const RevisionPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final questionProvider = Provider.of<QuestionProvider>(context, listen: false);

    return Scaffold(
      backgroundColor: BACKGROUND,
      body: Column(
        //crossAxisAlignment: CrossAxisAlignment.stretch,
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          const Expanded(child: SizedBox()),
          const Icon(Icons.refresh_rounded,size: 100, color: Colors.yellow,),
          const SizedBox(
            height: 20,
          ),
          const Text(
            "Wiederhole",
            style: HEADING2,
          ),
          const SizedBox(
            height: 8,
          ),
          const Text(
            "ein paar Noten!",
            style: HEADING2,
          ),
          const Expanded(child: SizedBox()),
          GestureDetector(
            onTap: () async {
              questionProvider.shownRevisionPage();
              questionProvider.setQuestionNumber(13);
            },
            child: Container(
              margin: const EdgeInsets.only(left: 15, right: 15, bottom: 30),
              alignment: Alignment.center,
              height: 60,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(20),
                color: Colors.yellow,
              ),
              child: const Text(
                "Weiter",
                style: PAR1BLACK,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
