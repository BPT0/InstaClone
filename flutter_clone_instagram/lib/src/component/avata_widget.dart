import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

// 원의 다양한 모양을 분류하기 위해 enum으로 type을 분류
enum AvataType { OTHER_STORY_AVATA, MY_STORY_AVATA, PROFILE_BOTTOM_AVATA }

class AvataWidget extends StatelessWidget {
  bool? hasStory;
  String thumbPath;
  AvataType? type;
  String? nickname;
  double? size;

  AvataWidget({
    super.key,
    this.hasStory,
    required this.thumbPath,
    required this.type,
    this.nickname,
    this.size=65,
  });

  // 그라데이션 있음
  Widget OtherStoryAvataWidget() {
    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 5),
      padding: const EdgeInsets.all(2),
      decoration: const BoxDecoration(
        gradient: LinearGradient(
            begin: Alignment.topRight,
            end: Alignment.bottomLeft,
            colors: [
              Colors.purple,
              Colors.orange,
            ]),
        shape: BoxShape.circle,
      ),
      child: MyStoryAvataWidget()
    );
  }

  Widget MyStoryAvataWidget(){
    return Container(
        padding: const EdgeInsets.all(2),
        decoration: const BoxDecoration(
          shape: BoxShape.circle,
          color: Colors.white,
        ),
        child: ClipRRect(
          borderRadius: BorderRadius.circular(size!),
          child: SizedBox(
            width: size,
            height: size,
            child: CachedNetworkImage(
              imageUrl: thumbPath,
              fit: BoxFit.cover,
            ),
          ),
        ),
    );
  }

  @override
  Widget build(BuildContext context) {
    switch (type) {
      case AvataType.OTHER_STORY_AVATA:
        return OtherStoryAvataWidget();
      case AvataType.MY_STORY_AVATA:
        return MyStoryAvataWidget();
      // return StoryBoardAvataWidget();
      case AvataType.PROFILE_BOTTOM_AVATA:
        break;
      //return ProfileBottomAvataWidget();
    }
    return Container();
  }
}
