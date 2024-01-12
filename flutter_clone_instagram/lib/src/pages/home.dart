import 'package:flutter/material.dart';
import 'package:flutter_clone_instagram/src/app.dart';
import 'package:flutter_clone_instagram/src/component/avata_widget.dart';
import 'package:flutter_clone_instagram/src/component/image_data.dart';

class Home extends StatelessWidget {
  const Home({super.key});

  Widget _myStory() {
    return Stack(
      children: [
        AvataWidget(
          thumbPath:
              'https://image.dongascience.com/Photo/2020/06/d7cdc8c0033067f76a66eec382a540e0.jpg',
          type: AvataType.MY_STORY_AVATA,
          size: 70,
        ),
        Positioned(
            right: 5,
            bottom: 0,
            child: Container(
              width: 25,
              height: 25,
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                color: Colors.blue,
                border: Border.all(
                  color: Colors.white,
                  width: 2,
                ),
              ),
              child: const Center(
                child: Text(
                  '+',
                  style: TextStyle(
                    fontSize: 20,
                    color: Colors.white,
                    height: 1.1,
                  ),
                ),
              ),
            ))
      ],
    );
  }

  Widget _storyBoardList() {
    return SingleChildScrollView(
        scrollDirection: Axis.horizontal,
        child: Row(children: [
          const SizedBox(
            width: 15,
          ),
          _myStory(),
          const SizedBox(
            width: 5,
          ),
          ...List.generate(
              100,
              (index) => AvataWidget(
                    thumbPath:
                        'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcRyO54ePwijeKy1Md4reqPPtI3jUX1fXNSGqg&usqp=CAU',
                    type: AvataType.OTHER_STORY_AVATA,
                  )),
        ]));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        title: ImageData(
          IconsPaths.logo,
          width: 270,
        ),
        actions: [
          GestureDetector(
            onTap: () {},
            child: Padding(
              padding: const EdgeInsets.all(15.0),
              child: ImageData(
                IconsPaths.directMessage,
                width: 50,
              ),
            ),
          )
        ],
      ),
      body: ListView(
        children: [
          _storyBoardList(),
        ],
      ),
    );
  }
}
