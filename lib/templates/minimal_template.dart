import 'package:flutter/material.dart';

class MinimalTemplate extends StatelessWidget {
  const MinimalTemplate({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Minimal CV')),
      body: const Center(child: Text('Minimal Template')),
    );
  }
}
