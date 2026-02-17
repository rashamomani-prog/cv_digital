import 'package:flutter/material.dart';

class DynamicCVPage extends StatelessWidget {
  const DynamicCVPage({super.key});

  // مثال بيانات المهارات
  final List<Map<String, dynamic>> skills = const [
    {"skill": "Flutter", "percent": 0.9},
    {"skill": "Dart", "percent": 0.85},
    {"skill": "Firebase", "percent": 0.8},
    {"skill": "UI/UX", "percent": 0.75},
  ];

  // مثال بيانات الخبرة
  final List<Map<String, dynamic>> experiences = const [
    {"year": "2019", "value": 0.5},
    {"year": "2020", "value": 0.65},
    {"year": "2021", "value": 0.8},
    {"year": "2022", "value": 0.9},
  ];

  // مثال بيانات المشاريع
  final List<Map<String, String>> projects = const [
    {"title": "Project One", "image": "assets/project1.png"},
    {"title": "Project Two", "image": "assets/project2.png"},
    {"title": "Project Three", "image": "assets/project3.png"},
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Dynamic CV"),
        backgroundColor: Colors.pink,
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text("Skills", style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold)),
            const SizedBox(height: 12),
            SizedBox(
              height: 120,
              child: ListView(
                scrollDirection: Axis.horizontal,
                children: skills.map((s) => SkillCircle(skill: s["skill"], percent: s["percent"])).toList(),
              ),
            ),
            const SizedBox(height: 24),
            const Text("Experience", style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold)),
            const SizedBox(height: 12),
            Column(
              children: experiences
                  .map((e) => ExperienceChart(year: e["year"], value: e["value"]))
                  .toList(),
            ),
            const SizedBox(height: 24),
            const Text("Projects", style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold)),
            const SizedBox(height: 12),
            Column(
              children: projects
                  .map((p) => ProjectCard(
                title: p["title"]?.toString() ?? "بدون عنوان",
                image: p["image"]?.toString() ?? "assets/images/default.png",
              ))
                  .toList(),
            ),
          ],
        ),
      ),
    );
  }
}

// ==================== SkillCircle ====================
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
                      color: Colors.pink,
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

// ==================== ExperienceChart ====================
class ExperienceChart extends StatelessWidget {
  final String year;
  final double value;

  const ExperienceChart({super.key, required this.year, required this.value});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(year),
          const SizedBox(height: 4),
          LinearProgressIndicator(
            value: value,
            backgroundColor: Colors.grey.shade300,
            color: Colors.pink,
            minHeight: 8,
          ),
        ],
      ),
    );
  }
}

// ==================== ProjectCard ====================
class ProjectCard extends StatelessWidget {
  final String title;
  final String image; // مسار الصورة في assets

  const ProjectCard({super.key, required this.title, required this.image});

  @override
  Widget build(BuildContext context) {
    return Card(
      margin: const EdgeInsets.symmetric(vertical: 8),
      child: Column(
        children: [
          Image.asset(image, fit: BoxFit.cover),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Text(title, style: const TextStyle(fontWeight: FontWeight.bold)),
          ),
        ],
      ),
    );
  }
}
