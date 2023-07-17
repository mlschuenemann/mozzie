import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class StreakProvider with ChangeNotifier {
  SharedPreferences? _prefs;
  List<DateTime> _activityDates = [];

  int get currentStreak {
    return calculateStreak();
  }

  Future<void> init() async {
    _prefs = await SharedPreferences.getInstance();
    _loadActivityDates();
  }

  void _loadActivityDates() {
    final List<String>? dateStringList = _prefs?.getStringList('activity_dates');
    if (dateStringList != null) {
      _activityDates = dateStringList.map((dateString) => DateTime.parse(dateString)).toList();
    }
  }

  void _saveActivityDates() {
    final dateStringList = _activityDates.map((date) => date.toIso8601String()).toList();
    _prefs?.setStringList('activity_dates', dateStringList);
  }

  void addActivity(DateTime date) {
    if (!_activityDates.contains(date)) {
      _activityDates.add(date);
      _activityDates.sort();
      _saveActivityDates();
      notifyListeners();
    }
  }

  int calculateStreak() {
    if (_activityDates.isEmpty) {
      return 0;
    }

    int streak = 1;
    for (int i = _activityDates.length - 1; i > 0; i--) {
      if (_activityDates[i].difference(_activityDates[i - 1]).inDays == 1) {
        streak++;
      } else {
        break;
      }
    }
    return streak;
  }
}
