import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'scaffold_messenger.g.dart';

/// GlobalKey for SnackBar display
@Riverpod(keepAlive: true)
GlobalKey<ScaffoldMessengerState> scaffoldMessengerKey(Ref ref) {
  return GlobalKey<ScaffoldMessengerState>();
}
