// lib/screens/video_screen.dart
import 'package:flutter/material.dart';
import 'package:kids_learning_app/screens/video_player_screen.dart';
import 'package:kids_learning_app/utils/favorite_manager.dart';

class VideoScreen extends StatelessWidget {
  final List<Map<String, String>> videos = [
    {"title": "Faaruu Qubee", "path": "assets/videos/Alphabet_compressed.mp4"},
    {
      "title": "Faaruu Lakkofsaa",
      "path": "assets/videos/Lakkoofsa_compressed.mp4",
    },
    {
      "title": "Faaruu Isportiif Lakkofsaa",
      "path": "assets/videos/Ispoortii_compressed.mp4",
    },
    {
      "title": "Faaruu Obboleessa koo",
      "path": "assets/videos/OBBOLEESSA_compressed.mp4",
    },
    {
      "title": "Faaruu Qubee fi Jechoota",
      "path": "assets/videos/Qubee_Jechoota_compressed.mp4",
    },
    {"title": "Faaruu Ijoollee", "path": "assets/videos/Sirba_compressed.mp4"},
  ];

  VideoScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("Kids Songs")),
      body: ListView.builder(
        itemCount: videos.length,
        itemBuilder: (context, index) {
          final video = videos[index];
          return ListTile(
            leading: const Icon(Icons.play_circle_fill),
            title: Text(video['title']!),
            trailing: FutureBuilder<List<String>>(
              future: FavoriteManager.getFavorites(),
              builder: (context, snapshot) {
                if (snapshot.connectionState == ConnectionState.waiting) {
                  return const CircularProgressIndicator();
                }
                final favorites = snapshot.data!;
                final isFavorite = favorites.contains(video['title']);
                return IconButton(
                  icon: Icon(
                    isFavorite ? Icons.favorite : Icons.favorite_border,
                    color: isFavorite ? Colors.red : Colors.grey,
                  ),
                  onPressed: () async {
                    await FavoriteManager.toggleFavorite(video['title']!);
                    (context as Element).rebuild();
                  },
                );
              },
            ),
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder:
                      (_) => VideoPlayerScreen(
                        videoPath: video['path']!,
                        allVideos: videos,
                        currentIndex: index,
                      ),
                ),
              );
            },
          );
        },
      ),
    );
  }
}
