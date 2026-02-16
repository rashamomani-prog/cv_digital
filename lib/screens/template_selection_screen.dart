import 'package:cv_digital/templates/minimal_template.dart';
import 'package:flutter/material.dart';
import 'templates/classic_template.dart';
import 'templates/modern_template.dart' hide ClassicTemplate;
import 'templates/minimal_template.dart';

class TemplateSelectionScreen extends StatelessWidget {
  const TemplateSelectionScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('اختر نموذج CV')),
      body: GridView.count(
        padding: const EdgeInsets.all(16),
        crossAxisCount: 2,
        crossAxisSpacing: 16,
        mainAxisSpacing: 16,
        children: [
          _card(context, 'Classic', Colors.blueGrey, const ClassicTemplate()),
          _card(context, 'Modern', Colors.teal, const ModernTemplate()),
          _card(context, 'Minimal', Colors.deepOrange, const MinimalTemplate()),
        ],
      ),
    );
  }

  Widget _card(BuildContext context, String title, Color color, Widget screen) {
    return InkWell(
      onTap: () {
        Navigator.push(context, MaterialPageRoute(builder: (_) => screen));
      },
      child: Card(
        color: color,
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
        child: Center(
          child: Text(
            title,
            style: const TextStyle(
              fontSize: 22,
              color: Colors.white,
              fontWeight: FontWeight.bold,
            ),
          ),
        ),
      ),
    );
  }
}
