import 'dart:math';

import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class Search extends StatefulWidget {
  const Search({super.key});

  @override
  State<Search> createState() => _SearchState();
}

class _SearchState extends State<Search> {
  List<List<int>> groupBox = [[], [], []];
  List<int> groupIndex = [0, 0, 0];

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    for (var i = 0; i < 100; i++) {
      var gi = groupIndex.indexOf(groupIndex
          .reduce((value, element) => value < element ? value : element));
      var size = 1;
      if (gi != 1) {
        size = Random().nextInt(1000) % 2 == 0 ? 1 : 2;
      }
      groupBox[gi].add(size);
      groupIndex[gi] += size;
    }
    print(groupBox);
  }

  Widget _appbar() {
    return Row(
      children: [
        Expanded(
          child: Container(
            padding: const EdgeInsets.symmetric(
              vertical: 8,
              horizontal: 10,
            ),
            margin: const EdgeInsets.symmetric(
              vertical: 10,
              horizontal: 15,
            ),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(6),
              color: const Color(0xffefefef),
            ),
            child: const Row(
              children: [
                Icon(Icons.search),
                Text(
                  '검색',
                  style: TextStyle(
                    fontSize: 15,
                    color: Color(0xff838383),
                  ),
                )
              ],
            ),
          ),
        ),
        const Padding(
          padding: EdgeInsets.only(left: 5.0, right: 15.0),
          child: Icon(Icons.local_airport),
        ),
      ],
    );
  }

  Widget _body() {
    return SingleChildScrollView(
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          /*Expanded(
            child: Column(
              children: [
                Container(
                  height: 140,
                  color: Colors.red,
                ),
                Container(
                  height: 140,
                  color: Colors.blue,
                ),
              ],
            ),
          ),
          Expanded(
            child: Column(
              children: [
                Container(
                  height: 140,
                  color: Colors.blue,
                ),
                Container(
                  height: 140,
                  color: Colors.red,
                ),
              ],
            ),
          ),
          Expanded(
            child: Column(
              children: [
                Container(
                  height: 280,
                  color: Colors.grey,
                ),
              ],
            ),
          ),*/
          ...List.generate(
            groupBox.length,
            (index) => Expanded(
              child: Column(
                children: [
                  ...List.generate(
                    groupBox[index].length,
                    (jindex) => Container(
                      height: Get.width * 0.33 * groupBox[index][jindex],
                      decoration: BoxDecoration(
                          border: Border.all(color: Colors.white),
                          color: Colors.primaries[
                              Random().nextInt(Colors.primaries.length)]),
                      child: CachedNetworkImage(
                        imageUrl:
                            'https://flexible.img.hani.co.kr/flexible/normal/800/542/imgdb/original/2022/0713/20220713500264.jpg',
                        fit: BoxFit.cover,
                      ),
                    ),
                  )
                ],
                /*children: [
                  Container(
                    height: Get.width*0.33*groupBox[index],
                    color: Colors.red,
                  ),
                  Container(
                    height: 140,
                    color: Colors.blue,
                  ),
                ],*/
              ),
            ),
          ),
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Column(
          children: [
            _appbar(),
            Expanded(
              child: _body(),
            ),
          ],
        ),
      ),
    );
  }
}
