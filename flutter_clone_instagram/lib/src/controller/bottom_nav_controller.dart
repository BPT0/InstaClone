import 'dart:io';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../component/popup/message_popup.dart';
import '../pages/upload.dart';

// value 를 구분하기 위해 enum을 사용해서 코드 가독성 높이기
enum PageNum { HOME, SEARCH, UPLOAD, ACTIVITY, MYPAGE }

/**
 * 1. 아이콘 누를대마다 페이지 전환하기
 *  + 업로드 이벤트 별도 처리
 * 2.뒤로가기 버튼을 눌러서 이전 페이지로 돌아가기
 * 3.같은 버튼을 눌렀을때 
 *  - 히스토리 추가x
 *  - 히스토리를 누적
 */
class BottomNavController extends GetxController {
  RxInt pageIndex = 0.obs;
  List<int> bottomHistory = [0];

  void changeBottomNav(int value, {bool hasGesture = true}) {
    var page = PageNum.values[value];
    switch (page) {
      // upload 에서는 페이지 이벤트 별도 처리
      case PageNum.UPLOAD:
        Get.to(() => const Upload());
        break;
      case PageNum.HOME:
      case PageNum.SEARCH:
      case PageNum.ACTIVITY:
      case PageNum.MYPAGE:
        _changePage(value, hasGesture: hasGesture);
        break;
    }
  }

  void _changePage(int value, {bool hasGesture = true}) {
    pageIndex(value);
    // 백버튼 액션으로 뒤로가기시 히스토리 추가x
    if (!hasGesture) return;
    // 히스토리를 누적하기
    if (bottomHistory.last != value) {
      bottomHistory.add(value);
    }
    // 동일 버튼 눌렀을 때 히스토리 추가x
    if (!bottomHistory.contains(value)) {
      bottomHistory.remove(value);
    }
    print(bottomHistory);
  }

  Future<bool> willPopAction() async {
    if (bottomHistory.length == 1) {
      showDialog(
          context: Get.context!,
          builder: (context) => MessagePopup(
                title: '시스템',
                okCallback: () {
                  exit(0);
                },
                cancelCallback: Get.back,
                message: '종료하시겠습니까?',
              ));
      return true; // true로 하면 앱이 pause 상태로 변경
    } else {
      print('goto before page!');
      bottomHistory.removeLast();
      var index = bottomHistory.last;
      changeBottomNav(index, hasGesture: false);
      return false;
    }
  }
}
