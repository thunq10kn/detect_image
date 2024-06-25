// ignore_for_file: constant_identifier_names

import 'package:collection/collection.dart';

import '../presentation/app_images.dart';

enum TypeMessage {
  LIKE,
  TALK,
  VISIT,
  TEXT,
  FILE,
  IMAGE;

  static TypeMessage? parseOrNull(String? key) =>
      TypeMessage.values.firstWhereOrNull((e) => e.key == key);

  static TypeMessage parse(String? key) =>
      TypeMessage.values.firstWhere((e) => e.key == key);
}

extension TypeMessageEx on TypeMessage {
  String get key {
    switch (this) {
      case TypeMessage.LIKE:
        return 'LIKE';
      case TypeMessage.TALK:
        return 'TALK';
      case TypeMessage.VISIT:
        return 'VISIT';
      case TypeMessage.TEXT:
        return 'TEXT';
      case TypeMessage.FILE:
        return 'FILE';
      case TypeMessage.IMAGE:
        return 'IMAGE';
    }
  }
}

enum TypeAction {
  LIKE,
  TALK,
  VISIT;

  static TypeAction? parseOrNull(String? key) =>
      TypeAction.values.firstWhereOrNull((e) => e.key == key);

  static TypeAction parse(String? key) =>
      TypeAction.values.firstWhere((e) => e.key == key);
}

extension TypeActionEx on TypeAction {
  String get key {
    switch (this) {
      case TypeAction.LIKE:
        return 'LIKE';
      case TypeAction.TALK:
        return 'TALK';
      case TypeAction.VISIT:
        return 'VISIT';
    }
  }

  String get icon {
    switch (this) {
      case TypeAction.LIKE:
        return AppAssets.icLike;
      case TypeAction.TALK:
        return AppAssets.icButtonDiscuss;
      case TypeAction.VISIT:
        return AppAssets.icButtonVisit;
    }
  }

  String get description {
    switch (this) {
      case TypeAction.LIKE:
        return '「いいね」を送信しました';
      case TypeAction.TALK:
        return '「相談したい」を送信しました';
      case TypeAction.VISIT:
        return '「見学したい」を送信しました';
    }
  }
}

enum ConversationStatus {
  NONE,
  IN_CONSULTATION,
  LIKE,
  ADJUST_TOUR_SCHEDULE,
  TOUR_DATE_CONFIRMED,
  AFTER_TOUR,
  CONTRACTED,
  POSTING_ENDED,
  ANOTHER;

  static ConversationStatus? parseOrNull(String? key) =>
      ConversationStatus.values.firstWhereOrNull((e) => e.key == key);

  static ConversationStatus parse(String? key) =>
      ConversationStatus.values.firstWhere((e) => e.key == key);
}

extension ConversationStatusEx on ConversationStatus {
  String get key {
    switch (this) {
      case ConversationStatus.NONE:
        return 'NONE';
      case ConversationStatus.IN_CONSULTATION:
        return 'IN_CONSULTATION';
      case ConversationStatus.LIKE:
        return 'LIKE';
      case ConversationStatus.ADJUST_TOUR_SCHEDULE:
        return 'ADJUST_TOUR_SCHEDULE';
      case ConversationStatus.TOUR_DATE_CONFIRMED:
        return 'TOUR_DATE_CONFIRMED';
      case ConversationStatus.AFTER_TOUR:
        return 'AFTER_TOUR';
      case ConversationStatus.CONTRACTED:
        return 'CONTRACTED';
      case ConversationStatus.POSTING_ENDED:
        return 'POSTING_ENDED';
      case ConversationStatus.ANOTHER:
        return 'ANOTHER';
    }
  }

  String get titleDropDown {
    switch (this) {
      case ConversationStatus.NONE:
        return '選択する';
      case ConversationStatus.IN_CONSULTATION:
        return 'いいね';
      case ConversationStatus.LIKE:
        return '相談中';
      case ConversationStatus.ADJUST_TOUR_SCHEDULE:
        return '見学日程調整中';
      case ConversationStatus.TOUR_DATE_CONFIRMED:
        return '見学日確定';
      case ConversationStatus.AFTER_TOUR:
        return '見学後検討中';
      case ConversationStatus.CONTRACTED:
        return '成約済';
      case ConversationStatus.POSTING_ENDED:
        return '掲載終了';
      case ConversationStatus.ANOTHER:
        return '別スレッド移動';
    }
  }

  String get title {
    switch (this) {
      case ConversationStatus.NONE:
        return '未定';
      case ConversationStatus.IN_CONSULTATION:
        return 'いいね';
      case ConversationStatus.LIKE:
        return '相談中';
      case ConversationStatus.ADJUST_TOUR_SCHEDULE:
        return '見学日程調整中';
      case ConversationStatus.TOUR_DATE_CONFIRMED:
        return '見学日確定';
      case ConversationStatus.AFTER_TOUR:
        return '見学後検討中';
      case ConversationStatus.CONTRACTED:
        return '成約済';
      case ConversationStatus.POSTING_ENDED:
        return '掲載終了';
      case ConversationStatus.ANOTHER:
        return '別スレッド移動';
    }
  }
}

enum StoreStatus {
  AWAITING_APPROVAL,
  APPROVED,
  REJECT,
  RE_APPROVED,
  AWAITING,
  NOT_REGISTERED;

  static StoreStatus parse(String? key) =>
      StoreStatus.values.firstWhere((e) => e.key == key);
  static StoreStatus? parseOrNull(String? key) =>
      StoreStatus.values.firstWhereOrNull((e) => e.key == key);

  String get key {
    switch (this) {
      case StoreStatus.AWAITING_APPROVAL:
        return 'AWAITING_APPROVAL';
      case StoreStatus.APPROVED:
        return 'APPROVED';
      case StoreStatus.REJECT:
        return 'REJECT';
      case StoreStatus.RE_APPROVED:
        return 'RE_APPROVED';
      case StoreStatus.AWAITING:
        return 'AWAITING';
      case StoreStatus.NOT_REGISTERED:
        return 'NOT_REGISTERED';
    }
  }

  String get label {
    switch (this) {
      case StoreStatus.AWAITING_APPROVAL:
        return '審査中';
      case StoreStatus.APPROVED:
        return '承認済み';
      case StoreStatus.REJECT:
        return '差戻し';
      case StoreStatus.RE_APPROVED:
        return '再審査中';
      case StoreStatus.AWAITING:
        return '未申請';
      case StoreStatus.NOT_REGISTERED:
        return '未申請';
    }
  }
}

enum FirebaseAuthMode { resetPassword, recoverEmail, verifyEmail }
