import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_clone_instagram/src/component/avata_widget.dart';

class ActivityHistory extends StatelessWidget {
  const ActivityHistory({super.key});

  Widget _activeBoxOne() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        // 둥근 image
        AvataWidget(
          type: AvataType.HISTORY_AVATA,
          thumbPath:
              'https://i.namu.wiki/i/w0kwpQCDJGNPdCxenIFpMo66pxRACizMbAz9wyymwr6r9aynMgMgqF2lbZ8Xl8jALndCmdKqEOcD5c1lxrEToA.webp',
        ),

        // 텍스트 + 시간
        const Flexible(
          child: Padding(
            padding: EdgeInsets.only(left: 10.0),
            child: Text.rich(
              TextSpan(
                  text: '정소연님, 도현',
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                  ),
                  children: [
                    TextSpan(
                      text: '님, 도현님의 지인의 사진 및 동영상을 보려면 팔로우하세요.',
                      style: TextStyle(
                        fontWeight: FontWeight.normal,
                      ),
                    ),
                    TextSpan(
                      text: '5 일전',
                      style: TextStyle(
                        fontWeight: FontWeight.normal,
                        fontSize: 13,
                        color: Colors.black54,
                      ),
                    ),
                  ],
              ),
            ),
          ),
        ),
      ],
    );
  }

  Widget _newRecentlyActiveView() {
    return Column(
      children: [
        Padding(
          padding: const EdgeInsets.symmetric(vertical: 10.0),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Container(
                child: const Text(
                  '오늘',
                  style: TextStyle(
                    color: Colors.grey,
                    fontSize: 18,
                  ),
                ),
              ),
            ],
          ),
        ),
        _activeBoxOne()
      ],
    );
  }

  Widget _newRecentlyThisWeekView() {
    return Column(
      children: [
        Padding(
          padding: const EdgeInsets.symmetric(vertical: 10.0),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Container(
                child: const Text(
                  '이번 주',
                  style: TextStyle(
                    color: Colors.grey,
                    fontSize: 18,
                  ),
                ),
              ),
            ],
          ),
        ),
        _activeBoxOne(),
        _activeBoxOne(),
        _activeBoxOne(),
        _activeBoxOne(),

      ],
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        centerTitle: true,
        title: const Text(
          '활동',
          style: TextStyle(
            fontSize: 25,
            fontWeight: FontWeight.bold,
            color: Colors.black,
          ),
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 15.0),
        child: SingleChildScrollView(
          child: Column(
            children: [
              _newRecentlyActiveView(),
              _newRecentlyThisWeekView(),
              // _newRecentlyMonthView(),
            ],
          ),
        ),
      ),
    );
  }
}
