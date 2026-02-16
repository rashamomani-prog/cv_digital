import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../../providers/cv_provider.dart';
import '../../widgets/input_field.dart';
import 'package:pdf/pdf.dart';

class ClassicTemplate extends StatelessWidget {
  const ClassicTemplate({super.key});

  @override
  Widget build(BuildContext context) {
    final cv = Provider.of<CvProvider>(context);

    return Scaffold(
      appBar: AppBar(
        title: const Text('modern CV'),
        actions: [
          IconButton(
            icon: const Icon(Icons.picture_as_pdf),
            onPressed: () {
              PdfService.generatePdf(cv.data);
            },
          ),
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.all(16),
        child: ListView(
          children: [
            InputField(label: 'الاسم', onChanged: cv.updateName),
            InputField(label: 'المسمى الوظيفي', onChanged: cv.updateJob),
            InputField(label: 'نبذة عنك', onChanged: cv.updateBio),
            InputField(label: 'المهارات', onChanged: cv.updateSkills),
            const SizedBox(height: 20),
            Card(
              child: ListTile(
                title: Text(cv.data.name),
                subtitle: Text(cv.data.jobTitle),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
