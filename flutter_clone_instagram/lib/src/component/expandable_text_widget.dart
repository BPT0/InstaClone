import 'package:flutter/material.dart';
import 'package:expandable/expandable.dart';

class ExpandableTextWidget extends StatelessWidget {
  const ExpandableTextWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return ExpandableNotifier(
      child: Row(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          Column(
            children: [
              Expandable(
                collapsed: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    const Text(
                      '콘텐츠1입니다...',
                      style: TextStyle(fontWeight: FontWeight.w800),
                      softWrap: true,
                      maxLines: 1,
                      overflow: TextOverflow.ellipsis,
                    ),
                    ExpandableButton(
                      child: const Text(
                        '더보기',
                        style: TextStyle(color: Colors.grey),
                        softWrap: true,
                        overflow: TextOverflow.ellipsis,
                      ),
                    ),
                  ],
                ),
                expanded: const Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                      Text(
                        '콘텐츠1입니다.콘텐츠1입니다\n콘텐츠1입니다.\n콘텐츠1입니다.\n콘텐츠1입니다.',
                        softWrap: true,
                        overflow: TextOverflow.visible,
                      ),
                    ]),
                  ],
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
