import 'dart:io';

import 'package:flutter/material.dart';


import '../view/full_screen.dart';


class CustomCard extends StatefulWidget {
  final Map<String,String>? vid; 
  final String? path;
  final bool? isVideo;
  const CustomCard({this.path,this.isVideo=false, this.vid});

  @override
  _CustomCardState createState() => _CustomCardState();
}

class _CustomCardState extends State<CustomCard> {
  File? vidFile;
  @override
  void initState() {
    // this.widget.isVideo?initThumbNail():null;
    super.initState();
  }


  // void initThumbNail()async{
  //   final tmp = await getTemporaryDirectory();
  //   // String p = await VideoThumbnail.thumbnailFile(video: widget.path,thumbnailPath: tmp.path);
  //   String p = await Thumbnails.getThumbnail(videoFile: widget.path,thumbnailFolder: tmp.path , imageType: ThumbFormat.PNG,quality: 30);
  //   vidFile = File(p);
  //   setState(() {
  //   });
  // }
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: InkWell(
        onTap: ()=>Navigator.of(context).push(MaterialPageRoute(builder:(ctx)=>FullScreen(path: this.widget.path??this.widget.vid!["video"].toString(),isVideo: this.widget.isVideo!,))),
              child: Hero( tag: this.widget.path??widget.vid!["video"].toString(),
          child: Container(
          // child: this.widget.isVideo?(vidFile == null?CircularProgressIndicator():Image.file(vidFile)):SizedBox(),
          decoration: BoxDecoration(
            image:  DecorationImage(fit: BoxFit.cover,image:FileImage(File(widget.isVideo!?this.widget.vid!["thumb"].toString():this.widget.path.toString()))),
                color: Colors.black,
                borderRadius: BorderRadius.circular(10),
                // boxShadow: [
                //   BoxShadow(
                //       color: shadow_color,
                //       offset: Offset(0, 1),
                //       blurRadius: 5,
                //       spreadRadius: .5)
                // ]
                ),
        ),
              ),
      ),
    );
  }
}
