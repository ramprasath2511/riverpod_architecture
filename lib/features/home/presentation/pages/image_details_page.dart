import 'package:flutter/material.dart';
import 'package:get_it/get_it.dart';
import 'package:techtest/features/home/domain/entities/image_model.dart';

import '../../data/repositories/favorite_repository.dart';
import '../../data/services/favorite_service.dart';
import '../widgets/favourite_icon_button.dart';

class ImageDetailsPage extends StatefulWidget {
  const ImageDetailsPage({super.key, required this.image});
  final ImageModel? image;

  @override
  State<ImageDetailsPage> createState() => _ImageDetailsPageState();
}

class _ImageDetailsPageState extends State<ImageDetailsPage> {
  late final _repo = GetIt.I<FavoritesRepository>();
  late final _service = GetIt.I<FavouritesService>();

  @override
  Widget build(BuildContext context) {
     final image = widget.image;
    if (image == null) {
      return const Scaffold(
        body: Center(child: Text('No image provided')),
      );
    }

    final isFavourited = _repo.isFavourite(image.id);
    return Scaffold(
      appBar: AppBar(
        title: const Text('Preview'),
      ),
      body: SingleChildScrollView(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
              Stack(
              children: [
                  Image.network(
                    widget.image!.imageUrl,
                    width: double.infinity,
                    fit: BoxFit.cover,
                  ),
        Positioned(
          bottom: 12,
          right: 12,
          child: FavouriteIconButton(
              image: image,
              isSelectedInitial: isFavourited,
              onFavourited: () => _service.addFavourite(widget.image!.id),
              onUnfavourited: () =>
                  _service.removeFavourite(widget.image!.id),)),


        ]),
                  _ImageDetails(image: widget.image!),
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
