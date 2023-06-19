import 'dart:io';
import 'package:flutter/material.dart';
import 'package:path_provider/path_provider.dart';
import 'package:video_thumbnail/video_thumbnail.dart';
import 'package:uuid/uuid.dart';

class MainOps {
  static void save(BuildContext context, String path) async {
    try {
      var dir = Directory("/storage/emulated/0/saver/");
      if (await dir.exists()) {
        print("exist");
      } else {
        await dir.create(recursive: true);
      }
      var uuid = Uuid().v1();
      var ext = path.split('.').last;
      await File(path).copy('${dir.path}${uuid}.$ext');
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Text("Saved!"),
          duration: Duration(seconds: 1),
        ),
      );
    } catch (e) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Text("Err!"),
          duration: Duration(seconds: 1),
        ),
      );
    }
  }

  static Future<String?> initThumbnail(String path) async {
    final tmp = await getTemporaryDirectory();
    String? thumb = await VideoThumbnail.thumbnailFile(
      video: path,
      thumbnailPath: tmp.path,
      imageFormat: ImageFormat.PNG,
      maxHeight: 64,
      quality: 30,
    );
    return thumb;
  }
}
