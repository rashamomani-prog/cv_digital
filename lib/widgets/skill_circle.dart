import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
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

