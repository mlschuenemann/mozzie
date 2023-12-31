import 'package:flutter/material.dart';
import 'package:music_education/constants/colors.dart';
import 'package:music_education/constants/textstyle.dart';

class Settings extends StatelessWidget {
  const Settings({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: BACKGROUND,
      appBar: AppBar(
        title: const Text('Einstellungen'),
        elevation: 0.0,
        backgroundColor: BACKGROUND,// Remove the shadow from AppBar
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          const Expanded(child: SizedBox()),
          const Divider(color: Colors.white),
          InkWell(
            onTap: () {
              // Handle the 'Support' item click
              Navigator.pushNamed(context, "support");
            },
            child: const ListTile(
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
          const Divider(color: Colors.white), // Horizontal divider will be added here
          InkWell(
            onTap: () {
              Navigator.pushNamed(context, "privacy");
              // Handle the 'Datenschutz' item click
            },
            child: const ListTile(
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
          const Divider(color: Colors.white), // Another horizontal divider
          InkWell(
            onTap: () {
              // Handle the 'Impressum' item click
              Navigator.pushNamed(context, "impressum");
            },
            child: const ListTile(
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
          const Divider(color: Colors.white),
          const Expanded(child: SizedBox()),
        ],
      ),

    );
  }
}
