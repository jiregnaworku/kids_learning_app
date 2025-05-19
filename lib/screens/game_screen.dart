import 'dart:async';
import 'dart:math';
import 'package:flutter/material.dart';
import 'package:audioplayers/audioplayers.dart';

class GameScreen extends StatefulWidget {
  const GameScreen({super.key});

  @override
  State<GameScreen> createState() => _GameScreenState();
}

class _GameScreenState extends State<GameScreen> {
  final List<_Balloon> balloons = [];
  final Random random = Random();
  late Timer spawnTimer;
  late Timer gameTimer;
  final AudioPlayer audioPlayer = AudioPlayer();
  final List<String> balloonImages = [
    'assets/images/red.png',
    'assets/images/blue1.png',
  ];

  int score = 0;
  int level = 1;
  int remainingTime = 90; // 1 minute 30 seconds
  int balloonSpeedMultiplier = 1;
  Duration spawnRate = const Duration(milliseconds: 800);
  bool gameOver = false;

  @override
  void initState() {
    super.initState();
    _startGame();
  }

  void _startGame() {
    _startSpawning();
    gameTimer = Timer.periodic(const Duration(seconds: 1), (_) {
      if (mounted) {
        setState(() {
          remainingTime--;
          if (remainingTime <= 0) {
            _endGame();
          }
        });
      }
    });
  }

  void _startSpawning() {
    spawnTimer = Timer.periodic(spawnRate, (_) {
      if (!gameOver) {
        setState(() {
          balloons.add(
            _Balloon(
              key: UniqueKey(),
              xPos: random.nextDouble(),
              speed: (random.nextInt(2) + 1) * balloonSpeedMultiplier,
              size: random.nextDouble() * 50 + 80,
              imagePath: balloonImages[random.nextInt(balloonImages.length)],
              onPop: _popBalloon,
            ),
          );
        });
      }
    });
  }

  void _popBalloon(Key key) async {
    await audioPlayer.play(AssetSource('assets/audio/pop.mp3'));
    setState(() {
      balloons.removeWhere((b) => b.key == key);
      score += 1;

      // LEVEL UP every 10 points
      if (score % 10 == 0) {
        level++;
        balloonSpeedMultiplier++;

        // Reduce spawn rate (minimum 300ms)
        if (spawnRate.inMilliseconds > 300) {
          spawnRate = Duration(milliseconds: spawnRate.inMilliseconds - 100);
        }

        // Restart spawning
        spawnTimer.cancel();
        _startSpawning();
      }
    });
  }

  void _endGame() {
    gameOver = true;
    spawnTimer.cancel();
    gameTimer.cancel();

    showDialog(
      context: context,
      barrierDismissible: false,
      builder:
          (_) => AlertDialog(
            title: const Text("⏰ Time's Up!"),
            content: Text("🎯 Your score: $score\n🏆 Level reached: $level"),
            actions: [
              TextButton(
                onPressed: () {
                  Navigator.of(context).pop();
                  Navigator.of(context).pop();
                },
                child: const Text("OK"),
              ),
            ],
          ),
    );
  }

  @override
  void dispose() {
    spawnTimer.cancel();
    gameTimer.cancel();
    audioPlayer.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final minutes = (remainingTime ~/ 60).toString().padLeft(2, '0');
    final seconds = (remainingTime % 60).toString().padLeft(2, '0');

    return Scaffold(
      appBar: AppBar(title: const Text("🎈 Pop the Balloons")),
      body: Stack(
        children: [
          ...balloons,
          // Timer
          Positioned(
            top: 10,
            left: 20,
            child: _infoBox("⏳ $minutes:$seconds", Colors.blue),
          ),
          // Score
          Positioned(
            top: 10,
            right: 20,
            child: _infoBox("🎯 Score: $score", Colors.red),
          ),
          // Level
          Positioned(
            top: 70,
            left: 20,
            child: _infoBox("🏆 Level: $level", Colors.green),
          ),
        ],
      ),
    );
  }

  Widget _infoBox(String text, Color color) {
    return Container(
      padding: const EdgeInsets.all(8),
      decoration: BoxDecoration(
        color: Colors.white.withOpacity(0.9),
        borderRadius: BorderRadius.circular(12),
        border: Border.all(color: color, width: 2),
      ),
      child: Text(
        text,
        style: TextStyle(
          fontSize: 18,
          fontWeight: FontWeight.bold,
          color: color,
        ),
      ),
    );
  }
}

class _Balloon extends StatefulWidget {
  final double xPos;
  final int speed;
  final String imagePath;
  final Function(Key key) onPop;
  final double size;

  const _Balloon({
    required Key key,
    required this.xPos,
    required this.speed,
    required this.imagePath,
    required this.onPop,
    required this.size,
  }) : super(key: key);

  @override
  State<_Balloon> createState() => _BalloonState();
}

class _BalloonState extends State<_Balloon> {
  double _yPos = 1.0;
  late Timer _moveTimer;

  @override
  void initState() {
    super.initState();
    _moveTimer = Timer.periodic(const Duration(milliseconds: 50), (_) {
      setState(() {
        _yPos -= 0.01 * widget.speed;
        if (_yPos < -0.2) {
          _moveTimer.cancel();
          WidgetsBinding.instance.addPostFrameCallback((_) {
            if (mounted) {
              widget.onPop(widget.key!);
            }
          });
        }
      });
    });
  }

  @override
  void dispose() {
    _moveTimer.cancel();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Positioned(
      left: MediaQuery.of(context).size.width * widget.xPos,
      top: MediaQuery.of(context).size.height * _yPos,
      child: GestureDetector(
        onTap: () => widget.onPop(widget.key!),
        child: Image.asset(
          widget.imagePath,
          width: widget.size,
          height: widget.size,
        ),
      ),
    );
  }
}
