import 'package:permission_handler/permission_handler.dart';

class Perms{
static Future<bool> getPerms() {
  return Permission.storage.request().then((perm) {
    return perm.isGranted;
  });
}

}