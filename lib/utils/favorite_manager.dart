import 'package:shared_preferences/shared_preferences.dart';

class FavoriteManager {
  static const String _favoriteKey =
      'favoriteSongs'; // Key for storing favorite songs

  // Add or remove a song from favorites
  static Future<void> toggleFavorite(String trackName) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    List<String> favorites = prefs.getStringList(_favoriteKey) ?? [];

    if (favorites.contains(trackName)) {
      favorites.remove(trackName); // Remove from favorites
    } else {
      favorites.add(trackName); // Add to favorites
    }

    await prefs.setStringList(_favoriteKey, favorites); // Save the updated list
  }

  // Get all the favorite songs
  static Future<List<String>> getFavorites() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    return prefs.getStringList(_favoriteKey) ?? [];
  }
}
