import 'package:flutter/material.dart';
import 'package:video_player/video_player.dart';

class PlayPause extends StatelessWidget {
  const PlayPause({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: VideoPlayerScreen(),
    );
  }
}

class VideoPlayerScreen extends StatefulWidget {
  const VideoPlayerScreen({super.key});

  @override
  State<VideoPlayerScreen> createState() => _VideoPlayerState();
}

class _VideoPlayerState extends State<VideoPlayerScreen> {
  late VideoPlayerController _controller;
  late Future<void> _initializePlayer;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _controller = VideoPlayerController.networkUrl(Uri.parse(
        'https://flutter.github.io/assets-for-api-docs/assets/videos/butterfly.mp4'));
    _initializePlayer = _controller.initialize();
  }

  @override
  void dispose() {
    // TODO: implement dispose
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        FutureBuilder(
            future: _initializePlayer,
            builder: (context, snapshot) {
              if (snapshot.connectionState == ConnectionState.done) {
                return AspectRatio(
                  aspectRatio: _controller.value.aspectRatio,
                  child: VideoPlayer(_controller),
                );
              } else {
                return const Center(
                  child: CircularProgressIndicator(),
                );
              }
            }),
        FloatingActionButton(
          onPressed: () {
            setState(() {
              if (_controller.value.isPlaying) {
                _controller.pause();
              } else {
                _controller.play();
              }
            });
          },
          child: Icon(_controller.value.isPlaying
              ? Icons.pause
              : Icons.play_arrow_outlined),
        ),
        Row(
          children: [
            ElevatedButton(
                onPressed: () {
                  setState(() {
                    _controller.seekTo(_controller.value.position -
                        const Duration(seconds: 3));
                    _controller.play();
                  });
                },
                child: const Icon(Icons.back_hand_outlined))
          ],
        )
      ],
    );
  }
}
