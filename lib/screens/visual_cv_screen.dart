// lib/screens/visual_cv_screen.dart
import 'package:flutter/material.dart';
import '../widgets/experience_timeline.dart';
import '../widgets/skill_circle.dart';
import '../widgets/project_card.dart';
import '../widgets/languages_card.dart';

class VisualCvScreen extends StatelessWidget {
  const VisualCvScreen({super.key});

  @override
  Widget build(BuildContext context) {
    // أمثلة بيانات الخبرة
    final experiences = [
      ExperienceData(
          role: "Flutter Developer",
          company: "ABC Corp",
          period: "2022–2023",
          color: Colors.blue),
      ExperienceData(
          role: "UI/UX Designer",
          company: "Design Studio",
          period: "2021–2022",
          color: Colors.green),
      ExperienceData(
          role: "Intern",
          company: "Startup Inc",
          period: "2020–2021",
          color: Colors.orange),
    ];

    // أمثلة بيانات المهارات
    final skills = [
      {"skill": "Flutter", "percent": 0.9},
      {"skill": "Dart", "percent": 0.85},
      {"skill": "UI Design", "percent": 0.75},
    ];

    // أمثلة بيانات المشاريع
    final projects = [
      {"title": "Project 1", "image": "assets/project1.png"},
      {"title": "Project 2", "image": "assets/project2.png"},
    ];

    return Scaffold(
      appBar: AppBar(title: const Text("Visual CV")),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // الخبرة
            const Text("Experience", style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold)),
            const SizedBox(height: 16),
            ExperienceTimeline(experiences: experiences),
            const SizedBox(height: 32),

            // المهارات
            const Text("Skills", style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold)),
            const SizedBox(height: 16),
            Wrap(
              spacing: 16,
              runSpacing: 16,
              children: skills
                  .map((s) => SkillCircle(
                skill: s["skill"] as String,
                percent: s["percent"] as double,
              ))
                  .toList(),
            ),
            const SizedBox(height: 32),

            // المشاريع
            const Text("Projects", style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold)),
            const SizedBox(height: 16),
            Column(
              children: projects
                  .map((p) => ProjectCard(
                title: p["title"] as String,
                image: p["image"] as String,
                videoAsset: "", // إذا ما عندك فيديو
              ))
                  .toList(),
            ),
            const SizedBox(height: 32),

            // اللغات
            const Text("Languages", style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold)),
            const SizedBox(height: 16),
            const LanguagesCard(),
            const SizedBox(height: 50),
          ],
        ),
      ),
    );
  }
}
