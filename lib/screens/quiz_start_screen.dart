import 'package:flutter/material.dart';
import '../screens/quiz_screen.dart';

class QuizStartScreen extends StatefulWidget {
  const QuizStartScreen({super.key});

  @override
  State<QuizStartScreen> createState() => _QuizStartScreenState();
}

class _QuizStartScreenState extends State<QuizStartScreen> {
  String selectedCategory = 'Alphabet';
  String selectedDifficulty = 'Easy';

  final List<String> categories = ['Alphabet', 'Math', 'Animals'];
  final List<String> difficulties = ['Easy', 'Medium', 'Hard'];

  void startQuiz() {
    Navigator.push(
      context,
      MaterialPageRoute(
        builder:
            (context) => QuizScreen(
              category: selectedCategory,
              difficulty: selectedDifficulty,
            ),
      ),
    );
  }

  Widget buildDropdown(
    String label,
    List<String> items,
    String selected,
    Function(String) onChanged,
  ) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(label, style: const TextStyle(fontWeight: FontWeight.bold)),
        DropdownButton<String>(
          value: selected,
          items:
              items
                  .map(
                    (e) => DropdownMenuItem<String>(value: e, child: Text(e)),
                  )
                  .toList(),
          onChanged: (val) => onChanged(val!),
        ),
      ],
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Start Quiz')),
      body: Padding(
        padding: const EdgeInsets.all(24.0),
        child: Column(
          children: [
            buildDropdown(
              'Select Category',
              categories,
              selectedCategory,
              (val) => setState(() => selectedCategory = val),
            ),
            buildDropdown(
              'Select Difficulty',
              difficulties,
              selectedDifficulty,
              (val) => setState(() => selectedDifficulty = val),
            ),
            const SizedBox(height: 20),
            ElevatedButton.icon(
              onPressed: startQuiz,
              icon: const Icon(Icons.play_arrow),
              label: const Text('Start Quiz'),
            ),
          ],
        ),
      ),
    );
  }
}
