import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:music_education/constants/colors.dart';
import 'package:music_education/constants/textstyle.dart';
import 'package:rive/rive.dart';

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
