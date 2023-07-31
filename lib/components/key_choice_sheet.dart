import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:music_education/constants/colors.dart';
import 'package:music_education/constants/textstyle.dart';
import 'package:music_education/provider/key_provider.dart';
import 'package:provider/provider.dart';

enum Card {
  first,
  second,
  third,
}

var selectedCard = Card.first;


void key_choice_sheet(BuildContext context) {
  showModalBottomSheet(
    context: context,
    isScrollControlled: true,
    backgroundColor: Colors.transparent,
    builder: (BuildContext context) {
      final keyProvider = Provider.of<KeyProvider>(context);

      String iconPath(){
        if(keyProvider.key=="bass"){
          return "assets/icons/mozart_icon.svg";
        } else if(keyProvider.key=="violin"){
          return "assets/icons/turner_icon.svg";
        } else if(keyProvider=="tenor"){
          return "assets/icons/elton_icon.svg";
        } else{
          return "assets/icons/elton_icon.svg";
        }
      }

      return StatefulBuilder(
        builder: (BuildContext context, StateSetter setState) {
          return Container(
              padding: EdgeInsets.only(top: 30, bottom: 50),
              color: BACKGROUND,
              height: MediaQuery.of(context).size.height * 0.3,
              child: SingleChildScrollView(
                // Wrap the Row with SingleChildScrollView
                scrollDirection: Axis.horizontal,
                // Set the scroll direction to horizontal
                child: Row(
                  children: [
                    SizedBox(
                      width: 20,
                    ),
                    SvgPicture.asset(iconPath(),
                    height: 130,),
                    Column(

                      children: [
                        Container(
                          margin: const EdgeInsets.only(bottom: 20,left: 10, top: 20),
                          padding: const EdgeInsets.all(15),
                          alignment: Alignment.center,
                          decoration: BoxDecoration(
                            color: SECONDARY,
                            borderRadius: BorderRadius.circular(20),
                          ),
                          height: 70,
                          width: 150,
                          child: const Text(
                            'Wähle einen\n Notenschlüssel',
                            style: PAR2,
                            textAlign: TextAlign.center,
                          ),
                        ),
                        Icon(Icons.arrow_forward_ios_rounded, color: SECONDARY, size: 30,)
                      ],
                    ),
                    SizedBox(
                      width: 20,
                    ),
                    GestureDetector(
                      onTap: () {
                        setState(() {
                          selectedCard = Card.first;
                          keyProvider.changeKey("bass");
                          Navigator.pop(context);
                        });
                      },
                      child: KeyChoiceCard(
                        borderColor:
                            selectedCard == Card.first ? keyProvider.getKeyColor() : SECONDARY,
                        keyImage: "assets/note_graphics/signs/bass_key.svg",
                        keyName: "BASSSCHLÜSSEL",
                      ),
                    ),
                    SizedBox(
                      width: 20,
                    ),
                    GestureDetector(
                      onTap: () {
                        setState(() {
                          selectedCard = Card.second;
                          keyProvider.changeKey("violin");
                          Navigator.pop(context);
                        });
                      },
                      child: KeyChoiceCard(
                        borderColor:
                            selectedCard == Card.second ? keyProvider.getKeyColor() : SECONDARY,
                        keyImage: "assets/note_graphics/signs/violin_key.svg",
                        keyName: "VIOLINSCHLÜSSEL",
                      ),
                    ),

                    SizedBox(
                      width: 20,
                    ),
                    GestureDetector(
                      onTap: () {
                        setState(() {
                          selectedCard = Card.third;
                          keyProvider.changeKey("tenor");
                          Navigator.pop(context);
                        });
                      },
                      child: KeyChoiceCard(
                        borderColor:
                        selectedCard == Card.third ? keyProvider.getKeyColor() : SECONDARY,
                        keyImage: "assets/note_graphics/signs/tenor_key.svg",
                        keyName: "TENORSCHLÜSSEL",
                      ),
                    ),

                    SizedBox(
                      width: 20,
                    ),

                  ],
                ),
              ),);
        },
      );
    },
  );
}

class KeyChoiceCard extends StatelessWidget {
  const KeyChoiceCard({
    required this.keyImage,
    required this.keyName,
    required this.borderColor,
    super.key,
  });

  final String keyName;
  final String keyImage;
  final Color borderColor;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(15),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(25),
        border: Border.all(color: borderColor, width: 8),
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.end,
        children: [
          Expanded(child: SizedBox()),
          SvgPicture.asset(
            keyImage,
          ),
          Expanded(child: SizedBox()),
          Text(
            keyName,
            style: TextStyle(
              fontWeight: FontWeight.w800,
              fontSize: 14,
              color: Colors.grey.shade400,
            ),
          ),
        ],
      ),
    );
  }
}
