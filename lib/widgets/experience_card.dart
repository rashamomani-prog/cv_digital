import 'package:flutter/material.dart';

class ExperienceData {
  final String role, company, period;
  final Color color;

  ExperienceData({required this.role, required this.company, required this.period, required this.color});
}

class ExperienceCard extends StatelessWidget {
  final String role;
  final String company;
  final String period;
  final Color color;

  const ExperienceCard({super.key, required this.role, required this.company, required this.period, required this.color});

  @override
  Widget build(BuildContext context) {
    return Card(
      margin: const EdgeInsets.symmetric(vertical: 8, horizontal: 16),
      color: color.withOpacity(0.2),
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
      child: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(role, style: const TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
            const SizedBox(height: 6),
            Text(company),
            const SizedBox(height: 4),
            Text(period, style: const TextStyle(color: Colors.grey)),
          ],
        ),
      ),
    );
  }
}
