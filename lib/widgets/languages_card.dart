import 'package:flutter/material.dart';
import 'base_card.dart';

class LanguagesCard extends StatelessWidget {
  const LanguagesCard({super.key});

  @override
  Widget build(BuildContext context) {
    final languages = ["English", "Arabic", "Spanish"];
    return BaseCard(
      title: "Languages",
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: languages
            .map((lang) => Column(
          children: [
            CircleAvatar(
              radius: 24,
              backgroundColor: Colors.blueGrey.withOpacity(0.2),
              child: Text(lang[0]),
            ),
            const SizedBox(height: 8),
            Text(lang, style: const TextStyle(fontSize: 14)),
          ],
        ))
            .toList(),
      ),
    );
  }
}
