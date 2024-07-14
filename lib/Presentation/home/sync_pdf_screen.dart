import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:learners_choice_app/core/extensions/color_extention.dart';
import 'package:syncfusion_flutter_pdfviewer/pdfviewer.dart';

class SyncPdfScreen extends StatefulWidget {
  final String documentPath;
  final String appBarTitle;

  const SyncPdfScreen(
      {Key? key, required this.documentPath, required this.appBarTitle})
      : super(key: key);

  @override
  _SyncPdfScreenState createState() => _SyncPdfScreenState();
}

class _SyncPdfScreenState extends State<SyncPdfScreen> {
  late PdfViewerController _pdfViewerController;
  bool _isSearching = false;
  final TextEditingController _searchController = TextEditingController();
  PdfTextSearchResult _searchResult = PdfTextSearchResult();

  @override
  void initState() {
    super.initState();
    _pdfViewerController = PdfViewerController();
  }

  @override
  void dispose() {
    super.dispose();
  }

  void _searchText(String query) {
    _searchResult = _pdfViewerController.searchText(query);
    _searchResult.addListener(() {
      setState(() {});
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: _isSearching
            ? Padding(
                padding: const EdgeInsets.only(bottom: 8.0),
                child: TextField(
                  style: const TextStyle(color: Colors.black),
                  controller: _searchController,
                  decoration: InputDecoration(
                    hintText: 'Search',
                    hintStyle: GoogleFonts.roboto(
                      color: Colors.black,
                    ),
                    // prefixIcon: const Icon(Icons.search, color: Colors.white),
                    filled: true,
                    fillColor: const Color(0x00d8c2bc),
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(8.0),
                      borderSide:
                          const BorderSide(width: 2, color: Color(0xFF00639B)),
                    ),
                    contentPadding:
                        const EdgeInsets.symmetric(vertical: 0, horizontal: 16),
                  ),
                  onSubmitted: (query) {
                    // Initiate search
                    _searchText(query);
                  },
                ),
              )
            : FittedBox(fit: BoxFit.scaleDown, child: Text(widget.appBarTitle)),
        actions: [
          IconButton(
            icon: Icon(_isSearching ? Icons.cancel : Icons.search),
            onPressed: () {
              setState(() {
                _isSearching = !_isSearching;
                _searchController.clear();
                _pdfViewerController
                    .clearSelection(); // Clear previous search highlights
              });
            },
          ),
        ],
      ),
      body: Column(
        children: [
          Expanded(
            child: SfPdfViewer.asset(
              widget.documentPath,
              controller: _pdfViewerController,
            ),
          ),
          if (_isSearching && _searchResult.totalInstanceCount > 0)
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  IconButton(
                    icon: const Icon(Icons.navigate_before),
                    onPressed: () {
                      if (_searchResult.currentInstanceIndex > 0) {
                        _searchResult.previousInstance();
                      }
                    },
                  ),
                  Text(
                    '${_searchResult.currentInstanceIndex} of ${_searchResult.totalInstanceCount}',
                    style: const TextStyle(color: Colors.black),
                  ),
                  IconButton(
                    icon: const Icon(Icons.navigate_next),
                    onPressed: () {
                      if (_searchResult.currentInstanceIndex <
                          _searchResult.totalInstanceCount - 1) {
                        _searchResult.nextInstance();
                      }
                    },
                  ),
                ],
              ),
            ),
        ],
      ),
    );
  }
}
