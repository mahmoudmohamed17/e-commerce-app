
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';

class CustomProductImage extends StatelessWidget {
  const CustomProductImage({
    super.key, required this.imageUrl,  this.height = 220,
  });
  final String imageUrl;
  final double height;

  @override
  Widget build(BuildContext context) {
    return CachedNetworkImage(
      imageUrl: imageUrl,
      height: 220,
      width: double.infinity,
      fit: BoxFit.fill,
      placeholder:
          (context, url) =>
              const Center(child: CircularProgressIndicator()),
      errorWidget:
          (context, url, error) => const Center(
            child: Icon(Icons.error, color: Colors.red),
          ),
    );
  }
}
