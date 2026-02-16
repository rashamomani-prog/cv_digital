import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../../providers/cv_provider.dart';
import '../../widgets/input_field.dart';
import '../../services/pdf_service.dart';

class ClassicTemplate extends StatelessWidget {
  const ClassicTemplate({super.key});

  @override
  Widget build(BuildContext context) {
    final cv = Provider.of<CvProvider>(context);

    return Scaffold(
      appBar: AppBar(
        title: const Text('Classic CV'),
        actions: [
          IconButton(
            icon: const Icon(Icons.picture_as_pdf),
            onPressed: () {
              PdfService.generatePdf(cv); // إنشاء ومشاركة PDF
            },
          ),
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.all(16),
        child: ListView(
          children: [
            InputField(
                label: 'الاسم',
                onChanged: (value) => cv.updatePersonal(name: value)),
            InputField(
                label: 'البريد الإلكتروني',
                onChanged: (value) => cv.updatePersonal(mail: value)),
            InputField(
                label: 'الهاتف',
                onChanged: (value) => cv.updatePersonal(ph: value)),
            InputField(
                label: 'المهارات',
                onChanged: (value) => cv.addSkill(value)),
            const SizedBox(height: 20),
            Card(
              child: ListTile(
                title: Text(cv.fullName),
                subtitle: Text(cv.email),
              ),
            ),
          ],
        ),
      ),
    );
  }
}