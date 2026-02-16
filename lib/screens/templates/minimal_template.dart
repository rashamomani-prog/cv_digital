import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../../providers/cv_provider.dart';
import '../../services/pdf_service.dart';
import '../../widgets/input_field.dart';
import '../../widgets/input_field.dart';

class ModernTemplate extends StatelessWidget {
  const ModernTemplate({super.key});

  @override
  Widget build(BuildContext context) {
    final cv = Provider.of<CvProvider>(context);

    return Scaffold(
      appBar: AppBar(
        title: const Text('Modern CV'),
        actions: [
          IconButton(
            icon: const Icon(Icons.picture_as_pdf),
            onPressed: () {
              PdfService.generatePdf(cv);
            },
          ),
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.all(16),
        child: ListView(
          children: [
            InputField(
              label: 'الاسم الكامل',
              onChanged: (v) => cv.updatePersonal(name: v),
            ),
            InputField(
              label: 'البريد الإلكتروني',
              onChanged: (v) => cv.updatePersonal(mail: v),
            ),
            InputField(
              label: 'رقم الهاتف',
              onChanged: (v) => cv.updatePersonal(ph: v),
            ),

            const SizedBox(height: 20),
            const Text(
              'المعاينة',
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            ),
            Card(
              child: ListTile(
                title: Text(cv.fullName.isEmpty ? 'اسمك هنا' : cv.fullName),
                subtitle: Text(cv.email.isEmpty ? 'email@example.com' : cv.email),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
