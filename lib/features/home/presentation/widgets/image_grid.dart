import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';
import 'package:techtest/features/home/domain/entities/image_model.dart';
import 'package:techtest/features/home/presentation/widgets/image_tile.dart';

class ImageGrid extends StatelessWidget {
  const ImageGrid({
    super.key,
    required this.snapshot,
    required this.onReachedEndOfList,
  });

  final AsyncValue<List<ImageModel>> snapshot;
  final VoidCallback onReachedEndOfList;

  @override
  Widget build(BuildContext context) {
    return snapshot.when(
      data: (images) {
        if (images.isEmpty) {
          return Center(
            child: Text(
              'No images found',
              style: Theme.of(context).textTheme.bodyMedium,
            ),
          );
        }

        return NotificationListener<ScrollNotification>(
          onNotification: (scrollInfo) {
            if (scrollInfo.metrics.pixels >=
                scrollInfo.metrics.maxScrollExtent - 300) {
              onReachedEndOfList();
            }
            return false;
          },
          child: MasonryGridView.count(
            crossAxisCount: 2,
            mainAxisSpacing: 8,
            crossAxisSpacing: 8,
            itemCount: images.length,
            padding: const EdgeInsets.all(8),
            itemBuilder: (_, index) => ImageTile(image: images[index]),
          ),
        );
      },
      loading: () => const Center(child: CircularProgressIndicator()),
      error: (err, stack) => Center(
        child: Text(
          'Error: $err',
          style: Theme.of(context).textTheme.bodyMedium,
        ),
      ),
    );
  }
}
