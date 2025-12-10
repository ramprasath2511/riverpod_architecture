import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:techtest/features/home/domain/entities/image_model.dart';

class ImageTile extends StatelessWidget {
  const ImageTile({super.key, required this.image});

  final ImageModel image;

  @override
  Widget build(BuildContext context) {
    final aspectRatio = image.width.toDouble() / image.height.toDouble();

    return GestureDetector(
      onTap: () {
        context.pushNamed(
          'imageDetails',
          extra: image,
        );
      },
      child: Card(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            AspectRatio(
              aspectRatio: aspectRatio,
              child: Image.network(
                image.imageUrl,
                fit: BoxFit.cover,
                width: double.infinity,
                gaplessPlayback: true,
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(4),
              child: Text(
                image.title,
                style: Theme.of(context).textTheme.titleSmall,
                maxLines: 2,
                overflow: TextOverflow.ellipsis,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
