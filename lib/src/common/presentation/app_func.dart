import 'dart:async';

import 'package:file_picker/file_picker.dart';
import 'package:flutter/material.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:intl/intl.dart';

part 'date_func.dart';

class AppFunc {
  static final date = DateFunc();
  static StreamSubscription? showLoadingTimeout;

  static Timer setInterval(Function callback, int milliseconds) {
    return Timer.periodic(Duration(milliseconds: milliseconds), (timer) {
      callback();
    });
  }

  static void clearInterval(Timer subscription) {
    try {
      subscription.cancel();
    } catch (e) {
      print(e);
    }
  }

  String convertDateTime(String dateTime) {
    DateTime _dateTime = DateFormat('dd/MM/yyyy').parse(dateTime);
    return DateFormat('yyyy-MM-dd').format(_dateTime);
  }

  DateTime convertDate(String dateTime) {
    DateTime _dateTime = DateFormat('yyyy-MM-dd').parse(dateTime);
    return _dateTime;
  }

  static StreamSubscription setTimeout(Function callback, int milliseconds) {
    final future = Future.delayed(Duration(milliseconds: milliseconds));
    return future.asStream().listen((event) {}, onDone: () {
      callback();
    });
  }

  Future<void> getImage({Function? callBack}) async {
    FilePickerResult? result = await FilePicker.platform.pickFiles(
        type: FileType.custom, allowedExtensions: ['png', 'jpg', 'jpeg']);
    if (result != null) {
      PlatformFile file = result.files.first;
      if (file.bytes != null) {
        callBack?.call(file);
      }
    } else {
      // User canceled the picker
    }
  }

  static void clearTimeout(StreamSubscription subscription) {
    try {
      subscription.cancel();
    } catch (e) {
      print(e.toString());
    }
  }

  static showAlertDialog(BuildContext context,
      {String? message,
      String? title,
      Widget? contentWidget,
      bool isShowTitle = true}) {
    // set up the button
    Widget okButton = TextButton(
      child: const Text("はい"),
      onPressed: () {
        Navigator.pop(context);
      },
    );

    // set up the AlertDialog
    AlertDialog alert = AlertDialog(
      title: isShowTitle ? Text(title ?? "エラー!") : null,
      content: contentWidget ?? Text(message ?? ''),
      actions: [
        okButton,
      ],
    );

    // show the dialog
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return alert;
      },
    );
  }

  showPopupWarning(BuildContext context) {
    Widget continueButton(BuildContext mContext) => TextButton(
          child: const Text("同意"),
          onPressed: () {
            Navigator.pop(mContext);
          },
        );

    // set up the AlertDialog
    AlertDialog alert(BuildContext mContext) => AlertDialog(
          title: const Text("アカウントの作成ありがとうございます。"),
          content: const Text(
            '店舗情報の入力、プランの選択をお願いいたします。\n'
            '物件の入力は可能ですが、物件がアプリ上にアップされるには上記の入力が必須になります。\n\n'
            'よろしくお願いいたします。',
          ),
          actions: [
            continueButton(mContext),
          ],
        );
    // show the dialog
    showDialog(
      context: context,
      barrierDismissible: false,
      builder: (BuildContext context) {
        return alert(context);
      },
    );
  }

  static String getLetterAvatar(String name) {
    final tmp = name.split(' ');
    if (tmp.length >= 2) {
      String tmp1 = tmp[0];
      String tmp2 = tmp[tmp.length - 1];
      return '${tmp1[0]}${tmp2[0]}'.toUpperCase();
    } else if (name.length > 1) {
      return '${name[0]}${name[1]}'.toUpperCase();
    } else {
      return name.toUpperCase();
    }
  }

  static void hideLoading() {
    if (showLoadingTimeout != null) {
      clearTimeout(showLoadingTimeout!);
      showLoadingTimeout = null;
    }
    if (EasyLoading.isShow) {
      EasyLoading.dismiss();
    }
  }

  static void showToast(String message) {
    EasyLoading.showToast(message);
  }

  static String joinName(List<String?>? listData) {
    String name = '';
    for (int i = 0; i < (listData?.length ?? 0); i++) {
      String? element = listData?[i];
      if (element?.isNotEmpty ?? false) {
        name += (element ?? '') +
            ((i != ((listData?.length ?? 0) - 1)) ? ' - ' : '');
      }
    }
    listData?.forEach((element) {});
    return name;
  }

  static Future<void> waitForContext(
      Function(BuildContext context) callback) async {
    // int dem = 0;
    // while (true) {
    //   if (SessionManager().getContext != null) {
    //     callback.call(SessionManager().getContext!);
    //     break;
    //   }
    //   if (dem >= 30) {
    //     break;
    //   }
    //   dem++;
    //   await Future.delayed(const Duration(milliseconds: 500));
    // }
  }

  String numberFormat(int num) {
    final formatter = NumberFormat("#,###");
    return formatter.format(num);
  }
}
