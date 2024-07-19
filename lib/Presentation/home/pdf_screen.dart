import 'package:flutter/material.dart';
import 'package:pdfx/pdfx.dart';

class PdfScreen extends StatefulWidget {
  final String documentPath;
  final String appBarTitle;

  const PdfScreen({
    Key? key,
    required this.documentPath,
    required this.appBarTitle,
  }) : super(key: key);

  @override
  // ignore: library_private_types_in_public_api
  _PdfScreenState createState() => _PdfScreenState();
}

class _PdfScreenState extends State<PdfScreen> {
  late PdfControllerPinch _pdfControllerPinch;
  final int _initialPage = 1;

  @override
  void initState() {
    _loadPdfDocument(); // Load PDF document initially
    super.initState();
  }

  @override
  void dispose() {
    _pdfControllerPinch.dispose();
    super.dispose();
  }

  void _loadPdfDocument() {
    _pdfControllerPinch = PdfControllerPinch(
      document: PdfDocument.openAsset(widget.documentPath),
      initialPage: _initialPage,
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Center(child: Text(widget.appBarTitle)),
      ),
      body: Stack(
        children: [
          PdfViewPinch(
            controller: _pdfControllerPinch,
            builders: PdfViewPinchBuilders<DefaultBuilderOptions>(
              options: const DefaultBuilderOptions(),
              documentLoaderBuilder: (_) =>
                  const Center(child: CircularProgressIndicator()),
              pageLoaderBuilder: (_) =>
                  const Center(child: CircularProgressIndicator()),
              errorBuilder: (_, error) => Center(child: Text(error.toString())),
            ),
            onDocumentLoaded: (document) {},
          ),
          Positioned(
            top: 16,
            right: 16,
            child: PdfPageNumber(
              controller: _pdfControllerPinch,
              builder: (
                ctx,
                loadingState,
                currentPage,
                totalPages,
              ) =>
                  Container(
                padding: const EdgeInsets.all(8.0),
                color: Colors.black54,
                child: Text(
                  'Page $currentPage / $totalPages',
                  style: const TextStyle(color: Colors.white),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
