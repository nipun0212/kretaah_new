import 'dart:io';

import 'package:flutter/material.dart';
import 'package:native_pdf_view/native_pdf_view.dart';
import 'package:path_provider/path_provider.dart';
import 'package:pdf/pdf.dart' as pd;
import 'package:pdf/widgets.dart' as pw;

class ViewPdf extends StatelessWidget {
  const ViewPdf({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final pdfController = PdfController(
        document: PdfDocument.openFile(
            "/storage/emulated/0/Android/data/com.shivsubhash.kretaah/files/example.pdf"));
    return Container(
        child: PdfView(
      controller: pdfController,
    ));
    // return Container(
    //   child: ElevatedButton(
    //     child: Text('Build Pdf'),
    //     onPressed: () async {
    //       await buildPdf();
    //     },
    //   ),
    // );
  }

  Future buildPdf() async {
    final pdf = pw.Document();

    pdf.addPage(pw.Page(
        pageFormat: pd.PdfPageFormat.a4,
        build: (pw.Context context) {
          return pw.Center(
            child: pw.Text("Hello World"),
          ); // Center
        }));
    final output = await getExternalStorageDirectory();
    final file = File("${output.path}/example.pdf");
    // final file = File(output.path + "example.pdf");
    print('file path = ${file.path}');
    await file.writeAsBytes(await pdf.save());
  }
}
