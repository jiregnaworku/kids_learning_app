import 'package:flutter/material.dart';
import 'package:kids_learning_app/utils/favorite_manager.dart';

class FavoritesScreen extends StatelessWidget {
  const FavoritesScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Favorite Songs & Videos"),
        backgroundColor: Colors.deepPurple,
      ),
      body: FutureBuilder<List<String>>(
        future: FavoriteManager.getFavorites(),
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return const Center(child: CircularProgressIndicator());
          }
          final favorites = snapshot.data!;
          if (favorites.isEmpty) {
            return const Center(child: Text('No Favorites Yet!'));
          }
          return ListView.builder(
            itemCount: favorites.length,
            itemBuilder: (context, index) {
              return ListTile(
                title: Text(favorites[index]),
                leading: const Icon(Icons.favorite, color: Colors.red),
                onTap: () {
                  // Add navigation to video player or music player
                },
              );
            },
          );
        },
      ),
    );
  }
}
