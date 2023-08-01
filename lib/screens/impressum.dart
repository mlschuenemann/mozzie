import 'package:flutter/material.dart';
import 'package:music_education/constants/colors.dart';

class ImpressumPage extends StatelessWidget {
  const ImpressumPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Impressum'),
        elevation: 0.0,
        backgroundColor: BACKGROUND,// Remove the shadow from AppBar
      ),
      backgroundColor: BACKGROUND,
      body: const SingleChildScrollView(
        padding: EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Text(
              'Mozzie',
              style: TextStyle(
                color: Colors.white,
                fontSize: 24,
                fontWeight: FontWeight.bold,
              ),
            ),
            SizedBox(height: 16),
            Text(
              'Adresse: xxx',
              style: TextStyle(
                color: Colors.white,
                fontSize: 16,
                fontWeight: FontWeight.w300, // Thinner font-weight
              ),
            ),
            SizedBox(height: 8),
            Text(
              'E-Mail: ml.schuene@t-online.de',
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
              'Verantwortlicher: Martin Schünemann',
              style: TextStyle(
                color: Colors.white,
                fontSize: 16,
                fontWeight: FontWeight.w300, // Thinner font-weight
              ),
            ),
            SizedBox(height: 16),
            Text(
              'Haftungsausschluss:',
              style: TextStyle(
                color: Colors.white,
                fontSize: 18,
                fontWeight: FontWeight.bold,
              ),
            ),
            SizedBox(height: 8),
            Text(
              'Die Informationen auf dieser App/Website dienen nur allgemeinen Informationszwecken. Wir bemühen uns, die Informationen aktuell und korrekt zu halten, übernehmen jedoch keine Gewähr für die Vollständigkeit, Richtigkeit, Zuverlässigkeit, Eignung oder Verfügbarkeit hinsichtlich der App/Website oder der enthaltenen Informationen, Produkte, Dienstleistungen oder Grafiken für einen bestimmten Zweck. Jegliches Vertrauen, das Sie in solche Informationen setzen, geschieht daher auf eigenes Risiko.',
              style: TextStyle(
                color: Colors.white,
                fontSize: 16,
                fontWeight: FontWeight.w300, // Thinner font-weight
              ),
            ),
            SizedBox(height: 16),
            Text(
              'Datenschutzrichtlinie:',
              style: TextStyle(
                color: Colors.white,
                fontSize: 18,
                fontWeight: FontWeight.bold,
              ),
            ),
            SizedBox(height: 8),
            Text(
              'Ihre Privatsphäre ist uns wichtig. Bitte lesen Sie unsere Datenschutzrichtlinie, um zu erfahren, wie wir Ihre persönlichen Daten erfassen, verwenden und schützen.',
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
        padding: const EdgeInsets.only(left: 16, right: 16, top: 16 ,bottom: 40),
        color: Colors.grey[800],
        child: Text(
          '© ${DateTime.now().year} Martin Schünemann. Alle Rechte vorbehalten.',
          textAlign: TextAlign.center,
          style: const TextStyle(
            color: Colors.white,
          ),
        ),
      ),
    );
  }
}
