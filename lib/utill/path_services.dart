import 'dart:async';
import 'dart:io';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../provider/images_provider.dart';
import '../provider/videos_provider.dart';
import 'ops.dart';

class PathServices {
  PathServices._() {
    _dir = Directory('/storage/emulated/0/Whatsapp/Media/.Statuses');
  }
  Directory? _dir;
  static final instance = PathServices._();

  Future fetchFiles(BuildContext context) async {
    final imgProvider = Provider.of<ImagesProvider>(context, listen: false);
    final vidProvider = Provider.of<VideosProvider>(context, listen: false);
    if (!this._dir!.existsSync()) {
      throw new Exception("path doesn't exist!");
    }
    _dir!.listSync().forEach((element) async {
      var tmp = element.path.split('.');
      if (tmp.last == 'png' || tmp.last == "jpg")
        imgProvider.setImage = element.path;
      else if (tmp.last == 'mp4') {
        String thumbnail = await MainOps.initThumbnail(element.path) ?? "";
        vidProvider.setVideo = {"video": element.path, "thumb": thumbnail};
      }
    });
  }
}
