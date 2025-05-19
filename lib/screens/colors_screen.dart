import 'package:flutter/material.dart';

class ColorsScreen extends StatelessWidget {
  final Map<String, Color> colorMap = {
    'Red. Diimaa': Colors.red,
    'Blue, Cuqulisa': Colors.blue,
    'Green, Magarisa': Colors.green,
    'Yellow, Keelloo': Colors.yellow,
    'Orange, burtukaana': Colors.orange,
    'Purple, diimaa-cuquliisa ': Colors.purple,
    'Pink, Halluu diimaatti dhiyaatu ': Colors.pink,
    'Brown, diimaa duukkanaa ': Colors.brown,
    'Black, Gurraacha': Colors.black,
    'White, Adii ': Colors.white,
  };

  ColorsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Halluwwan')),
      body: GridView.count(
        crossAxisCount: 2,
        padding: EdgeInsets.all(16),
        children:
            colorMap.entries.map((entry) {
              return Card(
                color: entry.value,
                child: Center(
                  child: Text(
                    entry.key,
                    style: TextStyle(fontSize: 24, color: Colors.white),
                  ),
                ),
              );
            }).toList(),
      ),
    );
  }
}
