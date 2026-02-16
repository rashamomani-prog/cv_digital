import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';

class SkillCircle extends StatelessWidget {
  final String label;

  const SkillCircle({super.key, required this.label});

  @override
  Widget build(BuildContext context) {
    return Animate(
      effects: [ScaleEffect(duration: 800.ms, curve: Curves.easeInOut)],
      child: CircleAvatar(
        radius: 30,
        child: Text(label, textAlign: TextAlign.center, style: const TextStyle(fontSize: 12)),
      ),
    );
  }
}
