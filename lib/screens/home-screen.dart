import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart'; // ✅ REQUIRED
import 'package:kids_learning_app/screens/favorites_screen.dart';
import 'alphabet_screen.dart';
import 'video_screen.dart';
import '../screens/contact_us.dart';
import '../screens/about_Us.dart';
import '../screens/numbers_screen.dart';
import '../screens/colors_screen.dart';
import '../screens/shapes_screen.dart';
import '../screens/setting_screen.dart';
import '../screens/quiz_screen.dart';
import '../screens/game_screen.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return const KidsLearningHome();
  }
}

class KidsLearningHome extends StatefulWidget {
  const KidsLearningHome({super.key});

  @override
  State<KidsLearningHome> createState() => _KidsLearningHomeState();
}

class _KidsLearningHomeState extends State<KidsLearningHome> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.orangeAccent,
          title: Row(
            children: [
              Image.asset(
                'assets/animation/anime.json',
                height: 40,
              ), // 🟡 Make sure this exists
              const SizedBox(width: 10),
              const Text(
                'App Ijollee!',
                style: TextStyle(fontWeight: FontWeight.bold),
              ),
            ],
          ),
          actions: [
            IconButton(
              icon: const Icon(Icons.favorite, color: Colors.red),
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (_) => const FavoritesScreen()),
                );
              },
            ),
          ],
        ),
        drawer: Drawer(
          child: ListView(
            padding: EdgeInsets.zero,
            children: [
              DrawerHeader(
                decoration: const BoxDecoration(color: Colors.orangeAccent),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: const [
                    CircleAvatar(
                      backgroundColor: Colors.blue,
                      radius: 30,
                      child: Text("👧", style: TextStyle(fontSize: 30)),
                    ),
                    SizedBox(height: 10),
                    Text(
                      "Welcome!",
                      style: TextStyle(color: Colors.white, fontSize: 18),
                    ),
                  ],
                ),
              ),
              ListTile(
                leading: const Icon(Icons.info),
                title: const Text('About Us'),
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (_) => const AboutUsScreen()),
                  );
                },
              ),
              ListTile(
                leading: const Icon(Icons.phone),
                title: const Text('Contact Us'),
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (_) => const ContactUsScreen()),
                  );
                },
              ),
              ListTile(
                leading: const Icon(Icons.settings),
                title: const Text('Settings'),
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (_) => const SettingsScreen()),
                  );
                },
              ),
            ],
          ),
        ),
        body: Padding(
          padding: const EdgeInsets.all(16.0),
          child: GridView.count(
            crossAxisCount: 2,
            crossAxisSpacing: 16,
            mainAxisSpacing: 16,
            children: [
              _buildGridButton(
                'Qubee',
                Icons.text_fields,
                Colors.purple,
                AlphabetScreen(),
              ),
              _buildGridButton(
                'Faaruu',
                Icons.play_circle_fill,
                Colors.teal,
                VideoScreen(),
              ),
              _buildGridButton(
                'Lakkoofsa',
                Icons.looks_one,
                const Color.fromARGB(255, 84, 102, 199),
                NumbersScreen(),
              ),
              _buildGridButton(
                'Halluu',
                Icons.palette,
                const Color.fromARGB(255, 141, 62, 88),
                ColorsScreen(),
              ),
              _buildGridButton(
                'Boca',
                Icons.category,
                Colors.orange,
                ShapesScreen(),
              ),

              // ✅ Dynamically load quiz difficulty level from SharedPreferences
              FutureBuilder<SharedPreferences>(
                future: SharedPreferences.getInstance(),
                builder: (context, snapshot) {
                  if (!snapshot.hasData) {
                    return const Center(child: CircularProgressIndicator());
                  }

                  final prefs = snapshot.data!;
                  String nextLevel = 'Easy';

                  if ((prefs.getInt('Alphabet_Easy_score') ?? 0) >= 1) {
                    nextLevel = 'Medium';
                  }
                  if ((prefs.getInt('Alphabet_Medium_score') ?? 0) >= 1) {
                    nextLevel = 'Hard';
                  }

                  return _buildGridButton(
                    'Quiz',
                    Icons.quiz,
                    Colors.green,
                    QuizScreen(category: 'Alphabet', difficulty: nextLevel),
                  );
                },
              ),

              _buildGridButton(
                'Game',
                Icons.sports_esports,
                Colors.redAccent,
                const GameScreen(),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildGridButton(
    String title,
    IconData icon,
    Color color,
    Widget screen,
  ) {
    return GestureDetector(
      onTap: () {
        Navigator.push(context, MaterialPageRoute(builder: (_) => screen));
      },
      child: Container(
        decoration: BoxDecoration(
          color: color.withOpacity(0.8),
          borderRadius: BorderRadius.circular(20),
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(icon, size: 50, color: Colors.white),
            const SizedBox(height: 10),
            Text(
              title,
              style: const TextStyle(color: Colors.white, fontSize: 18),
            ),
          ],
        ),
      ),
    );
  }
}
