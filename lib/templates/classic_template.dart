import 'package:flutter/material.dart';

class ClassicTemplate extends StatelessWidget {
  const ClassicTemplate({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Classic CV')),
      body: const Center(child: Text('Classic Template')),
    );
  }
}
