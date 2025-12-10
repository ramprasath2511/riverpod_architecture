import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:techtest/features/home/domain/entities/image_model.dart';
import 'package:techtest/features/home/presentation/pages/home_page.dart';
import 'package:techtest/features/home/presentation/pages/image_details_page.dart';

import '../home/presentation/pages/favorite_page.dart';


part '../../config/router.dart';
part '../../config/theme.dart';

class App extends ConsumerWidget {
  const App({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return MaterialApp.router(
      theme: _theme,
      routerConfig: ref.watch(goRouterProvider),
    );
  }
}
