import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:music_education/constants/colors.dart';
import 'package:music_education/constants/textstyle.dart';
import 'package:music_education/components/choice_cards/note_choice_card.dart';
import 'package:music_education/components/main_cards/scale_card.dart';
import 'package:music_education/screens/quizz.dart';
import 'package:music_education/screens/question_pages/scale_question.dart';
import 'package:music_education/components/choice_cards/letter_choice_card.dart';
import 'package:music_education/components/main_cards/single_note_card.dart';
import 'package:music_education/components/result_answer_sheet.dart';
import 'package:music_education/data.dart';
import 'package:provider/provider.dart';
import 'package:music_education/provider/question_provider.dart';
import 'package:flutter/services.dart';
import 'package:audioplayers/audioplayers.dart';

enum Card {
  first,
  second,
  third,
  fourth,
  none,
}

class SingleNoteQuestion extends StatefulWidget {
  const SingleNoteQuestion({
    required this.firstChoice,
    required this.secondChoice,
    required this.thirdChoice,
    required this.fourthChoice,
    required this.instrument,
    required this.note,
    required this.questionNumber,
    required this.lectureNumber,
    required this.progressPointNumber,
    super.key,
  });

  final String firstChoice;
  final String secondChoice;
  final String thirdChoice;
  final String fourthChoice;
  final String instrument;
  final String note;
  final int questionNumber;
  final int lectureNumber;
  final int progressPointNumber;

  @override
  State<SingleNoteQuestion> createState() => _SingleNoteQuestionState();
}

class _SingleNoteQuestionState extends State<SingleNoteQuestion> {
  void resetBordern() {
    selectedCard = Card.none;
  }

  Card selectedCard = Card.none;

  Future<void> _showBottomSheet(BuildContext context, bool result) async {
    await showModalBottomSheet(
      context: context,
      builder: (BuildContext context) {
        return FractionallySizedBox(
          heightFactor: 0.42, // Adjust the height factor as per your preference
          child: MyBottomSheet(
            result: result,
            questionNumber: widget.questionNumber,
          ),
        );
      },
    );
  }

  Future<void> checkAnswer(Card userPickedAnswer) async {
    final questionData = data[widget.progressPointNumber]?[widget.lectureNumber]
        ?[widget.questionNumber];

    String correctAnswer =
        questionData?["note"] ?? questionData?["letter"] ?? "";

    late String answer;

    if (userPickedAnswer == Card.first) {
      answer = questionData?["firstChoice"] ?? "";
    } else if (userPickedAnswer == Card.second) {
      answer = questionData?["secondChoice"] ?? "";
    } else if (userPickedAnswer == Card.third) {
      answer = questionData?["thirdChoice"] ?? "";
    } else {
      answer = questionData?["fourthChoice"] ?? "";
    }

    if (answer == correctAnswer) {
      final player = AudioPlayer();
      await player.setVolume(0.5);
      await player.play(
        AssetSource('sounds/success.wav'),
      );
      await _showBottomSheet(context, true);
    } else {
      await _showBottomSheet(context, false);
      Provider.of<QuestionProvider>(context, listen: false).addIncorrectQuestion(widget.questionNumber);
    }
  }

  @override
  Widget build(BuildContext context) {
    final questionProvider = Provider.of<QuestionProvider>(context);

    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            Container(
              padding: const EdgeInsets.only(left: 15, top: 0, bottom: 30),
              child: const Text(
                'Ergänze den Notennamen',
                textAlign: TextAlign.center,
                style: HEADING2,
              ),
            ),
          ],
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          crossAxisAlignment: CrossAxisAlignment.end,
          children: [
            SvgPicture.asset("assets/instruments/${widget.instrument}.svg"),
            Container(
              margin: const EdgeInsets.only(bottom: 50),
              padding: const EdgeInsets.all(15),
              alignment: Alignment.center,
              decoration: BoxDecoration(
                color: SECONDARY,
                borderRadius: BorderRadius.circular(20),
              ),
              height: 70,
              width: 200,
              child: const Text(
                'G, A, H ... G, A, H',
                style: PAR1,
              ),
            ),
          ],
        ),
        SingleNoteCard(
          note: widget.note,
        ),
        const Expanded(flex: 1, child: SizedBox()),
        Container(
          margin: const EdgeInsets.only(left: 15, right: 15, bottom: 30),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              GestureDetector(
                onTap: () {
                  HapticFeedback.lightImpact();
                  setState(() {
                    selectedCard = Card.first;
                  });
                },
                child: LetterChoiceCard(
                  letter: widget.firstChoice,
                  borderColor: selectedCard == Card.first ? GREEN : SECONDARY,
                ),
              ),
              GestureDetector(
                onTap: () {
                  HapticFeedback.lightImpact();
                  setState(() {
                    selectedCard = Card.second;
                  });
                },
                child: LetterChoiceCard(
                  letter: widget.secondChoice,
                  borderColor: selectedCard == Card.second ? GREEN : SECONDARY,
                ),
              ),
              GestureDetector(
                onTap: () {
                  HapticFeedback.lightImpact();
                  setState(() {
                    selectedCard = Card.third;
                  });
                },
                child: LetterChoiceCard(
                  letter: widget.thirdChoice,
                  borderColor: selectedCard == Card.third ? GREEN : SECONDARY,
                ),
              ),
              GestureDetector(
                onTap: () {
                  HapticFeedback.lightImpact();
                  setState(() {
                    selectedCard = Card.fourth;
                  });
                },
                child: LetterChoiceCard(
                  letter: widget.fourthChoice,
                  borderColor: selectedCard == Card.fourth ? GREEN : SECONDARY,
                ),
              ),
            ],
          ),
        ),
        GestureDetector(
          onTap: () async {
            if (selectedCard != Card.none) {
              if (questionProvider.revisionMode == false) {
                HapticFeedback.mediumImpact();
                await checkAnswer(selectedCard);
                questionProvider.nextQuestion();
                resetBordern();
              }else{
                HapticFeedback.mediumImpact();
                await checkAnswer(selectedCard);
                questionProvider.setQuestionNumber(13);
                resetBordern();
              }

            }
          },
          child: Container(
            margin: const EdgeInsets.only(left: 15, right: 15, bottom: 20),
            alignment: Alignment.center,
            height: 60,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(20),
              color: selectedCard == Card.none ? SECONDARY : GREEN,
            ),
            child: const Text(
              "Weiter",
              style: PAR1,
            ),
          ),
        ),
      ],
    );
  }
}
