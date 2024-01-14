import 'package:cached_network_image/cached_network_image.dart';
import 'package:expandable/expandable.dart';
import 'package:expandable_text/expandable_text.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_clone_instagram/src/app.dart';
import 'package:flutter_clone_instagram/src/component/avata_widget.dart';
import 'package:flutter_clone_instagram/src/component/image_data.dart';

class PostWidget extends StatelessWidget {
  const PostWidget({super.key});

  Widget _header() {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 10.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          AvataWidget(
            size: 45,
            thumbPath:
                'https://image.dongascience.com/Photo/2020/06/d7cdc8c0033067f76a66eec382a540e0.jpg',
            type: AvataType.POST_AVATA,
            nickname: '수영하는 돌고래',
          ),
          GestureDetector(
            onTap: () {},
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: ImageData(
                IconsPaths.postMoreIcon,
                width: 30,
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _image() {
    return CachedNetworkImage(
      fit: BoxFit.contain,
      imageUrl:
          'https://image.dongascience.com/Photo/2020/06/d7cdc8c0033067f76a66eec382a540e0.jpg',
    );
  }

  Widget _infoCount() {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 8.0, vertical: 4.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              ImageData(
                IconsPaths.likeOffIcon,
                width: 50,
              ),
              const SizedBox(
                width: 8,
              ),
              ImageData(
                IconsPaths.replyIcon,
                width: 50,
              ),
              const SizedBox(
                width: 8,
              ),
              ImageData(
                IconsPaths.directMessage,
                width: 50,
              ),
            ],
          ),
          ImageData(
            IconsPaths.bookMarkOffIcon,
            width: 40,
          )
        ],
      ),
    );
  }

  Widget _infoDescriptionLove(){
    return const Padding(
      padding: EdgeInsets.symmetric(horizontal: 8.0, vertical: 4.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          Text(
            "좋아요 6개",
            style: TextStyle(
              fontWeight: FontWeight.bold,
            ),
          ),
        ],
      ),
    );
  }
  Widget _infoDescriptionText() {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 8.0, vertical: 4.0),
      child: ExpandableNotifier(
        child: Row(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            Expandable(
              collapsed: ExpandableButton(
                child: const Text(
                  '개발하는 남자',
                  style: TextStyle(fontWeight: FontWeight.bold),
                ),
              ),
              expanded: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  ExpandableButton(
                    child: const Text(
                      '더보기',
                      style: TextStyle(color: Colors.blue),
                    ),
                  ),
                  const ExpandableText(
                    '콘텐츠1입니다.',
                    style: TextStyle(fontSize: 16),
                    maxLines: 3,
                    expandOnTextTap: true,
                    collapseOnTextTap: true,
                    expandText: '콘텐츠1입니다.\n콘텐츠1입니다.\n콘텐츠1입니다.\n콘텐츠1입니다.',
                  ),
                  ExpandableButton(
                    child: const Text(
                      '접기',
                      style: TextStyle(color: Colors.blue),
                    ),
                  ),
                ],
              ),
            ),

          ],
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(top: 20),
      height: 600,
      child: Column(
        children: [
          const SizedBox(
            height: 15,
          ),
          _header(),
          const SizedBox(
            height: 15,
          ),
          _image(),
          const SizedBox(
            height: 15,
          ),
          _infoCount(),
          _infoDescriptionLove(),
          _infoDescriptionText(),
          // _replyTextBtn(),
          // _dateAgo(),
        ],
      ),
    );
  }
}
