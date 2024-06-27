import 'package:roggle/roggle.dart';

final roggle = Roggle();

///
/// sandbox
///
/// run: flutter run --web-renderer html --target="lib/sandbox/main.dart" --dart-define=FLAVOR=dev --dart-define=WEB_RENDERER=html
///
void main() {
  roggle
    ..v('Hello roggle!')
    ..d(1000)
    ..i(true)
    ..i([1, 2, 3])
    ..i({'key': 'key', 'value': 'value'})
    ..i({'apple', 'banana'})
    ..i(() => 'function message')
    ..w(Exception('some exception'))
    ..e(Exception());
  print('aaaaaa');

  try {
    throw Exception('some exception');
  } on Exception catch (e, s) {
    roggle.wtf('wtf...', error: e, stackTrace: s);
  }
}
