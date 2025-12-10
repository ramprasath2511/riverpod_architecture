import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:techtest/features/home/domain/entities/image_model.dart';
import 'package:techtest/features/home/presentation/state/home_page_notifier.dart';
import 'package:techtest/features/home/presentation/widgets/custom_search_bar.dart';
import 'package:techtest/features/home/presentation/widgets/image_grid.dart';

final _imageListProvider =
    StateNotifierProvider<HomePageNotifier, AsyncValue<List<ImageModel>>>(
  (ref) => HomePageNotifier(),
);

class HomePage extends ConsumerWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final images = ref.watch(_imageListProvider);
    final notifier = ref.read(_imageListProvider.notifier);

    return Scaffold(
      appBar: AppBar(
        title: const Text('IMAGE VIEWER'),
        actions: [
          Padding(
            padding: const EdgeInsets.only(right: 12),
            child: TextButton(
              onPressed: () {
                context.push('/favourites');
              },
              style: Theme.of(context).textButtonTheme.style,
              child: const Text('Favourites'),
            ),
          ),
        ],
      ),
      body: Column(
        children: [
          CustomSearchBar(
            onSearchQueryChanged: (query) {
              ref.read(_imageListProvider.notifier).search(query);
            },
          ),
          Expanded(
            child: ImageGrid(
              snapshot: images,
              onReachedEndOfList: notifier.loadMore,
            ),
          ),
        ],
      ),
    );
  }
}
