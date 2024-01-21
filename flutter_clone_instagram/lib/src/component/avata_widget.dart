import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';

// 원의 다양한 모양을 분류하기 위해 enum으로 type을 분류
enum AvataType { OTHER_STORY_AVATA, MY_STORY_AVATA, POST_AVATA, HISTORY_AVATA,
  PROFILE_DISCOVER_AVATA,}

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
    this.size = 65,
  });

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
        child: MyStoryAvataWidget());
  }

  Widget MyStoryAvataWidget() {
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

  Widget PostAvataWidget() {
    return Row(
      children: [
        OtherStoryAvataWidget(),
        Text(
          nickname ?? '',
          style: const TextStyle(
            fontWeight: FontWeight.bold,
            fontSize: 18,
          ),
        )
      ],
    );
  }

  Widget HistoryAvata(){
    return Container(
      padding: const EdgeInsets.all(2),
      decoration: const BoxDecoration(
        shape: BoxShape.circle,
        color: Colors.white,
      ),
      child: ClipRRect(
        borderRadius: BorderRadius.circular(size!),
        child: SizedBox(
          width: 45,
          height: 45,
          child: CachedNetworkImage(
            imageUrl: thumbPath,
            fit: BoxFit.cover,
          ),
        ),
      ),
    );
  }

  Widget HistoryAvata(){
    return Container(
      padding: const EdgeInsets.all(2),
      decoration: const BoxDecoration(
        shape: BoxShape.circle,
        color: Colors.white,
      ),
      child: ClipRRect(
        borderRadius: BorderRadius.circular(size!),
        child: SizedBox(
          width: 45,
          height: 45,
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
      case AvataType.POST_AVATA:
        return PostAvataWidget();
      case AvataType.HISTORY_AVATA:
        return HistoryAvata();
      case AvataType.MYPAGE_USER_DISCOVER_PEOPLE_AVATA:
        return ();
    }
    return Container();
  }
}
