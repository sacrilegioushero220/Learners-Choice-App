import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';

class QuestionCard extends StatefulWidget {
  final String? image;
  final String question;

  const QuestionCard({
    super.key,
    this.image,
    required this.question,
  });

  @override
  _QuestionCardState createState() => _QuestionCardState();
}

class _QuestionCardState extends State<QuestionCard> {
  bool _showError = false;
  late String _imageKey;

  @override
  void initState() {
    super.initState();
    _imageKey = UniqueKey().toString();
  }

  void _refreshImage() {
    setState(() {
      _showError = false;
      _imageKey = UniqueKey().toString(); // Generate a new key to force reload
    });
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      width: MediaQuery.of(context).size.width,
      clipBehavior: Clip.antiAlias,
      decoration: containerDecDefault(),
      child: Padding(
        padding: const EdgeInsets.all(10.0),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            SizedBox(
              width: 331,
              child: Text(
                textAlign: TextAlign.justify,
                widget.question,
                style: const TextStyle(
                  color: Colors.black,
                  fontSize: 18,
                  fontFamily: 'Roboto',
                  fontWeight: FontWeight.w500,
                ),
              ),
            ),
            if (widget.image != null && widget.image!.isNotEmpty)
              SizedBox(
                height: 226,
                width: MediaQuery.of(context).size.width,
                child: Padding(
                  padding: const EdgeInsets.only(
                    top: 20,
                    bottom: 20,
                    right: 60,
                    left: 60,
                  ),
                  child: _showError
                      ? Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            const Text(
                              'Failed to load image. Please check your internet connection and try again.',
                              textAlign: TextAlign.center,
                              style: TextStyle(color: Colors.red),
                            ),
                            const SizedBox(height: 8),
                            ElevatedButton(
                              onPressed: _refreshImage,
                              child: const Text('Refresh'),
                            ),
                          ],
                        )
                      : imageContainerBlack(
                          widget.image!, _refreshImage, _imageKey),
                ),
              )
            else
              const SizedBox(),
          ],
        ),
      ),
    );
  }
}

ShapeDecoration containerDecDefault() {
  return ShapeDecoration(
    color: const Color(0xFFFFF8F6),
    shape: RoundedRectangleBorder(
      side: const BorderSide(width: 1, color: Color(0xFFD8C2BC)),
      borderRadius: BorderRadius.circular(12),
    ),
  );
}

Widget imageContainerBlack(
    String image, VoidCallback onError, String imageKey) {
  return Container(
    padding: const EdgeInsets.all(10),
    clipBehavior: Clip.antiAlias,
    decoration: ShapeDecoration(
      color: const Color(0xFF1F1A1C),
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(12),
      ),
      shadows: const [
        BoxShadow(
          color: Color(0x4C000000),
          blurRadius: 2,
          offset: Offset(0, 1),
          spreadRadius: 0,
        ),
        BoxShadow(
          color: Color(0x26000000),
          blurRadius: 3,
          offset: Offset(0, 1),
          spreadRadius: 1,
        )
      ],
    ),
    child: CachedNetworkImage(
      key: Key(imageKey), // Use the key to force reload
      imageUrl: image,
      width: 154,
      height: 154,
      fit: BoxFit.contain,
      placeholder: (context, url) =>
          const Center(child: CircularProgressIndicator()),
      errorWidget: (context, url, error) => RefreshWidget(onPressed: onError),
    ),
  );
}

class RefreshWidget extends StatelessWidget {
  final VoidCallback onPressed;

  const RefreshWidget({Key? key, required this.onPressed}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        const Text(
          'Failed to load image. Please check your internet connection and try again.',
          textAlign: TextAlign.center,
          style: TextStyle(color: Colors.red),
        ),
        const SizedBox(height: 8),
        ElevatedButton(
          onPressed: onPressed,
          child: const Text('Refresh'),
        ),
      ],
    );
  }
}
