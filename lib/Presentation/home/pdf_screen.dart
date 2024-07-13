import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:learners_choice_app/core/blocs/cubit/docLoaderCubit/doc_loader_cubit.dart';
import 'package:learners_choice_app/core/blocs/cubit/docLoaderCubit/doc_loader_state.dart';
import 'package:pdfx/pdfx.dart';

class PdfScreen extends StatefulWidget {
  const PdfScreen({
    super.key,
  });

  @override
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
      document: PdfDocument.openAsset('assets/pdf/DrivingSyllabus.pdf'),
      initialPage: _initialPage,
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Center(child: Text('Driving School Syllabus')),
        // actions: [
        //   IconButton(
        //     icon: const Icon(Icons.refresh),
        //     onPressed: () {}, // Call refresh function here
        //   ),
        // ],
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
