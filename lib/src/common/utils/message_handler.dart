import 'package:rem_admin/src/common/utils/logger.dart';

class MessageHandler {
  factory MessageHandler() => _instance;

  MessageHandler._();

  static final _instance = MessageHandler._();

  final Map<MessageHandlerEvent, List<Function>> _mCallbacks = {};

  void addListener(MessageHandlerEvent event, Function callback,
      {bool forceDelete = false}) {
    logger.i('MessageHandler: Add event $event');
    List<Function> callbacks = _mCallbacks[event] ?? [];
    if (forceDelete) {
      callbacks.clear();
    }
    callbacks.add(callback);
    _mCallbacks[event] = callbacks;
  }

  void removeListener(MessageHandlerEvent event, Function callback) {
    logger.i('MessageHandler: Remove event $event');
    List<Function> callbacks = _mCallbacks[event] ?? [];
    if (callbacks.contains(callback)) {
      callbacks.remove(callback);
    }
    _mCallbacks[event] = callbacks;
  }

  void notify<T>(MessageHandlerEvent event, {T? data}) {
    logger.i('MessageHandler: Notify event $event with $data');
    List<Function> callbacks = _mCallbacks[event] ?? [];
    for (final callback in callbacks) {
      if (data != null) {
        callback.call(data);
      } else {
        callback.call();
      }
    }
  }
}

enum MessageHandlerEvent {
  socketMessage,
  socketConversation,
  reloadConversation,
  messagesUnseenCount;
}
