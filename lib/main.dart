import 'package:flutter/material.dart';
import 'package:video_player/video_player.dart';

void main() {
  runApp(const MyPortfolioApp());
}

class MyPortfolioApp extends StatelessWidget {
  const MyPortfolioApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: const PortfolioScreen(),
    );
  }
}

class PortfolioScreen extends StatelessWidget {
  const PortfolioScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("My Digital CV"),
        backgroundColor: Colors.deepPurple,
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text(
              "Skills",
              style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 16),
            SizedBox(
              height: 120,
              child: ListView(
                scrollDirection: Axis.horizontal,
                children: const [
                  SkillCircle(skill: "Flutter", percent: 0.8),
                  SkillCircle(skill: "Dart", percent: 0.7),
                  SkillCircle(skill: "Firebase", percent: 0.6),
                  SkillCircle(skill: "UI/UX", percent: 0.75),
                ],
              ),
            ),
            const SizedBox(height: 32),
            const Text(
              "Experience",
              style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 16),
            const ExperienceChart(),
            const SizedBox(height: 32),
            const Text(
              "Projects",
              style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 16),
            SizedBox(
              height: 250,
              child: ListView(
                scrollDirection: Axis.horizontal,
                children: const [
                  ProjectCard(
                      title: "Portfolio App",
                      imageUrl: "https://picsum.photos/200/150?random=1",
                      videoUrl: null),
                  ProjectCard(
                      title: "E-commerce App",
                      imageUrl: "https://picsum.photos/200/150?random=2",
                      videoUrl: null),
                  ProjectCard(
                      title: "Chat App",
                      imageUrl: "https://picsum.photos/200/150?random=3",
                      videoUrl: null),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class SkillCircle extends StatefulWidget {
  final String skill;
  final double percent;

  const SkillCircle({super.key, required this.skill, required this.percent});

  @override
  State<SkillCircle> createState() => _SkillCircleState();
}

class _SkillCircleState extends State<SkillCircle>
    with SingleTickerProviderStateMixin {
  late AnimationController _controller;
  late Animation<double> _animation;

  @override
  void initState() {
    super.initState();
    _controller =
        AnimationController(vsync: this, duration: const Duration(seconds: 2));
    _animation = Tween<double>(begin: 0, end: widget.percent).animate(
        CurvedAnimation(parent: _controller, curve: Curves.easeOut));
    _controller.forward();
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 12),
      child: Column(
        children: [
          AnimatedBuilder(
            animation: _animation,
            builder: (context, child) {
              return SizedBox(
                width: 80,
                height: 80,
                child: Stack(
                  fit: StackFit.expand,
                  children: [
                    CircularProgressIndicator(
                      value: _animation.value,
                      strokeWidth: 8,
                      color: Colors.deepPurple,
                      backgroundColor: Colors.grey.shade300,
                    ),
                    Center(
                        child: Text(
                          "${(_animation.value * 100).toInt()}%",
                          style: const TextStyle(fontWeight: FontWeight.bold),
                        )),
                  ],
                ),
              );
            },
          ),
          const SizedBox(height: 8),
          Text(widget.skill),
        ],
      ),
    );
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }
}
class ExperienceChart extends StatelessWidget {
  const ExperienceChart({super.key});

  @override
  Widget build(BuildContext context) {
    final experiences = [
      {"year": "2020", "value": 2.0},
      {"year": "2021", "value": 3.0},
      {"year": "2022", "value": 4.0},
      {"year": "2023", "value": 5.0},
    ];

    return SizedBox(
      height: 150,
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.end,
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: experiences.map((exp) {
          return Column(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              AnimatedContainer(
                duration: const Duration(seconds: 2),
                curve: Curves.easeOut,
                height: exp["value"]! * 20,
                width: 30,
                color: Colors.pink,
              ),
              const SizedBox(height: 8),
              Text(exp['year'].toString())
            ],
          );
        }).toList(),
      ),
    );
  }
}

extension on Object {
  double? operator *(int other) {}
}

class ProjectCard extends StatefulWidget {
  final String title;
  final String imageUrl;
  final String? videoUrl;

  const ProjectCard(
      {super.key, required this.title, required this.imageUrl, this.videoUrl});

  @override
  State<ProjectCard> createState() => _ProjectCardState();
}

class _ProjectCardState extends State<ProjectCard> {
  VideoPlayerController? _controller;

  @override
  void initState() {
    super.initState();
    if (widget.videoUrl != null) {
      _controller = VideoPlayerController.network(widget.videoUrl!)
        ..initialize().then((_) {
          setState(() {});
        });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 200,
      margin: const EdgeInsets.symmetric(horizontal: 8),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(16),
        color: Colors.white,
        boxShadow: [
          BoxShadow(
            color: Colors.grey.shade400,
            blurRadius: 6,
            offset: const Offset(2, 2),
          ),
        ],
      ),
      child: Column(
        children: [
          ClipRRect(
            borderRadius: const BorderRadius.vertical(top: Radius.circular(16)),
            child: widget.videoUrl != null
                ? _controller != null && _controller!.value.isInitialized
                ? AspectRatio(
              aspectRatio: _controller!.value.aspectRatio,
              child: VideoPlayer(_controller!),
            )
                : const SizedBox(
              height: 120,
              child: Center(child: CircularProgressIndicator()),
            )
                : Stack(
              children: [
                Image.network(widget.imageUrl,
                    height: 120, width: 200, fit: BoxFit.cover),
                Positioned.fill(
                  child: Center(
                    child: Icon(Icons.play_circle_fill,
                        color: Colors.white.withOpacity(0.7), size: 50),
                  ),
                )
              ],
            ),
          ),
          const SizedBox(height: 8),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 8),
            child: Text(widget.title,
                style: const TextStyle(fontWeight: FontWeight.bold)),
          ),
        ],
      ),
    );
  }

  @override
  void dispose() {
    _controller?.dispose();
    super.dispose();
  }
}
