import 'dart:async';

import 'package:flutter/foundation.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:techtest/features/app/app.dart';
import 'package:techtest/features/app/service_locator.dart';

void main() {
  runZonedGuarded(
    () async {
      WidgetsFlutterBinding.ensureInitialized();

      // Dependency Injection setup
      registerDependencies();

      runApp(
        const ProviderScope(
          child: App(),
        ),
      );
    },
    (error, stackTrace) {
      if (kReleaseMode) {
        //
      }
    },
  );
}
