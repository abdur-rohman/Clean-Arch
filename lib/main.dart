import 'package:clean_arch/app/di/app_module.dart';
import 'package:clean_arch/app/navigator.dart';
import 'package:clean_arch/app/presentation/pages/home/home_page.dart';
import 'package:flutter/material.dart';
import 'package:injector/injector.dart';

void main() {
  AppModule.init();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final appNavigator = Injector.appInstance.get<AppNavigator>();

    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: HomePage(),
      onGenerateRoute: appNavigator.onGenerateRoutes,
    );
  }
}
