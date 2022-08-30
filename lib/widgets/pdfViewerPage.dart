import 'dart:io';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:kingdoms_kids/utilities/colors.dart';
import 'package:kingdoms_kids/utilities/referenceIndexPage..dart';
import 'package:path_provider/path_provider.dart';
import 'package:pdf_viewer_plugin/pdf_viewer_plugin.dart';

class PDFViewerPage extends StatefulWidget {
  Map<String, String> map;
  int index;
  PDFViewerPage({Key? key, required this.map, required this.index})
      : super(key: key);

  @override
  State<PDFViewerPage> createState() =>
      _PDFViewerPageState(map: map, index: index);
}

class _PDFViewerPageState extends State<PDFViewerPage> {
  Map<String, String> map;
  int index;
  String path;
  String? pdfFilePath;
  _PDFViewerPageState(
      {required this.map, required this.index, this.path = ""}) {
    path = map.values.toList()[index];
  }

  Future<String> downloadAndSavePDF() async {
    final directory = await getApplicationDocumentsDirectory();
    final file = File(
        '${directory.path}/${path.split("/")[path.split("/").length - 1]}');
    if (await file.exists()) {
      return file.path;
    }
    final response = await http.get(Uri.parse(path));
    await file.writeAsBytes(response.bodyBytes);
    return file.path;
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    loadPDF();
    setState(() {});
  }

  void loadPDF() async {
    pdfFilePath = await downloadAndSavePDF();
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: () {
        Navigator.pop(context);
        return Future.delayed(Duration.zero);
      },
      child: Scaffold(
        appBar: AppBar(
          backgroundColor: mainColor,
          centerTitle: true,
          title: Text(map.keys.toList()[index]),
        ),
        body: Center(
          child: pdfFilePath == null
              ? CircularProgressIndicator(
                  color: mainColor,
                )
              : Expanded(
                  child: PdfView(
                    path: pdfFilePath!,
                  ),
                ),
        ),
      ),
    );
  }
}
