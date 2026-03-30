
import 'secret_sdk_platform_interface.dart';

class SecretSdk {
  Future<String?> getPlatformVersion() {
    return SecretSdkPlatform.instance.getPlatformVersion();
  }
}
