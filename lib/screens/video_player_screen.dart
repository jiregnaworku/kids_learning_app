import 'package:flutter/material.dart';
import 'package:video_player/video_player.dart';
import 'package:dio/dio.dart';
import 'package:path_provider/path_provider.dart';
import 'package:permission_handler/permission_handler.dart';

class VideoPlayerScreen extends StatefulWidget {
  final String videoPath;
  final List<Map<String, String>> allVideos;
  final int currentIndex;

  const VideoPlayerScreen({
    super.key,
    required this.videoPath,
    required this.allVideos,
    required this.currentIndex,
  });

  @override
  State<VideoPlayerScreen> createState() => _VideoPlayerScreenState();
}

class _VideoPlayerScreenState extends State<VideoPlayerScreen> {
  late int currentIndex;
  VideoPlayerController? _videoController;
  bool isFullscreen = false;

  @override
  void initState() {
    super.initState();
    currentIndex = widget.currentIndex;
    _initializePlayer(widget.videoPath);
  }

  void _initializePlayer(String path) {
    _videoController?.dispose();
    _videoController = VideoPlayerController.asset(path)
      ..initialize().then((_) {
        setState(() {});
        _videoController!.play();
      });
  }

  @override
  void dispose() {
    _videoController?.dispose();
    super.dispose();
  }

  void _playNextVideo() {
    final nextIndex = (currentIndex + 1) % widget.allVideos.length;
    setState(() {
      currentIndex = nextIndex;
      _initializePlayer(widget.allVideos[nextIndex]['path']!);
    });
  }

  void _toggleFullscreen() {
    setState(() {
      isFullscreen = !isFullscreen;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: isFullscreen ? null : AppBar(title: const Text("Video Player")),
      body:
          _videoController != null && _videoController!.value.isInitialized
              ? Column(
                children: [
                  AspectRatio(
                    aspectRatio: _videoController!.value.aspectRatio,
                    child: VideoPlayer(_videoController!),
                  ),
                  VideoProgressIndicator(
                    _videoController!,
                    allowScrubbing: true,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      IconButton(
                        icon: Icon(
                          _videoController!.value.isPlaying
                              ? Icons.pause
                              : Icons.play_arrow,
                        ),
                        onPressed: () {
                          setState(() {
                            _videoController!.value.isPlaying
                                ? _videoController!.pause()
                                : _videoController!.play();
                          });
                        },
                      ),
                      IconButton(
                        icon: const Icon(Icons.stop),
                        onPressed: () {
                          _videoController!.pause();
                          _videoController!.seekTo(Duration.zero);
                        },
                      ),
                      IconButton(
                        icon: const Icon(Icons.skip_next),
                        onPressed: _playNextVideo,
                      ),
                      IconButton(
                        icon: Icon(
                          isFullscreen
                              ? Icons.fullscreen_exit
                              : Icons.fullscreen,
                        ),
                        onPressed: _toggleFullscreen,
                      ),
                    ],
                  ),
                ],
              )
              : const Center(child: CircularProgressIndicator()),
    );
  }
}
