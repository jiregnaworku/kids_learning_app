import 'package:flutter/material.dart';

class ShapesScreen extends StatelessWidget {
  final List<Map<String, String>> shapes = [
    {'name': 'Geengoo', 'emoji': '⚪', 'desc': 'A round shape with no corners!'},
    {'name': 'Rog-arfee', 'emoji': '⬛', 'desc': 'A shape with 4 equal sides.'},
    {'name': 'Rog-sadee', 'emoji': '🔺', 'desc': 'A shape with 3 sides.'},
    {
      'name': 'Urjii',
      'emoji': '⭐',
      'desc': 'Shiny and pointy, just like in the sky!',
    },
    {'name': 'Onnee', 'emoji': '❤️', 'desc': 'A symbol of love and care.'},
    {
      'name': 'Reektanglii',
      'emoji': '▭',
      'desc': 'It has 4 sides, two long and two short!',
    },
    {'name': 'Ovaalii', 'emoji': '🟠', 'desc': 'A stretched-out circle.'},
    {'name': 'Diamond', 'emoji': '🔷', 'desc': 'It looks like a shiny gem!'},
    {
      'name': 'Pentaagoonii',
      'emoji': '🔰',
      'desc': 'A shape with 5 straight sides.',
    },
    {
      'name': 'Hekzagoon (Exagon)',
      'emoji': '⬡',
      'desc': 'This shape has 6 sides!',
    },
    {'name': 'Xiyya', 'emoji': '➡️', 'desc': 'Arrows point the way!'},
    {'name': 'Jia', 'emoji': '🌙', 'desc': 'The moon is a crescent shape.'},
  ];

  ShapesScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Bocawwan')),
      body: GridView.count(
        crossAxisCount: 2,
        padding: const EdgeInsets.all(16),
        crossAxisSpacing: 10,
        mainAxisSpacing: 10,
        children:
            shapes.map((shape) {
              return GestureDetector(
                onTap: () {
                  showDialog(
                    context: context,
                    builder:
                        (_) => AlertDialog(
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(20),
                          ),
                          title: Center(
                            child: Text(
                              shape['emoji']!,
                              style: const TextStyle(fontSize: 60),
                            ),
                          ),
                          content: Column(
                            mainAxisSize: MainAxisSize.min,
                            children: [
                              Text(
                                shape['name']!,
                                style: const TextStyle(
                                  fontSize: 24,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                              const SizedBox(height: 10),
                              Text(
                                shape['desc']!,
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
                  );
                },
                child: Container(
                  decoration: BoxDecoration(
                    color: Colors.deepPurpleAccent.withOpacity(0.2),
                    borderRadius: BorderRadius.circular(12),
                  ),
                  child: Center(
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          shape['emoji']!,
                          style: const TextStyle(fontSize: 40),
                        ),
                        const SizedBox(height: 10),
                        Text(
                          shape['name']!,
                          style: const TextStyle(fontSize: 18),
                        ),
                      ],
                    ),
                  ),
                ),
              );
            }).toList(),
      ),
    );
  }
}
