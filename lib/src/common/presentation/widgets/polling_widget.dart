import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

import '../../../common/utils/extension.dart';

part 'polling_widget.g.dart';

// 30秒ごとにリセットされるタイマー
@riverpod
class PollingTimerController extends _$PollingTimerController {
  @override
  int build(PollingType type) {
    ref.onDispose(() => _timer?.cancel());
    start();
    return initialState;
  }

  StreamSubscription<int>? _timer;
  static const int initialState = 30;

  void start() {
    _timer?.cancel();

    _timer = Stream.periodic(
      1.seconds,
      (_) => 0,
    ).listen((duration) {
      if (state == 0) {
        state = initialState;
      }
      state--;
    });
  }
}

// ポーリングを実行したいページでCallBackをとtypeを渡して使用する。
// typeはfamilyで管理するために用意した。
// riverpodのproviderのままだとうまくCallBackを渡す方法が思いつかなかったので。。
class PollingWidget extends HookConsumerWidget {
  const PollingWidget({
    super.key,
    this.callBack,
    required this.child,
    required this.type,
  });

  final void Function()? callBack;
  final Widget child;
  final PollingType type;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final timer = ref.watch(pollingTimerControllerProvider(type));

    useEffect(
      () {
        WidgetsBinding.instance.addPostFrameCallback((_) {
          if (timer == 0) {
            callBack?.call();
          }
        });
        return null;
      },
      [timer],
    );

    return child;
  }
}

enum PollingType {
  sidebar,
}
