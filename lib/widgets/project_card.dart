import 'package:flutter/material.dart';
import 'package:video_player/video_player.dart';

class ProjectCard extends StatefulWidget {
  final String title;
  final String videoAsset;

  const ProjectCard({super.key, required this.title, required this.videoAsset});

  @override
  State<ProjectCard> createState() => _ProjectCardState();
}

class _ProjectCardState extends State<ProjectCard> {
  late VideoPlayerController _controller;

  @override
  void initState() {
    super.initState();
    _controller = VideoPlayerController.asset(widget.videoAsset)
      ..initialize().then((_) => setState(() {}))
      ..setLooping(true)
      ..play();
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Card(
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
      child: Column(
        children: [
          Text(widget.title, style: const TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
          const SizedBox(height: 10),
          _controller.value.isInitialized
              ? AspectRatio(aspectRatio: _controller.value.aspectRatio, child: VideoPlayer(_controller))
              : const CircularProgressIndicator(),
        ],
      ),
    );
  }
}
