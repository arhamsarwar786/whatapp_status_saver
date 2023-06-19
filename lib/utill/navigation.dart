import 'package:flutter/cupertino.dart';
import 'package:flutter/widgets.dart';

 pushScreen(BuildContext context, Widget screen) {
  return Navigator.push(context, CupertinoPageRoute(builder: (context) => screen));
}
