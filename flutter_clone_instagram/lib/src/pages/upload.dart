import 'package:flutter/material.dart';
import 'package:flutter_clone_instagram/src/app.dart';
import 'package:flutter_clone_instagram/src/component/image_data.dart';
import 'package:get/get.dart';

class Upload extends StatelessWidget {
  const Upload({Key? key}) : super(key: key);

  Widget _imagePreview() {
    return Container(
      width: Get.width,
      height: Get.width,
      color: Colors.black,
    );
  }

  Widget _header() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        const Padding(
          padding: EdgeInsets.all(8.0),
          child: Row(
            children: [
              Text(
                '갤러리',
                style: TextStyle(
                  color: Colors.black,
                  fontSize: 18,
                ),
              ),
              Icon(Icons.arrow_drop_down),
            ],
          ),
        ),

        // padding
        //  - Row
        //    - 클릭 처리(GestureDector)
        //    Q. stateful 위젯 하위에는 stateless 위젯 배치 불가한가요?
        //      - Text(갤러리)
        //      - 아래 화살표 이미지

        Row(
          mainAxisAlignment: MainAxisAlignment.end,
          children: [
            Expanded(
              child: Container(
                decoration: const BoxDecoration(
                    shape: BoxShape.circle, color: Colors.grey),
                child: const Row(
                  children: [
                    Icon(Icons.layers),
                    Text('여러 항목 선택'),
                  ],
                ),
              ),
            ),

            // 1.여러항목 선택 버튼
            // - GestureDector(제스쳐 감지) - 공식 문서에 정의된 제스처의 종류는?
            // - Container
            //  - BoxDeco(둥근 사각)
            //    - Icons(여러겹 아이콘)
            //    - Text('여러 항목 선택')
            // 2.사진 찍기 버튼
            // - ImageData(카메라 이미지 모양)
          ],
        ),
      ],
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.blue,
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
        leading: GestureDetector(
          onTap: () {},
          child: Padding(
            padding: const EdgeInsets.all(15.0),
            child: ImageData(IconsPaths.closeImage),
          ),
        ),
        title: const Text(
          'New Post',
          style: TextStyle(
            fontWeight: FontWeight.bold,
            fontSize: 20,
            color: Colors.black,
          ),
        ),
        actions: [
          GestureDetector(
            onTap: () {},
            child: Padding(
              padding: const EdgeInsets.all(15.0),
              child: ImageData(IconsPaths.nextImage),
            ),
          ),
        ],
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            _header(),
            _imagePreview(),
          ],
        ),
      ),
    );
  }
}
