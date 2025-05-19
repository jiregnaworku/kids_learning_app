import 'package:shared_preferences/shared_preferences.dart';

class StorageHelper {
  static const String _scoreKey = 'high_score';

  static Future<int> getHighScore() async {
    final prefs = await SharedPreferences.getInstance();
    return prefs.getInt(_scoreKey) ?? 0;
  }

  static Future<void> saveHighScore(int score) async {
    final prefs = await SharedPreferences.getInstance();
    final current = prefs.getInt(_scoreKey) ?? 0;
    if (score > current) {
      await prefs.setInt(_scoreKey, score);
    }
  }

  static Future<void> resetHighScore() async {
    final prefs = await SharedPreferences.getInstance();
    await prefs.remove(_scoreKey);
  }
}
