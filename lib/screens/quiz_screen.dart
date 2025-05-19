import 'dart:async';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:audioplayers/audioplayers.dart';
import '../data/question_data.dart';

class QuizScreen extends StatefulWidget {
  final String category;
  final String difficulty;

  const QuizScreen({
    super.key,
    required this.category,
    required this.difficulty,
  });

  @override
  State<QuizScreen> createState() => _QuizScreenState();
}

class _QuizScreenState extends State<QuizScreen> {
  List<Map<String, dynamic>> questions = [];
  int currentQuestion = 0;
  int score = 0;
  bool showResult = false;
  List<String> shuffledOptions = [];
  Timer? questionTimer;
  int timeLeft = 15;
  final AudioPlayer audioPlayer = AudioPlayer();

  @override
  void initState() {
    super.initState();

    questions = List<Map<String, dynamic>>.from(
      questionsData[widget.category]?[widget.difficulty] ?? [],
    );

    questions.shuffle();

    if (questions.isEmpty) {
      Future.delayed(Duration.zero, () {
        ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(
            content: Text('No questions found for this selection.'),
          ),
        );
        Navigator.pop(context);
      });
    } else {
      _startQuestion();
    }
  }

  void _startQuestion() {
    shuffledOptions = List<String>.from(questions[currentQuestion]['options']);
    shuffledOptions.shuffle();
    timeLeft = 15;
    questionTimer?.cancel();
    questionTimer = Timer.periodic(const Duration(seconds: 1), (timer) {
      if (timeLeft == 0) {
        timer.cancel();
        _nextQuestion();
      } else {
        setState(() => timeLeft--);
      }
    });
  }

  void _nextQuestion() {
    if (currentQuestion < questions.length - 1) {
      setState(() => currentQuestion++);
      _startQuestion();
    } else {
      questionTimer?.cancel();
      _saveScore();
      _markLevelCompleted(); // Save level as completed
      setState(() => showResult = true);
    }
  }

  Future<void> _markLevelCompleted() async {
    final prefs = await SharedPreferences.getInstance();
    final key = '${widget.category}_${widget.difficulty}_completed';
    await prefs.setBool(key, true);
  }

  Future<void> _saveScore() async {
    final prefs = await SharedPreferences.getInstance();
    prefs.setInt('last_score', score);
  }

  void _checkAnswer(String selected) async {
    final correct = questions[currentQuestion]['answer'];
    if (selected == correct) {
      score++;
      await audioPlayer.play(AssetSource('audio/correct.mp3'));
    } else {
      await audioPlayer.play(AssetSource('audio/wrong.mp3'));
    }
    _nextQuestion();
  }

  void _resetQuiz() {
    setState(() {
      currentQuestion = 0;
      score = 0;
      showResult = false;
      questions.shuffle();
    });
    _startQuestion();
  }

  @override
  void dispose() {
    questionTimer?.cancel();
    audioPlayer.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Quiz - ${widget.category} (${widget.difficulty})'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child:
            showResult
                ? Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      '🎉 Your Score: $score/${questions.length}',
                      style: const TextStyle(
                        fontSize: 26,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    const SizedBox(height: 20),
                    ElevatedButton(
                      onPressed: _resetQuiz,
                      child: const Text('Retry'),
                    ),
                    ElevatedButton(
                      onPressed: () => Navigator.pop(context),
                      child: const Text('Back'),
                    ),
                  ],
                )
                : Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      '⏰ Time Left: $timeLeft sec',
                      style: const TextStyle(fontSize: 18),
                    ),
                    const SizedBox(height: 10),
                    Text(
                      'Q${currentQuestion + 1}: ${questions[currentQuestion]['question']}',
                      style: const TextStyle(
                        fontSize: 22,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    const SizedBox(height: 20),
                    ...shuffledOptions.map(
                      (option) => Padding(
                        padding: const EdgeInsets.symmetric(vertical: 8.0),
                        child: ElevatedButton(
                          onPressed: () => _checkAnswer(option),
                          child: Text(
                            option,
                            style: const TextStyle(fontSize: 18),
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
      ),
    );
  }
}
