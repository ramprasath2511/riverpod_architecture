part of '../features/app/app.dart';

final _routes = <GoRoute>[
  GoRoute(
    path: '/',
    builder: (context, state) => const HomePage(),
  ),
  GoRoute(
    path: '/image',
    name: 'imageDetails',
    builder: (context, state) {
      final image = state.extra as ImageModel?;
      return ImageDetailsPage(image: image);
    },
  ),
  GoRoute(
    path: '/favourites',
    builder: (context, state) => const FavoritePage(),
  ),
];

final initialLocationProvider = Provider((_) => '/');

final goRouterProvider = Provider(
  (ref) => GoRouter(
    initialLocation: ref.read(initialLocationProvider),
    routes: _routes,
    observers: [
      _DebugNavigatorObserver(),
    ],
  ),
  dependencies: [initialLocationProvider],
);

class _DebugNavigatorObserver extends NavigatorObserver {
  @override
  void didPush(Route<dynamic> route, Route<dynamic>? previousRoute) {
    debugPrint('didPush: ${route.settings}');
  }

  @override
  void didPop(Route<dynamic> route, Route<dynamic>? previousRoute) {
    debugPrint('didPop: ${route.settings}');
  }

  @override
  void didRemove(Route<dynamic> route, Route<dynamic>? previousRoute) {
    debugPrint('didRemove: ${route.settings}');
  }

  @override
  void didReplace({Route<dynamic>? newRoute, Route<dynamic>? oldRoute}) {
    debugPrint('didReplace: ${newRoute?.settings}');
  }
}
