import 'package:flutter/cupertino.dart';
import 'package:get/get_navigation/get_navigation.dart';
import 'package:get/utils.dart';

class ImageData extends StatelessWidget {
  String icon;
  final double width;
  ImageData(
      this.icon,
      {
        Key? key,
        this.width=55,
      }
  ): super(key: key);

  @override
  Widget build(BuildContext context) {
    return Image.asset(
        icon,
        width: width! / Get.mediaQuery.devicePixelRatio,
    );
  }
}
