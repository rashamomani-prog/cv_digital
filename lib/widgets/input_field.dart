import 'package:flutter/material.dart';

class InputField extends StatelessWidget {
  final String label;
  final Function(String) onChanged;

  const InputField({super.key, required this.label, required this.onChanged});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8),
      child: TextField(
        decoration: InputDecoration(
          labelText: label,
          border: OutlineInputBorder(borderRadius: BorderRadius.circular(12)),
        ),
        onChanged: onChanged,
      ),
    );
  }
}
