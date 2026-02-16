// import 'package:flutter/material.dart';
// import 'package:flutter_animate/flutter_animate.dart';
//
// class ExperienceTimeline extends StatefulWidget {
//   final List<ExperienceData> experiences;
//
//   const ExperienceTimeline({super.key, required this.experiences});
//
//   @override
//   State<ExperienceTimeline> createState() => _ExperienceTimelineState();
// }
//
// class _ExperienceTimelineState extends State<ExperienceTimeline> {
//   @override
//   Widget build(BuildContext context) {
//     return Column(
//       children: widget.experiences
//           .asMap()
//           .entries
//           .map((entry) => _buildAnimatedCard(entry.key, entry.value))
//           .toList(),
//     );
//   }
//
//   Widget _buildAnimatedCard(int index, ExperienceData data) {
//     return Animate(
//       effects: [
//         FadeEffect(duration: 600.ms, curve: Curves.easeOut),
//         MoveEffect(
//             duration: 600.ms,
//             curve: Curves.easeOut,
//             begin: const Offset(0, 50),
//             end: Offset.zero)
//       ],
//       delay: (index * 200).ms,
//       child: Card(
//         elevation: 4,
//         shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
//         color: data.color.withOpacity(0.2),
//         margin: const EdgeInsets.symmetric(vertical: 8, horizontal: 16),
//         child: Padding(
//           padding: const EdgeInsets.all(16),
//           child: Column(
//             crossAxisAlignment: CrossAxisAlignment.start,
//             children: [
//               Text(
//                 data.role,
//                 style:
//                 const TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
//               ),
//               const SizedBox(height: 6),
//               Text(
//                 data.company,
//                 style: const TextStyle(fontSize: 16),
//               ),
//               const SizedBox(height: 4),
//               Text(
//                 data.period,
//                 style: const TextStyle(color: Colors.grey),
//               ),
//             ],
//           ),
//         ),
//       ),
//     );
//   }
// }
//
// class ExperienceData {
//   final String role;
//   final String company;
//   final String period;
//   final Color color;
//
//   ExperienceData({
//     required this.role,
//     required this.company,
//     required this.period,
//     this.color = Colors.blueGrey,
//   });
// }
