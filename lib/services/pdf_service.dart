import 'dart:io';

import 'package:path_provider/path_provider.dart';
import 'package:pdf/widgets.dart' as pw;
import 'package:pdf/pdf.dart';
import 'package:share_plus/share_plus.dart';
import 'package:cross_file/cross_file.dart';

import '../providers/cv_provider.dart';

class PdfService {
  static Future<void> generatePdf(CvProvider cv) async {
    final pdf = pw.Document();

    pdf.addPage(
      pw.Page(
        pageFormat: PdfPageFormat.a4,
        build: (pw.Context context) {
          return pw.Column(
            crossAxisAlignment: pw.CrossAxisAlignment.start,
            children: [
              pw.Text(
                cv.fullName,
                style: pw.TextStyle(
                  fontSize: 24,
                  fontWeight: pw.FontWeight.bold,
                ),
              ),
              pw.SizedBox(height: 8),

              pw.Text('Email: ${cv.email}'),
              pw.Text('Phone: ${cv.phone}'),

              pw.SizedBox(height: 16),
              pw.Text('Skills', style: pw.TextStyle(fontSize: 18)),
              pw.SizedBox(height: 6),
              ...cv.skills.map((s) => pw.Text('• $s')),

              pw.SizedBox(height: 16),
              pw.Text('Experience', style: pw.TextStyle(fontSize: 18)),
              pw.SizedBox(height: 6),
              ...cv.experiences.map(
                    (e) => pw.Text(
                  '• ${e.role} - ${e.company} (${e.period})',
                ),
              ),

              pw.SizedBox(height: 16),
              pw.Text('Projects', style: pw.TextStyle(fontSize: 18)),
              pw.SizedBox(height: 6),
              ...cv.projects.map((p) => pw.Text('• ${p.title}')),
            ],
          );
        },
      ),
    );

    final dir = await getTemporaryDirectory();
    final file = File('${dir.path}/cv.pdf');
    await file.writeAsBytes(await pdf.save());

    await Share.shareXFiles(
      [XFile(file.path)],
      text: 'My Digital CV',
    );
  }
}
