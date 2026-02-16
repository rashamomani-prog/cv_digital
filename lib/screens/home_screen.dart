import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../providers/theme_provider.dart';
import 'visual_cv_screen.dart';
import 'package:pdf/pdf.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  get PdfShare => null;

  @override
  Widget build(BuildContext context) {
    final themeProvider = Provider.of<ThemeProvider>(context);

    return Scaffold(
      appBar: AppBar(
        title: const Text("Home"),
        actions: [

          IconButton(
            icon: Icon(
              themeProvider.isDarkMode ? Icons.wb_sunny : Icons.nights_stay,
            ),
            onPressed: () => themeProvider.toggleTheme(),
          ),
          IconButton(
            icon: const Icon(Icons.share),
            onPressed: () async {
              await PdfShare.generateAndSharePdf();
            },
          ),
        ],
      ),
      body: Center(
        child: ElevatedButton(
          child: const Text("Open Visual CV"),
          onPressed: () {
            Navigator.push(
              context,
              MaterialPageRoute(
                builder: (_) => const VisualCvScreen(),
              ),
            );
          },
        ),
      ),
    );
  }
}
