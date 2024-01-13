import 'package:flutter/material.dart';
import 'package:pdfx/pdfx.dart';

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key});

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  late PdfControllerPinch pdfControllerPinch;
  int totalpage = 0;
  int currentPage = 1;

  @override
  void initState() {
    pdfControllerPinch =
        PdfControllerPinch(document: PdfDocument.openAsset('lib/asset/a.pdf'));
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.red,
        title: Text("Pdf Viewer"),
      ),
      body: Column(
        children: [
          Row(
            mainAxisSize: MainAxisSize.max,
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Text("Total Pag ${totalpage}"),
              IconButton(
                  onPressed: () {
                    pdfControllerPinch.previousPage(
                        duration: Duration(microseconds: 200),
                        curve: Curves.bounceIn);
                  },
                  icon: Icon(Icons.arrow_back)),
              Text("Current Page ${currentPage}"),
              IconButton(
                  onPressed: () {
                    pdfControllerPinch.nextPage(
                        duration: Duration(microseconds: 200),
                        curve: Curves.linear);
                  },
                  icon: Icon(Icons.arrow_forward)),
            ],
          ),
          Expanded(
            child: PdfViewPinch(
              controller: pdfControllerPinch,
              onDocumentLoaded: (doc) {
                setState(() {
                  totalpage = doc.pagesCount;
                });
              },
              onPageChanged: (value) {
                setState(() {
                  currentPage = value;
                });
              },
            ),
          ),
        ],
      ),
    );
  }
}
