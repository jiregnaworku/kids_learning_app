import 'package:audioplayers/audioplayers.dart';

class MusicPlayer {
  static final AudioPlayer _audioPlayer = AudioPlayer();
  static bool _isMusicPlaying = false;
  static bool _isMuted = false;
  static String _currentTrack = 'audio/music.mp3'; // Default music

  static List<String> musicTracks = [
    'audio/music.mp3',
    'audio/music1.mp3',
    'audio/music2.mp3',
  ];

  static Future<void> playBackgroundMusic() async {
    try {
      await _audioPlayer.stop(); // stop any previous
      await _audioPlayer.setSource(AssetSource(_currentTrack));
      await _audioPlayer.setReleaseMode(ReleaseMode.loop); // Loop forever
      await _audioPlayer.resume();
      _isMusicPlaying = true;
    } catch (e) {
      print('Error playing music: $e');
    }
  }

  static Future<void> pauseMusic() async {
    await _audioPlayer.pause();
    _isMusicPlaying = false;
  }

  static Future<void> resumeMusic() async {
    await _audioPlayer.resume();
    _isMusicPlaying = true;
  }

  static Future<void> stopMusic() async {
    await _audioPlayer.stop();
    _isMusicPlaying = false;
  }

  static Future<void> muteMusic() async {
    await _audioPlayer.setVolume(0.0);
    _isMuted = true;
  }

  static Future<void> unmuteMusic() async {
    await _audioPlayer.setVolume(1.0);
    _isMuted = false;
  }

  static Future<void> changeTrack(int index) async {
    if (index >= 0 && index < musicTracks.length) {
      _currentTrack = musicTracks[index];
      await _audioPlayer.stop();
      await _audioPlayer.setSource(AssetSource(_currentTrack));
      await _audioPlayer.resume();
      _isMusicPlaying = true;
    }
  }

  static bool isMusicPlaying() {
    return _isMusicPlaying;
  }

  static bool isMusicMuted() {
    return _isMuted;
  }

  static String getCurrentTrack() {
    return _currentTrack;
  }

  static void changeMusic(String s) {}
}
