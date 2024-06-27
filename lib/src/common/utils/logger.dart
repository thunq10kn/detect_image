import 'package:firebase_crashlytics/firebase_crashlytics.dart';
import 'package:flutter/foundation.dart';
import 'package:roggle/roggle.dart';

import 'platforms.dart';

/// Logger
///
/// Logs are output to the console during debug builds,
/// but nowhere during release builds.
///
/// The usage of each log level is as follows:
///
/// LowLevel
///
/// ^ verbose (v): For large output quantities
///
/// | debug (d): For temporary use during debugging
///
/// | info (i): For normal logging, such as user events
///
/// | warning (w): For warnings
///
/// | error (e): For errors
///
/// v wtf (w): For impossible events
///
/// HighLevel
final logger = kReleaseMode && AppPlatform.isMobile
    ? Roggle.crashlytics(
        printer: CrashlyticsPrinter(
          errorLevel: Level.error,
          onError: (event) {
            FirebaseCrashlytics.instance.recordError(
              event.exception,
              event.stack,
              fatal: true,
            );
          },
          onLog: (event) {
            // The logs recorded here are displayed in the logs tab of
            // the firebase console
            FirebaseCrashlytics.instance.log(event.message);
          },
        ),
      )
    : Roggle(
        printer: SinglePrettyPrinter(
          loggerName: '[APP]',
          // Output stack trace when log level is above warning
          stackTraceLevel: Level.warning,
          // iOS does not support color
          colors: !AppPlatform.isIOS,
          // Hides the log because it becomes long
          printCaller: false,
        ),
      );
