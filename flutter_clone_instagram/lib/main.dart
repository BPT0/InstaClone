import 'package:flutter/material.dart';
import 'package:flutter_clone_instagram/src/App.dart';
import 'package:flutter_clone_instagram/src/binding/init_bindings.dart';
import 'package:get/get.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
        appBarTheme: const AppBarTheme(
          backgroundColor: Colors.white,
          titleTextStyle: TextStyle(color: Colors.black),
        ),
      ),
      initialBinding: InitBinding(),
      home: const App()
    ); // bottom네비게이션 관리, indexed 스택 써서 페이지에 맞게끔 변환시킴
  }
}
