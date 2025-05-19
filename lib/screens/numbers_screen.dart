import 'package:flutter/material.dart';

class NumbersScreen extends StatelessWidget {
  final List<Map<String, String>> numbers = [
    {
      "emoji": "0️⃣",
      "word": "Duwwaa  Zero",
      "desc": "Zero means nothing at all!",
    },
    {
      "emoji": "1️⃣",
      "word": "Tokko   One",
      "desc": "Tokkeen tokkichuma,     One sun shines in the sky.",
    },
    {
      "emoji": "2️⃣",
      "word": "Lama    Two",
      "desc": "Laman mucha re'ee,      Two eyes help us see!",
    },
    {
      "emoji": "3️⃣",
      "word": "Sadii   Three",
      "desc": "Sadan sunsummani,     Three little kittens play.",
    },
    {
      "emoji": "4️⃣",
      "word": "Afur    Four",
      "desc": "Arfan mucha saawwaa,   Four wheels on a car!",
    },
    {
      "emoji": "5️⃣",
      "word": "Shan    Five",
      "desc": "Shanan quba harkaa,    Five fingers on your hand.",
    },
    {
      "emoji": "6️⃣",
      "word": "Ja'a    Six",
      "desc": "Ja'an jabbii qaraxaa,   Six legs on some bugs.",
    },
    {
      "emoji": "7️⃣",
      "word": "Torba   Seven",
      "desc": "Torban torbee sambataa,   Seven colors in the rainbow.",
    },
    {
      "emoji": "8️⃣",
      "word": "Saddeet   Eight",
      "desc": "Saddeettan dhala leencaa,    Eight legs on a spider!",
    },
    {
      "emoji": "9️⃣",
      "word": "Sagal   Nine",
      "desc": "Sagal dhala dullachaa,     Nine stars in the sky.",
    },
  ];

  NumbersScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Lakkoofsa')),
      body: GridView.builder(
        padding: const EdgeInsets.all(16),
        gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 3,
          crossAxisSpacing: 10,
          mainAxisSpacing: 10,
        ),
        itemCount: numbers.length,
        itemBuilder: (context, index) {
          final item = numbers[index];
          return GestureDetector(
            onTap:
                () => showDialog(
                  context: context,
                  builder:
                      (_) => AlertDialog(
                        contentPadding: const EdgeInsets.all(20),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(20),
                        ),
                        title: Center(
                          child: Text(
                            item['emoji']!,
                            style: const TextStyle(fontSize: 60),
                          ),
                        ),
                        content: Column(
                          mainAxisSize: MainAxisSize.min,
                          children: [
                            Text(
                              item['word']!,
                              style: const TextStyle(
                                fontSize: 24,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                            const SizedBox(height: 10),
                            Text(
                              item['desc']!,
                              textAlign: TextAlign.center,
                              style: const TextStyle(fontSize: 16),
                            ),
                          ],
                        ),
                        actions: [
                          TextButton(
                            onPressed: () => Navigator.pop(context),
                            child: const Text("OK"),
                          ),
                        ],
                      ),
                ),
            child: Container(
              decoration: BoxDecoration(
                color: Colors.lightBlueAccent.withOpacity(0.7),
                borderRadius: BorderRadius.circular(12),
              ),
              child: Center(
                child: Text(
                  item['emoji']!,
                  style: const TextStyle(fontSize: 40),
                ),
              ),
            ),
          );
        },
      ),
    );
  }
}
