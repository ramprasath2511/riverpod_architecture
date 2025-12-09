import 'package:flutter/material.dart';

extension SnackBarX on BuildContext {
  /// Displays a [SnackBar] with the given [message].
  ScaffoldFeatureController<SnackBar, SnackBarClosedReason> showSnackBar(
    String message,
  ) {
    ScaffoldMessenger.of(this).clearSnackBars();
    return ScaffoldMessenger.of(this)
        .showSnackBar(SnackBar(content: Text(message)));
  }
}
