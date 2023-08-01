import 'package:flutter/material.dart';
import 'package:flutter/foundation.dart';
import 'package:shared_preferences/shared_preferences.dart';

class ProgressPointProvider with ChangeNotifier {

  //ProgressPoint Number
  int _progressPointNumber = 1;
  int get progressPointNumber => _progressPointNumber;

  void incrementAndStoreProgressPointNumber(String keyOfPoint) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    int? currentProgressPoint = prefs.getInt('${keyOfPoint}Point');

    // Increment the lecture number by 1
    int updatedProgressPoint = (currentProgressPoint ?? 1) + 1;

    // Store the updated lecture number using SharedPreferences
    await prefs.setInt('${keyOfPoint}Point', updatedProgressPoint);
    _progressPointNumber = updatedProgressPoint;
    notifyListeners();
  }

  Future<void> retrieveProgressPointNumber(String keyOfPoint) async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    _progressPointNumber = prefs.getInt('${keyOfPoint}Point') ?? 1;
    notifyListeners();
  }

  Future<void> resetProgressPointNumber(int resetValue, String keyOfPoint) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();

    int reset = resetValue;

    await prefs.setInt('${keyOfPoint}Point', reset);
    _progressPointNumber = reset;
    notifyListeners();
  }


}