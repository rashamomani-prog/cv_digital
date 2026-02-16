import 'package:flutter/material.dart';
import '../widgets/experience_timeline.dart';
import '../widgets/skill_circle.dart';
import '../widgets/project_card.dart';
import '../widgets/languages_card.dart';

class VisualCvScreen extends StatelessWidget {
  const VisualCvScreen({super.key});

  @override
  Widget build(BuildContext context) {
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

    return Scaffold(
      appBar: AppBar(title: const Text("Visual CV")),
      body: SingleChildScrollView(
        child: Column(
          children: [
            const SizedBox(height: 20),
            ExperienceTimeline(experiences: experiences),
            const SizedBox(height: 30),
            const SkillCircle(label: '',),
            const SizedBox(height: 30),
            const ProjectCard(title: '', videoAsset: '',),
            const SizedBox(height: 30),
            const LanguagesCard(),
            const SizedBox(height: 50),
          ],
        ),
      ),
    );
  }
}
