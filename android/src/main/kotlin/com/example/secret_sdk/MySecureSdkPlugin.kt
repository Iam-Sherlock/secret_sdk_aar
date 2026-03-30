package com.example.secret_sdk

import io.flutter.embedding.engine.plugins.FlutterPlugin
import io.flutter.plugin.common.MethodCall
import io.flutter.plugin.common.MethodChannel
import io.flutter.plugin.common.MethodChannel.MethodCallHandler
import io.flutter.plugin.common.MethodChannel.Result

class MySecureSdkPlugin : FlutterPlugin, MethodCallHandler {

  private lateinit var channel : MethodChannel

  override fun onAttachedToEngine(binding: FlutterPlugin.FlutterPluginBinding) {
    channel = MethodChannel(binding.binaryMessenger, "my_secure_sdk")
    channel.setMethodCallHandler(this)
  }

  override fun onMethodCall(call: MethodCall, result: Result) {
    if (call.method == "getSecretMessage") {

      // 🔐 YOUR SECRET LOGIC HERE (hidden from Flutter)
      val secret = generateSecret()

      result.success(secret)
    } else {
      result.notImplemented()
    }
  }

  private fun generateSecret(): String {
    return "Super Secret Value 🚀 'Hi Raghunathan! The AAR Method is Working'"
  }

  override fun onDetachedFromEngine(binding: FlutterPlugin.FlutterPluginBinding) {
    channel.setMethodCallHandler(null)
  }
}