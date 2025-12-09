// home_page_notifier.dart

import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:get_it/get_it.dart';
import 'package:techtest/core/domain/image_model.dart';
import 'package:techtest/core/domain/image_repository.dart';

class HomePageNotifier extends StateNotifier<AsyncValue<List<ImageModel>>> {
  HomePageNotifier() : super(const AsyncLoading()) {
    _currentQuery = '';
    _fetchPage();
  }

  final _repository = GetIt.I<ImageRepository>();
  final List<ImageModel> _images = [];

  int _page = 1;
  bool _hasNextPage = true;
  bool _isLoadingMore = false;
  String _currentQuery = '';

  Future<void> search(String query) async {
    _currentQuery = query;
    _page = 1;
    if (query.isNotEmpty) {
      _images.clear();
    }
    await _fetchPage();
  }

  Future<void> _fetchPage() async {
    try {
      final newImages = _currentQuery.trim().isEmpty
          ? await _repository.fetchPopularImages(page: _page)
          : await _repository.searchImages(_currentQuery, page: _page);

      _hasNextPage = newImages.isNotEmpty;
      _images.addAll(newImages);
      state = AsyncData([..._images]);
    } catch (e, st) {
      state = AsyncError(e, st);
    }
  }

  Future<void> loadMore() async {
    if (_isLoadingMore || !_hasNextPage) return;
    _isLoadingMore = true;
    _page++;
    await _fetchPage();
    _isLoadingMore = false;
  }
}
