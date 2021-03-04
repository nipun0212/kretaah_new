// import 'dart:io';

// import 'package:flutter/material.dart';
// import 'package:kretaa/model/bill_notifier.dart';
// import 'package:kretaa/model/shop.dart';
// import 'package:kretaa/services/database.dart';
// import 'package:kretaa/shop_admin/state/shop_freezed_model.dart';
// import 'package:native_pdf_view/native_pdf_view.dart';
// import 'package:native_pdf_view/native_pdf_view.dart';
// import 'package:native_pdf_view/native_pdf_view.dart';
// import 'package:native_pdf_view/native_pdf_view.dart';
// import 'package:path_provider/path_provider.dart';
// import 'package:pdf/pdf.dart' as pd;
// import 'package:pdf/widgets.dart' as pw;
// import 'package:provider/provider.dart';

// class ViewPdf extends StatefulWidget {
//   const ViewPdf({Key key}) : super(key: key);

//   @override
//   _ViewPdfState createState() => _ViewPdfState();
// }

// class _ViewPdfState extends State<ViewPdf> {
//   bool isLoading = true;
//   PdfController pdfController;
//   @override
//   void initState() {
//     loadPdf();
//     super.initState();
//   }

//   loadPdf() async {
//     setState(() {
//       isLoading = true;
//     });
//     await buildPdf();
//     pdfController = await PdfController(
//         document: PdfDocument.openFile(
//             "/storage/emulated/0/Android/data/com.shivsubhash.kretaah/files/example.pdf"));
//     setState(() {
//       isLoading = false;
//     });
//   }

//   @override
//   Widget build(BuildContext context) {
//     // loadPdf();
//     // buildPdf();
//     // final pdfController = PdfController(
//     //     document: PdfDocument.openFile(
//     //         "/storage/emulated/0/Android/data/com.shivsubhash.kretaah/files/example.pdf"));
//     if (isLoading) return CircularProgressIndicator();
//     return Container(
//         child: PdfView(
//       controller: pdfController,
//     ));
//   }

//   Future buildPdf() async {
//     final database = Provider.of<Database>(context, listen: false);
//     final pdf = pw.Document();
//     final BillNotifier bill = await (database.billStreamNotifier(
//             shopDocumentId: database.loggedInUser.shopDocumentId,
//             billDocumentId: 'wR35QR3B6VYJxFJmJfHf'))
//         .first;
//     final ShopFreezedModel shop =
//         await (database.shopDocumentStream(shopId: 'hK16FlhLayc07fOkI7PG'))
//             .first;
//     pdf.addPage(pw.Page(
//         pageFormat: pd.PdfPageFormat.a4,
//         build: (pw.Context context) {
//           return pw.Column(children: [
//             pw.ListView(children: [
//               pw.Text(shop.ownerName),
//               pw.SizedBox(height: 30),
//               pw.Text(shop.shopName)
//             ]),
//             pw.Table(children: [
//               pw.TableRow(children: [pw.Text(bill.customerPhoneNumber)])
//             ])
//           ]);
//           // Center
//         }));
//     final output = await getExternalStorageDirectory();
//     final file = File("${output.path}/example.pdf");
//     // final file = File(output.path + "example.pdf");
//     print('file path = ${file.path}');
//     await file.writeAsBytes(await pdf.save());
//   }
// }
