import 'package:flutter/material.dart';
import 'package:music_education/constants/colors.dart';
import 'package:music_education/constants/textstyle.dart';

class PrivacyPage extends StatelessWidget {
  const PrivacyPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Datenschutz'),
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
              'Datenschutzerklärung',
              style: TextStyle(
                color: Colors.white,
                fontSize: 24,
                fontWeight: FontWeight.bold,
              ),
            ),
            SizedBox(height: 16),
            Text(
              'Ihre Datenschutz ist uns wichtig. Diese Datenschutzerklärung erläutert, wie wir personenbezogene Daten erfassen, verwenden und offenlegen, wenn Sie unsere App/Website besuchen oder nutzen. Bitte lesen Sie diese Datenschutzerklärung sorgfältig durch. Durch die Nutzung unserer App/Website stimmen Sie den in dieser Datenschutzerklärung beschriebenen Praktiken zu.',
              style: TextStyle(
                color: Colors.white,
                fontSize: 16,
                fontWeight: FontWeight.w300, // Thinner font-weight
              ),
            ),
            SizedBox(height: 16),
            Text(
              'Erfassung und Nutzung von Informationen:',
              style: TextStyle(
                color: Colors.white,
                fontSize: 18,
                fontWeight: FontWeight.bold,
              ),
            ),
            SizedBox(height: 8),
            Text(
              'Wir erfassen keine personenbezogenen Daten, es sei denn, Sie stellen sie uns freiwillig zur Verfügung. Wenn Sie unsere App/Website nutzen, können bestimmte Informationen automatisch erfasst werden, einschließlich Ihrer IP-Adresse, Ihres Gerätetyps, Ihres Browsers und Ihrer Aktivitäten in der App/Website. Diese Informationen werden anonymisiert und aggregiert ausgewertet, um unsere Dienste zu verbessern und die Benutzererfahrung zu optimieren.',
              style: TextStyle(
                color: Colors.white,
                fontSize: 16,
                fontWeight: FontWeight.w300, // Thinner font-weight
              ),
            ),
            SizedBox(height: 16),
            Text(
              'Cookies und ähnliche Technologien:',
              style: TextStyle(
                color: Colors.white,
                fontSize: 18,
                fontWeight: FontWeight.bold,
              ),
            ),
            SizedBox(height: 8),
            Text(
              'Unsere App/Website verwendet keine Cookies oder ähnliche Technologien, um Informationen über Ihre Nutzung der App/Website zu sammeln.',
              style: TextStyle(
                color: Colors.white,
                fontSize: 16,
                fontWeight: FontWeight.w300, // Thinner font-weight
              ),
            ),
            SizedBox(height: 16),
            Text(
              'Offenlegung von Informationen:',
              style: TextStyle(
                color: Colors.white,
                fontSize: 18,
                fontWeight: FontWeight.bold,
              ),
            ),
            SizedBox(height: 8),
            Text(
              'Wir teilen Ihre personenbezogenen Daten nicht mit Dritten, es sei denn, dies ist gesetzlich vorgeschrieben oder zur Bereitstellung unserer Dienste erforderlich. Wir werden Ihre personenbezogenen Daten nicht verkaufen, vermieten oder anderweitig an Dritte weitergeben.',
              style: TextStyle(
                color: Colors.white,
                fontSize: 16,
                fontWeight: FontWeight.w300, // Thinner font-weight
              ),
            ),
            SizedBox(height: 16),
            Text(
              'Sicherheit:',
              style: TextStyle(
                color: Colors.white,
                fontSize: 18,
                fontWeight: FontWeight.bold,
              ),
            ),
            SizedBox(height: 8),
            Text(
              'Wir setzen angemessene technische und organisatorische Sicherheitsmaßnahmen ein, um Ihre personenbezogenen Daten vor unbefugtem Zugriff und Missbrauch zu schützen.',
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
        padding: EdgeInsets.only(left: 16, right: 16, top: 16 ,bottom: 40),
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
