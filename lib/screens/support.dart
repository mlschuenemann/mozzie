import 'package:flutter/material.dart';
import 'package:music_education/constants/colors.dart';
import 'package:music_education/constants/textstyle.dart';

class SupportPage extends StatelessWidget {
  const SupportPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Support'),
        elevation: 0.0,
        backgroundColor: BACKGROUND,// Remove the shadow from AppBar
      ),
      backgroundColor: BACKGROUND,
      body: SingleChildScrollView(
        padding: EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Text(
              'Kontaktieren Sie uns',
              style: TextStyle(
                color: Colors.white,
                fontSize: 24,
                fontWeight: FontWeight.bold,
              ),
            ),
            SizedBox(height: 16),
            Text(
              'Bei Fragen, Problemen oder Anregungen zur App/Website können Sie uns gerne kontaktieren:',
              style: TextStyle(
                color: Colors.white,
                fontSize: 16,
                fontWeight: FontWeight.w300, // Thinner font-weight
              ),
            ),
            SizedBox(height: 16),
            Text(
              'E-Mail: support@example.com',
              style: TextStyle(
                color: Colors.white,
                fontSize: 16,
                fontWeight: FontWeight.w300, // Thinner font-weight
              ),
            ),
            SizedBox(height: 8),
            Text(
              'Telefon: +123 456 789',
              style: TextStyle(
                color: Colors.white,
                fontSize: 16,
                fontWeight: FontWeight.w300, // Thinner font-weight
              ),
            ),
            SizedBox(height: 16),
            Text(
              'Unser Support-Team steht Ihnen Montag bis Freitag von 9:00 bis 17:00 Uhr zur Verfügung. Wir bemühen uns, Ihre Anfragen so schnell wie möglich zu beantworten.',
              style: TextStyle(
                color: Colors.white,
                fontSize: 16,
                fontWeight: FontWeight.w300, // Thinner font-weight
              ),
            ),
          ],
        ),
      ),
      bottomNavigationBar: Container(
        padding: EdgeInsets.all(16),
        color: Colors.grey[800],
        child: Text(
          '© ${DateTime.now().year} Ihr Firmenname. Alle Rechte vorbehalten.',
          textAlign: TextAlign.center,
          style: TextStyle(
            color: Colors.white,
          ),
        ),
      ),
    );
  }
}
