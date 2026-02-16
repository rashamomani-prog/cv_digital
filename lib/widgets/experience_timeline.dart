import 'package:flutter/material.dart';
import 'experience_card.dart';

class ExperienceData {
  final String role;
  final String company;
  final String period;
  final Color color;

  ExperienceData({
    required this.role,
    required this.company,
    required this.period,
    this.color = Colors.blueGrey,
  });
}

class ExperienceTimeline extends StatelessWidget {
  final List<ExperienceData> experiences;

  const ExperienceTimeline({super.key, required this.experiences});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: experiences
          .map((exp) => Padding(
        padding: const EdgeInsets.symmetric(vertical: 10.0),
        child: ExperienceCard(
          role: exp.role,
          company: exp.company,
          period: exp.period,
          color: exp.color,
        ),
      ))
          .toList(),
    );
  }
}
