import 'package:flutter/material.dart';
import 'package:pdf/pdf.dart';
import 'package:pdf/widgets.dart' as pw;
import '../globals.dart';

class viewpage extends StatefulWidget {
  const viewpage({super.key});

  @override
  State<viewpage> createState() => _viewpageState();
}

class _viewpageState extends State<viewpage> {
  final pdf = pw.Document();

  @override
  // pdf.addPage(pw.Page(
  // pageFormat: PdfPageFormat.a4,
  // build: (pw.Context context) {
  // return pw.Center(
  // child: pw.Text("Hello World"),
  // ); // Center
  // }));
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("View Task"),
        centerTitle: true,
      ),
      floatingActionButton: CircleAvatar(
        child: IconButton(
          onPressed: () {
            setState(() {});
          },
          icon: Icon(Icons.picture_as_pdf),
        ),
      ),
      body: Column(
        children: Global.task
            .map((e) => Center(
                  child: SingleChildScrollView(
                    child: Container(
                      height: 100,
                      width: double.infinity,
                      margin: EdgeInsets.all(30),
                      decoration: BoxDecoration(
                        color: Colors.lightBlue,
                        borderRadius: BorderRadius.circular(10),
                      ),
                      child: Center(child: Text(e)),
                    ),
                  ),
                ))
            .toList(),
      ),
    );
  }
}
