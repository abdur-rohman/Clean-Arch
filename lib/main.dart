import 'package:clean_arch/app/di/app_module.dart';
import 'package:clean_arch/app/presentation/pages/home/home_page.dart';
import 'package:flutter/material.dart';

void main() {
  AppModule.init();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: HomePage(),
    );
  }
}
