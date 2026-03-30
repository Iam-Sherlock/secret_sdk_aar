import 'dart:async';
import 'package:flutter/services.dart';

class MySecureSdk {
  static const MethodChannel _channel =
      MethodChannel('my_secure_sdk');

  static Future<String> getSecretMessage() async {
    final String result =
        await _channel.invokeMethod('getSecretMessage');
    return result;
  }
}