import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import '../utils/music_player.dart'; // Adjust path if needed

class SettingsScreen extends StatefulWidget {
  const SettingsScreen({super.key});

  @override
  State<SettingsScreen> createState() => _SettingsScreenState();
}

class _SettingsScreenState extends State<SettingsScreen> {
  bool isPlaying = MusicPlayer.isMusicPlaying();
  bool isMuted = MusicPlayer.isMusicMuted();
  int selectedTrackIndex = MusicPlayer.musicTracks.indexOf(
    MusicPlayer.getCurrentTrack(),
  );

  bool isDarkMode = false;
  bool isNightMode = false;
  bool isLocked = false;

  @override
  void initState() {
    super.initState();
    _loadPrefs();
  }

  Future<void> _loadPrefs() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    setState(() {
      isDarkMode = prefs.getBool('darkMode') ?? false;
      isNightMode = prefs.getBool('nightMode') ?? false;
      isLocked = prefs.getBool('isLocked') ?? false;
    });
  }

  Future<void> _toggleColorMode(String mode) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    if (mode == 'dark') {
      await prefs.setBool('darkMode', true);
      await prefs.setBool('nightMode', false);
    } else if (mode == 'night') {
      await prefs.setBool('darkMode', false);
      await prefs.setBool('nightMode', true);
    } else {
      await prefs.setBool('darkMode', false);
      await prefs.setBool('nightMode', false);
    }
    setState(() {
      isDarkMode = prefs.getBool('darkMode') ?? false;
      isNightMode = prefs.getBool('nightMode') ?? false;
    });
  }

  Future<void> _setParentPassword() async {
    final controller = TextEditingController();
    final SharedPreferences prefs = await SharedPreferences.getInstance();

    showDialog(
      context: context,
      builder:
          (_) => AlertDialog(
            title: const Text("Set Parent Password"),
            content: TextField(
              controller: controller,
              obscureText: true,
              decoration: const InputDecoration(hintText: "Enter new password"),
            ),
            actions: [
              TextButton(
                onPressed: () => Navigator.pop(context),
                child: const Text("Cancel"),
              ),
              ElevatedButton(
                onPressed: () {
                  prefs.setString('parentPassword', controller.text);
                  prefs.setBool('isLocked', true);
                  setState(() => isLocked = true);
                  Navigator.pop(context);
                },
                child: const Text("Save"),
              ),
            ],
          ),
    );
  }

  Future<void> _unlockWithPassword() async {
    final controller = TextEditingController();
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    String savedPassword = prefs.getString('parentPassword') ?? '';

    showDialog(
      context: context,
      builder:
          (_) => AlertDialog(
            title: const Text("Enter Parent Password"),
            content: TextField(
              controller: controller,
              obscureText: true,
              decoration: const InputDecoration(hintText: "Password"),
            ),
            actions: [
              TextButton(
                onPressed: () => Navigator.pop(context),
                child: const Text("Cancel"),
              ),
              ElevatedButton(
                onPressed: () {
                  if (controller.text == savedPassword) {
                    prefs.setBool('isLocked', false);
                    setState(() => isLocked = false);
                    Navigator.pop(context);
                  } else {
                    ScaffoldMessenger.of(context).showSnackBar(
                      const SnackBar(content: Text('Incorrect password')),
                    );
                  }
                },
                child: const Text("Unlock"),
              ),
            ],
          ),
    );
  }

  ThemeData _getTheme() {
    if (isNightMode) {
      return ThemeData.dark().copyWith(
        scaffoldBackgroundColor: Colors.black,
        appBarTheme: const AppBarTheme(backgroundColor: Colors.deepPurple),
        textTheme: const TextTheme(
          bodyLarge: TextStyle(color: Colors.white),
          bodyMedium: TextStyle(color: Colors.white70),
        ),
        switchTheme: SwitchThemeData(
          thumbColor: WidgetStateProperty.all(Colors.deepPurple),
          trackColor: WidgetStateProperty.all(Colors.deepPurple.shade200),
        ),
      );
    } else if (isDarkMode) {
      return ThemeData.dark().copyWith(
        scaffoldBackgroundColor: const Color(0xFF121212),
        appBarTheme: const AppBarTheme(backgroundColor: Colors.teal),
        textTheme: const TextTheme(
          bodyLarge: TextStyle(color: Colors.white),
          bodyMedium: TextStyle(color: Colors.white60),
        ),
        switchTheme: SwitchThemeData(
          thumbColor: WidgetStateProperty.all(Colors.teal),
          trackColor: WidgetStateProperty.all(Colors.tealAccent),
        ),
      );
    } else {
      return ThemeData.light().copyWith(
        scaffoldBackgroundColor: Colors.white,
        appBarTheme: const AppBarTheme(backgroundColor: Colors.pinkAccent),
        textTheme: const TextTheme(
          bodyLarge: TextStyle(color: Colors.black),
          bodyMedium: TextStyle(color: Colors.black87),
        ),
        switchTheme: SwitchThemeData(
          thumbColor: WidgetStateProperty.all(Colors.pink),
          trackColor: WidgetStateProperty.all(Colors.pink.shade100),
        ),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: _getTheme(),
      home: Scaffold(
        appBar: AppBar(title: const Text('Settings')),
        body: Padding(
          padding: const EdgeInsets.all(20.0),
          child: ListView(
            children: [
              ListTile(
                leading: const Icon(Icons.lock),
                title: Text(isLocked ? 'Unlock App' : 'Set Parent Lock'),
                onTap: isLocked ? _unlockWithPassword : _setParentPassword,
              ),

              const Divider(height: 30),
              const Text(
                '🎵 Background Music',
                style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold),
              ),

              SwitchListTile(
                title: Text(isPlaying ? 'Pause Music' : 'Play Music'),
                value: isPlaying,
                onChanged: (value) async {
                  value
                      ? await MusicPlayer.playBackgroundMusic()
                      : await MusicPlayer.pauseMusic();
                  setState(() => isPlaying = value);
                },
              ),
              SwitchListTile(
                title: Text(isMuted ? 'Unmute Music' : 'Mute Music'),
                value: isMuted,
                onChanged: (value) async {
                  value
                      ? await MusicPlayer.muteMusic()
                      : await MusicPlayer.unmuteMusic();
                  setState(() => isMuted = value);
                },
              ),

              const SizedBox(height: 10),
              const Text('Choose Music Track:', style: TextStyle(fontSize: 16)),
              ...List.generate(MusicPlayer.musicTracks.length, (index) {
                return RadioListTile(
                  title: Text('Track ${index + 1}'),
                  value: index,
                  groupValue: selectedTrackIndex,
                  onChanged: (value) async {
                    setState(() => selectedTrackIndex = value!);
                    await MusicPlayer.changeTrack(value!);
                  },
                );
              }),

              const Divider(height: 30),
              const Text(
                '🎨 Background Color Mode',
                style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold),
              ),
              RadioListTile(
                title: const Text('Light Mode'),
                value: 'light',
                groupValue:
                    isDarkMode
                        ? 'dark'
                        : isNightMode
                        ? 'night'
                        : 'light',
                onChanged: (val) => _toggleColorMode('light'),
              ),
              RadioListTile(
                title: const Text('Dark Mode'),
                value: 'dark',
                groupValue:
                    isDarkMode
                        ? 'dark'
                        : isNightMode
                        ? 'night'
                        : 'light',
                onChanged: (val) => _toggleColorMode('dark'),
              ),
              RadioListTile(
                title: const Text('Night Mode'),
                value: 'night',
                groupValue:
                    isDarkMode
                        ? 'dark'
                        : isNightMode
                        ? 'night'
                        : 'light',
                onChanged: (val) => _toggleColorMode('night'),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
