import 'package:plugin_platform_interface/plugin_platform_interface.dart';

import 'secret_sdk_method_channel.dart';

abstract class SecretSdkPlatform extends PlatformInterface {
  /// Constructs a SecretSdkPlatform.
  SecretSdkPlatform() : super(token: _token);

  static final Object _token = Object();

  static SecretSdkPlatform _instance = MethodChannelSecretSdk();

  /// The default instance of [SecretSdkPlatform] to use.
  ///
  /// Defaults to [MethodChannelSecretSdk].
  static SecretSdkPlatform get instance => _instance;

  /// Platform-specific implementations should set this with their own
  /// platform-specific class that extends [SecretSdkPlatform] when
  /// they register themselves.
  static set instance(SecretSdkPlatform instance) {
    PlatformInterface.verifyToken(instance, _token);
    _instance = instance;
  }

  Future<String?> getPlatformVersion() {
    throw UnimplementedError('platformVersion() has not been implemented.');
  }
}
