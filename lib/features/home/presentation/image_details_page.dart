import 'package:flutter/material.dart';
import 'package:techtest/core/domain/image_model.dart';

class ImageDetailsPage extends StatelessWidget {
  const ImageDetailsPage({super.key, required this.image});
  final ImageModel? image;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Preview'),
      ),
      body: image == null
          ? const Center(
              child: Text('No image provided'),
            )
          : SingleChildScrollView(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Image.network(
                    image!.imageUrl,
                    width: double.infinity,
                    fit: BoxFit.cover,
                  ),
                  _ImageDetails(image: image!),
                  const SizedBox(height: 32),
                ],
              ),
            ),
    );
  }
}

class _ImageDetails extends StatelessWidget {
  const _ImageDetails({required this.image});
  final ImageModel image;

  @override
  Widget build(BuildContext context) {
    final textTheme = Theme.of(context).textTheme;

    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const SizedBox(height: 16),
          Text(image.title, style: textTheme.headlineSmall),
          Text('Width: ${image.width}px\nHeight: ${image.height}px'),
          if (image.author != null) ...[
            Text('Author: ${image.author}'),
          ],
        ],
      ),
    );
  }
}
