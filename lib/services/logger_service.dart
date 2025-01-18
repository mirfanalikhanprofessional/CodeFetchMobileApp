import 'dart:developer';

import 'package:flutter/foundation.dart';

class LoggerService {

  static logs(dynamic _) {
    if (kDebugMode || kProfileMode) {
      log(_.toString());
      // print(_);
    }
  }



}