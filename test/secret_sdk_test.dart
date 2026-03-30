import 'package:flutter_test/flutter_test.dart';
import 'package:secret_sdk/secret_sdk.dart';
import 'package:secret_sdk/secret_sdk_platform_interface.dart';
import 'package:secret_sdk/secret_sdk_method_channel.dart';
import 'package:plugin_platform_interface/plugin_platform_interface.dart';

class MockSecretSdkPlatform
    with MockPlatformInterfaceMixin
    implements SecretSdkPlatform {

  @override
  Future<String?> getPlatformVersion() => Future.value('42');
}

void main() {
  final SecretSdkPlatform initialPlatform = SecretSdkPlatform.instance;

  test('$MethodChannelSecretSdk is the default instance', () {
    expect(initialPlatform, isInstanceOf<MethodChannelSecretSdk>());
  });

  test('getPlatformVersion', () async {
    SecretSdk secretSdkPlugin = SecretSdk();
    MockSecretSdkPlatform fakePlatform = MockSecretSdkPlatform();
    SecretSdkPlatform.instance = fakePlatform;

    expect(await secretSdkPlugin.getPlatformVersion(), '42');
  });
}
