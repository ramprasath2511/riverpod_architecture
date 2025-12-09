import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:get_it/get_it.dart';
import 'package:techtest/features/app/app.dart';
import 'package:techtest/features/home/data/repositories/favorite_repository.dart';
import 'package:techtest/features/home/data/repositories/image_repository.dart';

import '../../domain/entities/image_model.dart';
import '../widgets/image_grid.dart';


final favouriteProvider = FutureProvider.autoDispose<List<ImageModel>>((ref){
  final imageRepo = GetIt.I<ImageRepository>();
  final favoriteRepo = GetIt.I<FavoritesRepository>();
  final id = favoriteRepo.getAllFavourites();
  return imageRepo.getImagesByIdsFromCache(id);
});

class FavoritePage extends ConsumerWidget {
  const FavoritePage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final images = ref.watch(favouriteProvider);
    return Scaffold(
      appBar: AppBar(title: const Text("Favourites")),
      body: RefreshIndicator(
        onRefresh: () async => ref.invalidate(favouriteProvider),
        child: images.when(
          loading: () => const Center(child: CircularProgressIndicator()),
          error: (e, _) => Center(child: Text('Error: $e')),
          data: (data) {
            if (data.isEmpty) {
              return _buildEmptyState(context);
            } else {
              return Column(
                children: [
                  const Padding(
                    padding: EdgeInsets.symmetric(vertical: 12),
                    child: Center(child: Text('Pull to refresh')),
                  ),
                  Expanded(
                    child: ImageGrid(
                      snapshot: AsyncValue.data(data),
                      onReachedEndOfList: () {},
                    ),
                  ),
                ],
              );
            }
          },
        ),
      ),
    );
  }

  Widget _buildEmptyState(BuildContext context) {
    return LayoutBuilder(
      builder: (context, constraints) => ListView(
        physics: const AlwaysScrollableScrollPhysics(),
        children: [
          Container(
            padding: const EdgeInsets.all(24),
            constraints: BoxConstraints(minHeight: constraints.maxHeight),
            child: const Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text('No favourites'),
                SizedBox(height: 8),
                Text('Pull to refresh'),
              ],
            ),
          ),
        ],
      ),
    );
  }
}