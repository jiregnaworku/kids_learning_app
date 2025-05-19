import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'screens/welcome_screen.dart';
import './providers/theme_provider.dart';
import 'screens/quiz_screen.dart'; // ✅ Add this
import 'screens/game_screen.dart'; // ✅ Add this

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  final themeProvider = ThemeProvider();
  await themeProvider.loadTheme();

  runApp(
    ChangeNotifierProvider(
      create: (_) => themeProvider,
      child: const KidsLearningApp(),
    ),
  );
}

class KidsLearningApp extends StatelessWidget {
  const KidsLearningApp({super.key});

  // Define custom themes for Light, Dark, and Night
  ThemeData get lightTheme => ThemeData(
    primarySwatch: Colors.purple,
    scaffoldBackgroundColor: Colors.white,
    appBarTheme: const AppBarTheme(color: Colors.purple),
    textTheme: const TextTheme(
      bodyLarge: TextStyle(fontSize: 18, color: Colors.black),
    ),
  );

  ThemeData get darkTheme => ThemeData.dark().copyWith(
    scaffoldBackgroundColor: const Color(0xFF121212),
    appBarTheme: const AppBarTheme(color: Colors.teal),
    textTheme: const TextTheme(
      bodyLarge: TextStyle(fontSize: 18, color: Colors.white),
    ),
  );

  ThemeData get nightTheme => ThemeData.dark().copyWith(
    scaffoldBackgroundColor: Colors.black,
    appBarTheme: const AppBarTheme(color: Colors.deepPurple),
    textTheme: const TextTheme(
      bodyLarge: TextStyle(fontSize: 18, color: Colors.white),
    ),
  );

  @override
  Widget build(BuildContext context) {
    final themeMode = Provider.of<ThemeProvider>(context).themeMode;

    return MaterialApp(
      title: 'Ijoollummaakoo',
      debugShowCheckedModeBanner: false,
      theme: lightTheme,
      darkTheme: darkTheme,
      themeMode: themeMode == ThemeMode.system ? ThemeMode.dark : themeMode,
      home: const WelcomeScreen(),
      routes: {
        '/quiz':
            (context) =>
                const QuizScreen(category: 'Alphabet', difficulty: 'Easy'),
        '/game': (context) => const GameScreen(),
      },
    );
  }
}
