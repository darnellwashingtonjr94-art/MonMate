import 'package:permission_handler/permission_handler.dart';

class PermissionManager {
  static Future<bool> requestSocialPermissions() async {
    // Requesting both Camera and Microphone
    Map<Permission, PermissionStatus> statuses = await [
      Permission.camera,
      Permission.microphone,
    ].request();

    if (statuses[Permission.camera]!.isGranted &&
        statuses[Permission.microphone]!.isGranted) {
      return true;
    } else {
      // Logic for restricted or denied permissions
      return false;
    }
  }
}
