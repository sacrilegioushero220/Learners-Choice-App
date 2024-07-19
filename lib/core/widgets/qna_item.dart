// ignore_for_file: library_private_types_in_public_api

import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';

class QnaItem extends StatefulWidget {
  const QnaItem({
    super.key,
    required this.answer,
    required this.imagePath,
    required this.question,
    required this.number,
  });

  final String answer;
  final String imagePath;
  final String question;
  final int number;

  @override
  _QnaItemState createState() => _QnaItemState();
}

class _QnaItemState extends State<QnaItem> {
  late String _imagePath;

  @override
  void initState() {
    super.initState();
    _imagePath = widget.imagePath;
  }

  void _reloadImage() {
    setState(() {
      _imagePath =
          '${widget.imagePath}?v=${DateTime.now().millisecondsSinceEpoch}';
    });
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.all(16),
      padding: const EdgeInsets.all(16),
      decoration: ShapeDecoration(
        color: const Color(0xFFFFF8F6),
        shape: RoundedRectangleBorder(
          side: const BorderSide(width: 1, color: Color(0xFFD8C2BC)),
          borderRadius: BorderRadius.circular(12),
        ),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            "Q${widget.number}: ${widget.question}",
            style: const TextStyle(
              color: Colors.black,
              fontSize: 18,
              fontFamily: 'Roboto',
              fontWeight: FontWeight.w500,
            ),
            textAlign: TextAlign.justify,
          ),
          if (widget.imagePath.isNotEmpty)
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 16.0),
              child: Container(
                height: 200,
                width: double.infinity,
                decoration: BoxDecoration(
                  color: const Color(0xFF1F1A1C),
                  borderRadius: BorderRadius.circular(12),
                ),
                child: CachedNetworkImage(
                  imageUrl: _imagePath,
                  fit: BoxFit.contain,
                  errorWidget: (context, url, error) {
                    return Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        const Text(
                          'Failed to load image.',
                          style: TextStyle(color: Colors.white),
                        ),
                        const SizedBox(height: 10),
                        ElevatedButton(
                          onPressed: _reloadImage,
                          child: const Text('Retry'),
                        ),
                      ],
                    );
                  },
                ),
              ),
            ),
          const SizedBox(
            height: 15,
          ),
          Text.rich(
            textAlign: TextAlign.justify,
            TextSpan(
              children: [
                const TextSpan(
                  text: "Ans: ",
                  style: TextStyle(
                    color: Colors.black,
                    fontSize: 16,
                    fontFamily: 'Roboto',
                    fontWeight: FontWeight.bold,
                  ),
                ),
                TextSpan(
                  text: widget.answer,
                  style: const TextStyle(
                    color: Colors.black,
                    fontSize: 16,
                    fontFamily: 'Roboto',
                    fontWeight: FontWeight.w400,
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
