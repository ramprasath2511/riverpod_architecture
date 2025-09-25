import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:techtest/core/domain/image_model.dart';
import 'package:techtest/features/home/presentation/home_page.dart';
import 'package:techtest/features/home/presentation/image_details_page.dart';

part 'router.dart';
part 'theme.dart';

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
