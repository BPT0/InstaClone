import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_clone_instagram/src/app.dart';
import 'package:flutter_clone_instagram/src/component/avata_widget.dart';
import 'package:flutter_clone_instagram/src/component/expandable_text_widget.dart';
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

  Widget _infoDescriptionLove() {
    return const Row(
      mainAxisAlignment: MainAxisAlignment.start,
      children: [
        Text(
          "좋아요 6개",
          style: TextStyle(
            fontWeight: FontWeight.bold,
          ),
        ),
      ],
    );
  }

  Widget _infoNickName() {
    return const Row(
      children: [
        Text(
          'Dimo',
          style: TextStyle(fontWeight: FontWeight.bold),
        ),
      ],
    );
  }

  Widget _replyTextBtn() {
    return GestureDetector(
      onTap: () {},
      child: const Padding(
        padding: EdgeInsets.symmetric(horizontal: 15.0),
        child: Text(
          '댓글 199개 모두 보기',
          style: TextStyle(
            color: Colors.grey,
            fontSize: 13,
          ),
        ),
      ),
    );
  }

  Widget _dateAgo() {
    return const Padding(
      padding: EdgeInsets.symmetric(horizontal: 15.0),
      child: Text(
        '1일전',
        style: TextStyle(color: Colors.grey, fontSize: 11),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(top: 20),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          const SizedBox(height: 15),
          _header(),
          const SizedBox(height: 15),
          _image(),
          const SizedBox(height: 15),
          _infoCount(),
          Padding(
            padding: const EdgeInsets.symmetric(
              horizontal: 12.0,
              vertical: 4.0,
            ),
            child: Column(
              children: [
                _infoDescriptionLove(),
                _infoNickName(),
                const ExpandableTextWidget(),
              ],
            ),
          ),
          const SizedBox(height: 15),
          _replyTextBtn(),
          const SizedBox(height: 15),
          _dateAgo(),
        ],
      ),
    );
  }
}
