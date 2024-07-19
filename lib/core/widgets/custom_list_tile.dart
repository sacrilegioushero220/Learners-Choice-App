import 'package:flutter/material.dart';
import 'package:cached_network_image/cached_network_image.dart';

class CustomListTile extends StatelessWidget {
  const CustomListTile({
    super.key,
    required this.number,
    required this.imagePath,
    required this.title,
  });

  final String number;
  final String imagePath;
  final String title;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(8.0),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          SizedBox(
            child: CachedNetworkImage(
              imageUrl: imagePath,
              width: 80,
              height: 80,
              fit: BoxFit.contain,
              // placeholder: (context, url) => const CircularProgressIndicator(
              //   valueColor: AlwaysStoppedAnimation<Color>(Colors.blue),
              // ),
              errorWidget: (context, url, error) => const Icon(
                Icons.error,
                color: Colors.red,
              ),
            ),
          ),
          const SizedBox(height: 8),
          Flexible(
            child: Text(
              title,
              textAlign: TextAlign.center,
              overflow: TextOverflow.visible,
              style: const TextStyle(
                color: Colors.black,
                fontSize: 12,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
